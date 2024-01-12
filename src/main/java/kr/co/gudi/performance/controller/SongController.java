package kr.co.gudi.performance.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.performance.service.SongService;

@Controller
public class SongController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${spring.servlet.multipart.location}") private String root;
	
	@Autowired SongService service;
	
	@GetMapping("/song")
	public String song() {
		return "/song/song";
	}
	
	@GetMapping("/song/list")
	@ResponseBody
	public Map<String, Object> songList(String page){
		return service.songList(page);
	}
	
	@GetMapping("/song/list/detail")
	public ModelAndView songDetail(String song_no) {
		return service.songDetail(song_no);
	}
	
	@GetMapping("/songSearch")
	@ResponseBody
	public Map<String, Object> songSearch(String search_info, String page){
		return service.songSearch(search_info, page);
	}
	
	@GetMapping("/songPerform")
	public String songPerform() {
		return "/song/songPerform";
	}
	
	@GetMapping("/songPerform/list")
	@ResponseBody
	public Map<String, Object> songPerformList(String page){
		return service.songList(page);
	}
	
	// 파일 업로드(return 값은 결재 페이지로 수정시 변경하기)
	@PostMapping("/songFile.do")
	public String songFile(MultipartFile[] files, int song_no) throws Exception {
		service.fileUpload(files, song_no);
		return "redirect:/songDetail";
	}
	
	// 파일 다운로드
	@GetMapping("/songDownload.do")
	public ResponseEntity<Resource> songDownload(String newName, String oriName) throws Exception{
		String path = root+newName;
		String ext = newName.substring(newName.lastIndexOf("."));
		// 본문(파일)
		Resource resource = new FileSystemResource(path);	// 파일 시스템의 특정 파일을 읽어오는 기능
		
		// 보여주기와 다운로드는 헤더 속성 값의 차이
		HttpHeaders headers = new HttpHeaders();
		// text/... : 문자열, image/... : 이미지, application/octet-stream : 바이너리	
		headers.add("Content-type", "application/octet-stream");
		// content-Disposition : 내려보낼 내용이 문자(inline)인지 파일(attachment)인지 명시
		// 파일일 경우 파일명이 들어가는데, 한글은 다 깨진다.
		// DB 에서 원본 파일명을 가져왔다고 가정하자
		String oriFileName = URLEncoder.encode(oriName + ext, "UTF-8");
		// attachment;fileName="원본.jpg"
		headers.add("content-Disposition", "attachment;fileName=\"" + oriFileName + "\"");
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK); //바디,헤더,상태(200,500)
	}
}
