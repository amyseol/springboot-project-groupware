package kr.co.gudi.member.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.member.dto.MemberDTO;
import kr.co.gudi.member.service.MemberService;

@Controller
public class MemberController {
		
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberService service;
	
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
	public String join(@RequestParam HashMap<String, String> params,@RequestParam("uploadFile") MultipartFile uploadFile) {
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
	public HashMap<String, Object> memberListCall(@RequestParam String member_state,@RequestParam String depart_name) {
		logger.info("부서명 : "+depart_name);
		logger.info("근무 상태 : "+member_state);
		HashMap<String, Object> list = new HashMap<String, Object>();
		list=service.list(member_state,depart_name);
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

