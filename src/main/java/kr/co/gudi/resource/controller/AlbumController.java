package kr.co.gudi.resource.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.resource.dto.AlbumDTO;
import kr.co.gudi.resource.service.AlbumService;

@Controller
public class AlbumController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlbumService service;
	
	@GetMapping(value="/album")
	public String album() {
		return "/album/album";
	}
	
	@GetMapping(value="/albumList")
	@ResponseBody
	public Map<String, Object> albumList(String page) {
		return service.list(page);
	} 
	
	@GetMapping(value="/albumDetail")
	public ModelAndView albumDetail(String alb_no) {
		ModelAndView mav = new ModelAndView();
		logger.info("alb_no : " + alb_no); 
		AlbumDTO dto = service.detail(alb_no);
		mav.addObject("albumDetail", dto);
		mav.setViewName("/album/albumDetail");
		
		return mav;
	}	
	
	@GetMapping(value="/albumSearch")
	@ResponseBody
	public Map<String, Object> albumSearch(String a_name, String page){
		return service.searchList(a_name, page);
	}
	
	@GetMapping(value="/albumChartData")
	@ResponseBody
	public Map<String, Object> albumChartData(String num, String optionVal){
		return service.chartData(num, optionVal);
	}
	
	
	@GetMapping(value="/albumPerform")
	public String albumPerform() {
		return "/album/albumPerform";
	}
}
