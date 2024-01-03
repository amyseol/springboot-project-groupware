package kr.co.gudi.marketing.controller;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.marketing.dto.MusicChartDTO;
import kr.co.gudi.marketing.service.MusicChartService;

@Controller
public class MusicChartController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MusicChartService service;
	
	@GetMapping(value="/musicChart")
	public String musicChart() {
		return "/musicChart/musicChart";
	}
	
	@GetMapping(value="/getChart")
	@ResponseBody
	public ModelAndView getChart() throws IOException{
		return service.getChart();
	}
	
}
