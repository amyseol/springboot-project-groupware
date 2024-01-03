package kr.co.gudi.marketing.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MusicChartController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@GetMapping(value="/musicChart")
	public String musicChart() {
		return "/musicChart/musicChart";
	}
	
	
	
}
