package kr.co.gudi.schedule.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.schedule.dto.ScheduleDTO;
import kr.co.gudi.schedule.service.ScheduleService;

@Controller
public class ScheduleController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ScheduleService service;
	
	@RequestMapping(value={ "/schedule"})
	public String index() {
		logger.info("index 캘린더 출력 test");
		return "schedule/scheduleList";
	}
	
	@RequestMapping(value={ "/schedule/list"})
	@ResponseBody
	public HashMap<String, Object> list() {
		List<ScheduleDTO> eventList = service.list();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("eventList", eventList);
		return result;
	}
	/*
	@GetMapping("/schedule/save")
    public void saveCalendarEvents(@RequestParam HashMap<String, Object> param,HttpSession session) {
        // 여기서 events를 처리하는 로직을 작성
        // EventDto는 모달 창에서 전송된 이벤트 데이터의 구조에 맞게 정의되어야 합니다.
		int member_no=5;
		String sch_depart="경영지원";
		param.put("member_no", member_no);
		param.put("sch_depart", sch_depart);
		logger.info("일정:"+param);
		
		service.write(param);
        
    }
	*/

	@GetMapping(value = "/schedule/save")
	@ResponseBody
	public void scheduleAdd(@RequestParam HashMap<String, Object> param) {
		int member_no=5;
		String sch_depart="A&R팀";
		param.put("member_no", member_no);
		param.put("sch_depart", sch_depart);
		logger.info("일정:"+param);
		
		service.write(param);
	}
	
	@GetMapping(value = "/schedule/getEventDetails")
	public String detail(@RequestParam String sch_no, Model model) {
		logger.info("Controller detail 함수");
		ScheduleDTO sch = service.detail(sch_no);
		model.addAttribute("sch", sch);
		
		return "scheduleDetail";
	}
	
	
	
	/*
	@RequestMapping("/addForm")
	public String addForm(@RequestParam HashMap<String, Object> params) {
		
		logger.info("params:"+params);
		return service.addForm(params);
	}
	

	
	
	 @GetMapping("/list2")
	 public String all(@RequestParam String filter,Model model) {
			int member_no=8;
			String sch_depart="경영지원";
			//ArrayList<CalDTO> list = service.list(filter,member_no,sch_depart);
			//model.addAttribute("list",list);
			
			return "index";
	        
	    }
	    	*/
}