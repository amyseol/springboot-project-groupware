package kr.co.gudi.resource.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.resource.dao.AlbumDAO;
import kr.co.gudi.resource.dto.AlbumDTO;

@Service
public class AlbumService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlbumDAO dao;
	Map<String, Object> map = new HashMap<String, Object>();
	
	public Map<String, Object> list(String page) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 10;
		
		ArrayList<AlbumDTO> list = new ArrayList<AlbumDTO>();
		list = dao.list(offset);
		map.put("list", list);
		
		int pages = dao.totalPage();
		map.put("pages", pages);
		// 전체 페이지가 p 값보다 작을 때 
		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);
		
		return map;
	}

	public AlbumDTO detail(String alb_no) {
		return dao.detail(alb_no);
	}

	public Map<String, Object> searchList(String a_name, String page) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 10;
		
		ArrayList<AlbumDTO> list = new ArrayList<AlbumDTO>();
		list = dao.searchList(a_name, offset);
		map.put("list", list);
		
		int pages = dao.totalPage();
		map.put("pages", pages);
		// 전체 페이지가 p 값보다 작을 때 
		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);
		
		return map;
	}

	public Map<String, Object> chartData(String num, String optionVal) {
		ArrayList<AlbumDTO> list = dao.chartData(num, optionVal);
		map.put("list", list);
		return map;
	}

	
}
