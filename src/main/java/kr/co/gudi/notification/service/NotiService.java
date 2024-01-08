package kr.co.gudi.notification.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
		return map;
	}
	

}
