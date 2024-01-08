package kr.co.gudi.attend.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.attend.dto.AttendDTO;
import kr.co.gudi.attend.service.AttendService;

@Controller
public class AttendController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AttendService service;
	
	int member_no=15;
	
	@GetMapping(value="/attend")
	public ModelAndView attend() {
		return new ModelAndView("attend/attend");
	}
	
	@PostMapping(value="/attTime")
	@ResponseBody
	public int attTime(@RequestParam HashMap<String, Object> param){
		logger.info("현재 일시 : "+param);	
		param.put("member_no", member_no);
		return service.attTime(param);
	}
	
	@GetMapping(value="/notiTime")
	@ResponseBody
	public AttendDTO notiTime(){
		LocalDate today = LocalDate.now();
		return service.notiTime(member_no,today);
	}
	
	@GetMapping(value="/timeTable")
	@ResponseBody
	public HashMap<String, Object> timeTable(){
		LocalDate currentDate = LocalDate.now();
        // 이번 주의 시작일
        LocalDate startOfWeek = currentDate.with(DayOfWeek.MONDAY);
        // 이번 주의 종료일
        LocalDate endOfWeek = currentDate.with(DayOfWeek.SUNDAY);
        // 날짜 포맷 지정 (선택사항)
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String startOfWeekFormatted = startOfWeek.format(formatter);
        String endOfWeekFormatted = endOfWeek.format(formatter);
        logger.info("이번주 시작일 : "+startOfWeekFormatted);
        logger.info("이번주 종료일 : "+endOfWeekFormatted);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("start_date", startOfWeekFormatted);
        map.put("end_date", endOfWeekFormatted);
        map.put("member_no", member_no);
                  
		return service.timeTable(map);
	}
	
	
}
