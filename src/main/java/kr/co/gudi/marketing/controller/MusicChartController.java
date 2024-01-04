package kr.co.gudi.marketing.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.marketing.service.MusicChartService;

@Controller
public class MusicChartController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MusicChartService service;
	
	@GetMapping(value="/musicChart")
	public ModelAndView musicChart() throws IOException {
		return service.getChart();
	}
	
//	@GetMapping(value="/getMusicChart")
//	@ResponseBody
//	public List<HashMap<String, Object>> getMusicChart() throws IOException{
//		return service.getChart();
//	}
	
}
