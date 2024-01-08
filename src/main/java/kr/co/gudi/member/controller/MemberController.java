package kr.co.gudi.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.member.dto.Department;
import kr.co.gudi.member.dto.MemberDTO;
import kr.co.gudi.member.service.MemberService;
import kr.co.gudi.member.vo.MemberVO;

@Controller
public class MemberController {
	@Value("${spring.servlet.multipart.location}") private String root;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberService service;
	
	
	// 로그인 페이지 이동
	@RequestMapping("/loginPage")
	public String loginPage() {
		return "member/login";
	}

	// 로그인 실패 시
	@RequestMapping("/login/fail")
	public String loginFail(Model model) throws IllegalAccessException{
		model.addAttribute("msg", "로그인에 실패하였습니다!!");
		model.addAttribute("url", "/loginPage");
		return "common/msg";
	}
	
	// 로그인 성공 시
	@RequestMapping("/login/success")
	public String login(@RequestParam Map<String, Object> param, HttpSession session) {
		MemberVO loginMember = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		session.setAttribute("loginMember", loginMember);	// 로그인 정보 저장
		return "redirect:/main";
	}
	
	// 권한 불일치
	@RequestMapping("/error/auth")
	public String errorAuth(Model model) throws IllegalAccessException{
		model.addAttribute("msg", "사용 권한이 없습니다.");
		model.addAttribute("url", "/main");
		return "common/msg";
	}
	
	// 로그인 없이 접근 시
	@RequestMapping("/error/login")
	public String errorLogin(Model model) throws IllegalAccessException{
		model.addAttribute("msg", "로그인이 필요한 서비스입니다!!");
		model.addAttribute("url", "/loginPage");
		return "common/msg";
	}
	
	// 마이 페이지 이동
	@GetMapping("/mypage")
	public String enrollView(Model model, HttpSession session) {
		/*
		String member_id = ((MemberVO)session.getAttribute("loginMember")).getMember_id();
		model.addAttribute("loginMember", member_id);
		*/
		MemberVO vo = service.getMember();
		 session.setAttribute("loginMember", vo);
		 model.addAttribute("loginMember", vo);
		return "member/mypage";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
		return "member/login";
	}
	
	// 프로필 이미지 저장
	@PostMapping("/member/profile")
	public String updateProfile(MultipartFile profileImg, HttpSession session, Model model) {
				logger.info("사진 저장 컨트롤러 접근 성공!");
				String file_oriname = profileImg.getOriginalFilename();
				logger.info("file_oriname : " + file_oriname);
				
		try {
				if (!file_oriname.equals("")) {	// 파일이 있으면 실행
					logger.info("파일 확인 완료!");
					
					Date today = new Date(System.currentTimeMillis());
					String ext = file_oriname.substring(file_oriname.lastIndexOf("."));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
					
					int random = (int) ((Math.random() * 10000) + 1);
					String file_newname = sdf.format(today) + "_" + random + ext;
					logger.info("file_newname : " + file_newname);
					
					String path = root+	file_newname;	// 파일 저장 경로
					logger.info("path : " + path);
					
					profileImg.transferTo(new File(path));
					logger.info("profileImg : "+profileImg);
					
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("file_newname", file_newname);
					param.put("member_no", ((MemberVO)session.getAttribute("loginMember")).getMember_no());
					param.put("file_oriname", file_oriname);
					
					service.updateProfileImg(param, model, path);
					model.addAttribute("msg", "프로필이 수정되었습니다.");
					model.addAttribute("url", "/mypage");

				}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "common/msg";
	}
	
	@GetMapping("/organization")
	public String organization() {
		return "common/organization";
	}
	
	@GetMapping("/organization/departments")
	@ResponseBody
    public List<Department> showDepartments() {
        return service.getAllDepartments();
    }
	
	@GetMapping("/organization/teams/{depart_no}")
	@ResponseBody
	public List<MemberDTO> getTeamList(@PathVariable int depart_no){
		return service.getTeamList(depart_no);
	}
	
	@GetMapping("/organization/members/{depart_no}")
	@ResponseBody
	public List<MemberDTO> getMemberList(@PathVariable int depart_no){
		return service.getMemberList(depart_no);
	}
	
    @GetMapping(value="/memberRegist")
    public ModelAndView memberRegist() {        
        ModelAndView mav = new ModelAndView("member/memberRegist");
        List<MemberDTO> departmentList = service.getDepartList();
        mav.addObject("depart", departmentList);
        return mav;
    }
    @PostMapping(value="/teamList")
    @ResponseBody
    public HashMap<String, Object> teamList(@RequestParam int depart_no){
        logger.info("선택한 부서 번호 : "+depart_no);
        return service.teamList(depart_no);
    }
    @PostMapping(value="/join")
    public String join(@RequestParam HashMap<String, String> params
    		,@RequestParam("uploadFile") MultipartFile uploadFile) {
    	logger.info("date:{}"+params);
		logger.info("file"+uploadFile);
		String member_id=service.getMember_id();
		params.put("member_id", member_id);	
		String phone = params.get("phone1")+"-"+params.get("phone2")+"-"+params.get("phone3");
		params.put("phone", phone);
		String email = params.get("email1")+"@"+params.get("email2");
		params.put("email", email);
		String hired = params.get("hiredY")+params.get("hiredM")+params.get("hiredD");
		params.put("hired", hired);
		String birth = params.get("birthY")+params.get("birthM")+params.get("birthD");
		params.put("birth", birth);
		service.join(params,uploadFile);

        return "member/memberList";
    }
    @GetMapping(value="/memberList")
    public String memberList() {
        return "member/memberList";
    }
    @GetMapping(value="/memberListCall")
    @ResponseBody
    public HashMap<String, Object> memberListCall(@RequestParam String member_state,@RequestParam int depart_no) {
        logger.info("부서명 : "+depart_no);
        logger.info("근무 상태 : "+member_state);
        HashMap<String, Object> list = new HashMap<String, Object>();
        list=service.list(member_state,depart_no);
        return list;
    }
    @GetMapping(value="/detail")
    public ModelAndView detail(@RequestParam String member_no) {
        logger.info("직원번호"+member_no);
        ModelAndView mav = service.detail(member_no);
        mav.setViewName("member/memberDetail");        
        return mav;
    }
    @GetMapping(value="/update")
    public ModelAndView update(@RequestParam String member_no) {
        logger.info("직원번호"+member_no);
        ModelAndView mav = service.detail(member_no);
        mav.setViewName("member/memberUpdate");        
        return mav;
    }
    @PostMapping(value="/updateDo")
    public ModelAndView updateDo(@RequestParam HashMap<String, Object> params
            ,@RequestParam("uploadFile") MultipartFile uploadFile){
    String member_no=(String) params.get("member_no");    
    ModelAndView mav = new ModelAndView("redirect:/detail?member_no="+member_no);
    logger.info("수정 내용 {} : "+params);
    service.updateDo(member_no,params,uploadFile);
    return mav;
    }
    @GetMapping(value="/departmentList")
    public ModelAndView departmentList() {
        return  new ModelAndView("member/departList");
    }
    @GetMapping(value="/departmentListCall")
    @ResponseBody
    public HashMap<String, Object> departmentListCall(@RequestParam String departState){
        logger.info("부서상태  : "+departState);
        HashMap<String, Object> list = new HashMap<String, Object>();
        list=service.departList(departState);
        return list;
    }
}
