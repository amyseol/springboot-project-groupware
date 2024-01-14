package kr.co.gudi.notification.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.notification.dao.NotiDAO;
import kr.co.gudi.notification.dto.NotiDTO;

@Service
public class NotiService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiDAO dao;

	public Map<String, Object> notiList(String member_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<NotiDTO> list = new ArrayList<NotiDTO>();
		list = dao.notiList(member_no);
		
		map.put("list", list);
		// 새로운 알림 개수 
		int noti_count = dao.notiCount(member_no);
		map.put("noti_count", noti_count);
		logger.info("noti_count==="+noti_count);
		return map;
	}

	public void stateUpdate(String noti_no, String locate) {
		dao.stateUpdate(noti_no, locate);
	}

}
