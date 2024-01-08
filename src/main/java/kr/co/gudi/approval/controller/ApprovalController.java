package kr.co.gudi.approval.controller;

import java.util.Arrays;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.approval.service.ApprovalService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	@Autowired
	ApprovalService apprService;
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	// 기안서 화면 이동
	@GetMapping("/draftDocForm")
	public String approvalForm() {
		return "approval/draftDocForm";
	}
	
	// 결재요청
	@PostMapping("/approvalWrite")
	public ModelAndView approvalWrite(@RequestParam HashMap<String, String> params, @RequestParam("files") MultipartFile[] files, @RequestParam(name="observer") String[] observer) { 
		log.info("----------------- start approvalWrite --------------------");
		log.info("params : "+params);
		log.info("filesLength : "+files.length);
		log.info("files : "+files);
		log.info("filesEmpty : "+files[0].isEmpty());
		log.info("observer : "+Arrays.toString(observer));
		int member_no = 20;
		log.info("----------------- end approvalWrite --------------------");
		return apprService.approvalWrite(params, files, member_no, observer);
	}
	
}
