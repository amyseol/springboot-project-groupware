package kr.co.gudi.archive.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.archive.dao.ArchiveDAO;

@Service
public class ArchiveService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${spring.servlet.multipart.location}") private String root;
	@Autowired ArchiveDAO dao;
	
	
	public void upload(MultipartFile uploadFile) {
		//1. 파일명 추출 (image.jpg)
		String fileName = uploadFile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
		System.out.println("확장자 : "+ext);
		
		//2. 파일명 변경 (현재 시간을 밀리초로 환산)
		String newFileName = System.currentTimeMillis()+ext; 
		
		int fileSize = (int) (uploadFile.getSize() / 1024.0); // 소숫점 제거하기 위해서 int 로 선언
		
		if(fileSize > 0) {
			try {
				byte[] arr = uploadFile.getBytes(); // 객체로부터 바이트 추출
				Path path = Paths.get(root+"upload/"+newFileName); // 저장할 경로와 파일명 지정
				Files.write(path, arr); // 파일 저장 			
		
				logger.info("fileSize > 0");
				
			
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else {	
			logger.info("파일 size = 0");	
		}
		
		
	}


	public List<String> list() {
		
		return null;
	}
	
	
}
