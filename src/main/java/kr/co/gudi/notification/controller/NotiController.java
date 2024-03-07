package kr.co.gudi.notification.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.member.vo.MemberVO;
import kr.co.gudi.notification.service.NotiService;

@Controller
public class NotiController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiService service;
	
	@GetMapping(value="/noti")
	public String noti(HttpSession session, Model model) {
		return "notification/noti";
	}
	
	@GetMapping(value="/noti/list")
	@ResponseBody
	public Map<String, Object> notiList(String member_no, HttpSession session){
		int depart_no = ((MemberVO)session.getAttribute("loginMember")).getDepart_p_no();
		return service.notiList(member_no, depart_no);
	}
	
	@GetMapping(value="/noti/count")
	@ResponseBody
	public Map<String, Object> notiCount(String member_no, HttpSession session){
		int depart_no = ((MemberVO)session.getAttribute("loginMember")).getDepart_p_no();
		return service.notiCount(member_no, depart_no);
	}	
	
	@GetMapping(value="/noti/stateUpdate")
	public String notiStateUpdate(String noti_no, String locate){
		service.notiStateUpdate(noti_no, locate);
		return "redirect:/noti";
	}
	
	@GetMapping(value="/noti/delete")
	@ResponseBody
	public Map<String, Object> deleteSelectedNoti(@RequestParam(value="delList[]") ArrayList<String> delList,
			HttpSession session, Model model){
		return service.deleteSelectedNoti(delList,model);
	}
}
