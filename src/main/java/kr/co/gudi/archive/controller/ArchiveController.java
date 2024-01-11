package kr.co.gudi.archive.controller;

<<<<<<< HEAD

public class ArchiveController {
	
	
=======
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.archive.service.ArchiveService;
import kr.co.gudi.member.vo.MemberVO;

@Controller
public class ArchiveController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ArchiveService service;
	@Value("${spring.servlet.multipart.location}") private String root;
	
	@GetMapping(value="/archiveAll")
	public String archiveAll() {
		return "archive/archiveAll";
	}
	
	
	@GetMapping(value="/archAllList")
	@ResponseBody
	public Map<String, Object> archAllList(String page, String member_no){
		return service.archAllList(page, member_no);
	}
	
	// 부서 파일 업로드 
	@PostMapping(value="/departFileUpload.do")
	public String departFileUpload(MultipartFile[] files, String member_no) throws Exception {
		service.departFileUpload(files,member_no);
		return "redirect:/archiveAll";
	}
	
	@GetMapping(value="/archiveDel")
	@ResponseBody
	public Map<String, Object> archiveDel(@RequestParam(value="delList[]") ArrayList<String> delList,
			@RequestParam(value="names[]") ArrayList<String> names, HttpSession session, Model model){
		logger.info("names{}", names);
		String member_name = ((MemberVO)session.getAttribute("loginMember")).getName();
		logger.info("name ==="+member_name);
		return service.archiveDel(delList,names,member_name,model);
	}
>>>>>>> origin/master
	
}
