package kr.co.gudi.member.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.member.service.MemberService;
import kr.co.gudi.member.vo.MemberVO;

@Controller
public class MemberController {
	@Value("${spring.servlet.multipart.location}") private String root;
	
	@Autowired MemberService service;
	
	// 첫 페이지
	@RequestMapping("/")
	public String start() {
		return "member/login";
	}
	
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
		String path = session.getServletContext().getRealPath(root);		// 파일 저장 경로
		
		try {
			Path storagePath = Paths.get(path);
			
			if (!Files.exists(storagePath)) {
				Files.createDirectories(storagePath);
			} else {
				if (!profileImg.getOriginalFilename().equals("")) {	// 파일이 있으면 실행
					String file_oriname = profileImg.getOriginalFilename();
					Date today = new Date(System.currentTimeMillis());
					String ext = file_oriname.substring(file_oriname.lastIndexOf("."));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
					int random = (int) ((Math.random() * 10000) + 1);
					String file_newname = sdf.format(today) + "_" + random + ext;
					
					profileImg.transferTo(new File(path + file_newname));
					
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("file_newname", file_newname);
					param.put("member_no", ((MemberVO)session.getAttribute("loginMember")).getMember_no());
					param.put("file_oriname", file_oriname);
					
					service.updateProfileImg(param);
					/*
					if (service.updateProfileImg(param) > 0) {
						model.addAttribute("msg", "프로필이 수정되었습니다.");
						model.addAttribute("url", "/mypage");
						session.setAttribute("loginMember", service.selectMemberByParam(param));
					} else {
						model.addAttribute("msg", "프로필 수정에 실패하였습니다!!");
						model.addAttribute("url", "/mypage");
					}
					*/
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "common/msg";
	}
}
