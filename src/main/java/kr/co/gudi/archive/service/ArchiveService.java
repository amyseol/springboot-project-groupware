package kr.co.gudi.archive.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.archive.dao.ArchiveDAO;

public class ArchiveService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${spring.servlet.multipart.location}") private String root;
	@Autowired ArchiveDAO dao;
	
	
	public void upload(MultipartFile uploadFile) {
		//1. 파일명 추출
		String fileName = uploadFile.getOriginalFilename();
	}
	
	
}
