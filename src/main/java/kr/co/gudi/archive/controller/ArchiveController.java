package kr.co.gudi.archive.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	@GetMapping(value="/archive")
	public String archive() {
		return "archive/archive";
	}
	
	@GetMapping(value="/archive/list")
	@ResponseBody
	public Map<String, Object> archiveList(String page, String member_no, String state, String searchKeyword){
		return service.archiveList(page, member_no, state, searchKeyword);
	}
	
	@PostMapping(value="/department-file/upload")
	public String departmentFileUpload(MultipartFile[] uploadFileList, String memberNumber) 
			throws Exception {
		service.departmentFileUpload(uploadFileList, memberNumber);
		return "redirect:/archive";
	}  
	
	@PostMapping(value="/company-file/upload")
	public String companyFileUpload(MultipartFile[] uploadFileList, String memberNumber) 
			throws Exception {
		service.companyFileUpload(uploadFileList, memberNumber);
		return "redirect:/archive";
	}
	
	@GetMapping(value="/archive/delete")
	@ResponseBody
	public Map<String, Object> archiveDelete(HttpSession session,
			@RequestParam(value="delList[]") ArrayList<String> deleteFileList,
			@RequestParam(value="names[]") ArrayList<String> checkFileMemberNames 
			){
		String memberName = ((MemberVO)session.getAttribute("loginMember")).getName();
		return service.archiveDelete(deleteFileList, checkFileMemberNames, memberName);
	}
	
	@GetMapping(value="/file/download")
	public ResponseEntity<Resource> fileDownload(String newName, String oriName) throws IOException {
		String filePath = root + newName;
		String originalFileName = URLEncoder.encode(oriName, "UTF-8");
		Resource resource = new FileSystemResource(filePath); 
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-type", "application/octet-stream");
		header.add("Content-Disposition", "attachment;fileName=\""+originalFileName+"\"");		
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK); 
	}
}
