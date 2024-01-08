package kr.co.gudi.archive.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.archive.service.ArchiveService;

public class ArchiveController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ArchiveService service;
	
	@RequestMapping(value = "/archive")
	public String home() {
		return "archive/archiveAll";
	}
	
	@PostMapping(value = "/upload")
	public String upload(MultipartFile uploadFile, @RequestParam String title) {
		
		logger.info("title : "+title);
		logger.info("file : "+uploadFile.getOriginalFilename());
		service.upload(uploadFile);
		
		return "redirect:/archiveAllList";
	}
	
	@RequestMapping(value = "/list")
	public String list(Model model) {
	
		List<String> list = service.list();
		model.addAttribute("list", list);
		
		return "archiveAllList";
	}
	
}
