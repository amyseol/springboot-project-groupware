package kr.co.gudi.notification.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.notification.dao.NotiDAO;
import kr.co.gudi.notification.dto.NotiDTO;

@Service
public class NotiService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiDAO dao;
	Map<String, Object> map = new HashMap<String, Object>();
	
	public Map<String, Object> notiList(String member_no, int depart_no) {
		ArrayList<NotiDTO> list = new ArrayList<NotiDTO>();
		String num = Integer.toString(depart_no);
		list = dao.notiList(member_no,num);
		map.put("list", list);
		// 새로운 알림 개수 
		int newNotiCount = dao.newNotiCount(member_no,num);
		map.put("noti_count", newNotiCount);
		int size = list.size();
		map.put("size", size);
		return map;
	}

	public void notiStateUpdate(String noti_no, String locate) {
		dao.notiStateUpdate(noti_no, locate);
	}

	public Map<String, Object> notiCount(String member_no, int depart_no) {
		String num = Integer.toString(depart_no);
		int newNotiCount = dao.newNotiCount(member_no, num);
		map.put("noti_count", newNotiCount);
		return map;
	}

	public Map<String, Object> deleteSelectedNoti(ArrayList<String> delList, Model model) {
		int cnt = 0;
		for(String noti_no : delList) {
			cnt+= dao.deleteSelectedNoti(noti_no);
		}
		map.put("del_cnt", cnt);
		return map;
	}
	
	/**
     * 매일 새벽 3시에 oldNoti를 초기화한다. 
     * oldNoti란 스케줄러 실행일 기준으로 7일 전까지의 noti를 의미한다. 
     */
	@Scheduled(cron = "0 0 3 * * *")
	public void deleteOldNoti() {
		try {
			dao.deleteOldNoti();
		} catch (Exception e) {
			logger.info("error for deleteOldNoti : " +e);
		}
	}
}