package kr.co.gudi.schedule.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.schedule.dao.ScheduleDAO;
import kr.co.gudi.schedule.dto.ScheduleDTO;

@Service
public class ScheduleService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ScheduleDAO dao;
	
	public void write(HashMap<String, Object> param) {
		 dao.write(param);
		
	}
/*
	public ArrayList<CalDTO> list(String filter, int member_no,String sch_depart) {
		ArrayList<CalDTO> list =new ArrayList<CalDTO>();
		/*
		if(filter.equals("전사")) {
			list=dao.listAll();			
		}else if(filter.equals("개인")) {
			list=dao.listMy(member_no);
		}else if(filter.equals("부서")) {
			list=dao.listDepart(sch_depart);
		}
		
		return dao.list(filter, member_no, sch_depart);		
		
	}*/
	public List<ScheduleDTO> list() {
		return dao.list();
	}
	
	
	public String addForm(HashMap<String, Object> params) {
		
		return dao.addForm(params);
	}
	public ScheduleDTO detail(String sch_no) {
		return dao.detail(sch_no);
	}
	
	
}
