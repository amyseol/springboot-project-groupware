package kr.co.gudi.resource.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.resource.service.AlbumService;

@Controller
public class AlbumController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlbumService service;
	
	// root 를 application.properties에 설정하면 일일이 변경하지 않아도 된다. 
	@Value("${spring.servlet.multipart.location}") private String root;
	
	// 음반 계약 현황 페이지 이동
	@GetMapping(value="/album")
	public String album() {
		return "/album/album";
	}
	
	// 음반 계약 현황 리스트 호출 
	@GetMapping(value="/albumList")
	@ResponseBody
	public Map<String, Object> albumList(String page, String a_name) {
		logger.info("a_name ==== " +a_name);
		return service.list(page, a_name);
	} 
	
	@GetMapping(value="/albumDetail")
	public ModelAndView albumDetail(String alb_no) {
		return service.detail(alb_no);
	}	
	
	@GetMapping(value="/albumChartData")
	@ResponseBody
	public Map<String, Object> albumChartData(String num, String optionVal){
		return service.chartData(num, optionVal);
	}
	
	// 음반 실적 페이지 이동
	@GetMapping(value="/albumPerform")
	public String albumPerform() {
		return "/album/albumPerform";
	}

	// 파일 업로드 (return 값은 기능을 결재 페이지로 옮길 때 변경하기) 
//	@PostMapping(value="/albumFile.do")
//	public String albumFile(MultipartFile[] files, int alb_no) throws Exception {
//		service.fileUpload(files, alb_no);
//		return "redirect:/albumDetail";
//	}
	
		
	@GetMapping(value="/albumApproval")
	public String albumApproval() {
		return "album/albumApproval";
	}
	
	
}
