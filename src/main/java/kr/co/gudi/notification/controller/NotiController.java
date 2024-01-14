package kr.co.gudi.notification.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.notification.service.NotiService;

@Controller
public class NotiController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiService service;
	
	@GetMapping(value="/noti")
	public String noti() {
		return "notification/noti";
	}
	
	@GetMapping(value="/notiList")
	@ResponseBody
	public Map<String, Object> notiList(String member_no){
		logger.info("member_no === " + member_no);
		return service.notiList(member_no);
	}
	
	@GetMapping(value="/notiStateUpdate")
	public String notiStateUpdate(String noti_no, String locate){
		logger.info("unique_no / locate === " + noti_no + " / " + locate);
		service.stateUpdate(noti_no, locate);
		return "redirect:/noti";
	}
}
