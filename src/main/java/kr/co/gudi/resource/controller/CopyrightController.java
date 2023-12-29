package kr.co.gudi.resource.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	public ArrayList<CopyrightDTO> copyrightlist() {
		
		ArrayList<CopyrightDTO> data = service.copyrightlist();
		
		logger.info("data : "+data.size());
		
		return data;
	}
	@PostMapping(value = "/copyrightnolist")
	public ArrayList<CopyrightDTO> copyrightnolist(){
		ArrayList<CopyrightDTO> data = service.copyrightnolist();
		
		logger.info("data : "+data.size());
		
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
		
		ModelAndView mav = new ModelAndView("copyright/crd");
		
		return mav;
	}
	
	

}
