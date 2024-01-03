package kr.co.gudi.resource.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.resource.dto.CopyrightDTO;
import kr.co.gudi.resource.service.CopyrightService;

@RestController
public class CopyrightController {
	@Autowired CopyrightService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value = "/copyrightlist")
	public ModelAndView cp() {
		
		
		
		
		
		ModelAndView mav = new ModelAndView("copyright/cr");
		return mav ;
	}
	
	
	@PostMapping(value = "/copyrightgetlist")
	public Map<String, Object> copyrightlist(@RequestParam String pagePerNum,@RequestParam String page,@RequestParam String search,@RequestParam String searchtag) {
		
		logger.info("search"+search+"/"+"pagePerNum"+pagePerNum+"page"+page);
		
		if(search.equals("")) {
			logger.info("검색어 없음");
		}else {
			logger.info("검색어 있음");
			if(searchtag.equals("cr")) {
				logger.info("저작권번호");
			}else {
				logger.info("아티스트명");
			}
		}
		
		Map<String, Object> data = service.copyrightlist(page,pagePerNum,search,searchtag);
		logger.info("data : "+data);
		
		return data;
	}
	
	@PostMapping(value = "/copyrightnolist")
	public Map<String, Object> copyrightnolist(@RequestParam String pagePerNum,@RequestParam String page,@RequestParam String search,@RequestParam String searchtag){
		logger.info("search"+search+"/"+"pagePerNum"+pagePerNum+"page"+page);
		
		if(search.equals("")) {
			logger.info("검색어 없음");
		}else {
			logger.info("검색어 있음");
			if(searchtag.equals("cr")) {
				logger.info("저작권번호");
			}else {
				logger.info("아티스트명");
			}
		}
		Map<String, Object> data = service.copyrightnolist(page,pagePerNum,search,searchtag);
		logger.info("data : "+data);
		
		return data;
	}
	
	//------------------------- crg--------------
	
	@GetMapping(value = "/copyrightregisterform")
	public ModelAndView crg() {
		ModelAndView mav = new ModelAndView("copyright/crg");
		return mav;
	}
	
	@GetMapping(value="/copyrightsearch")
	public HashMap<String, Object> getList(String page, String perPage, String search){
		logger.info("여기야");
		logger.info("page="+page+" / perPage="+perPage+" / search="+search);
		return service.getList(page,perPage,search);
	}
	
	@GetMapping(value = "/copyrightsearchdetail")
	public HashMap<String, Object> getListdetail(String page, String perPage, String search){
		logger.info("여기야");
		logger.info("page="+page+" / perPage="+perPage+" / search="+search);
		//ModelAndView mav = new ModelAndView("copyright/crg");
		//mav.addObject("data",service.getListdetail(page,perPage,search));
		return service.getListdetail(page,perPage,search);
	}
	
	@GetMapping(value = "/copyrightregister")
	public ModelAndView copyrightregister() {
		logger.info("여기는 등록완료를 거치는곳");
		
		ModelAndView mav = new ModelAndView("redirect:/copyrightlist");
		return mav;
	}
	
	//---------------------------detail
	
	@GetMapping(value = "/copyrightdetail")
	public ModelAndView copyrightdetail(@RequestParam String num) {
		
		logger.info("num : "+num);
		
		Map<String, Object> detail = service.detaildata(num);
		logger.info("detail : "+detail);
		ModelAndView mav = new ModelAndView("copyright/crd");
		mav.addObject("data",detail);
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	//==========================resource_cr start================================================
	@GetMapping(value = "/resourceCopyright")
	public ModelAndView resourceCopyright() {
		ModelAndView mav = new ModelAndView("resource_cr/resource_cr");
		
		return mav;
	}
	
	@GetMapping(value = "resourceCopyrightregister")
	public ModelAndView resourceCopyrightregister(@RequestParam String no, @RequestParam String date, @RequestParam String price) {
		logger.info("price : "+price);
		logger.info("no : "+no);
		logger.info("date : "+date);
		
		service.resourceCopyrightregister(no,date,price);
		
		ModelAndView mav = new ModelAndView("redirect:/resourceCopyright");
		return mav;
	}

}
