package kr.co.gudi.resource.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import kr.co.gudi.resource.dao.CopyrightDAO;
import kr.co.gudi.resource.dto.CopyrightDTO;
import reactor.core.publisher.Mono;

@Service 
public class CopyrightService {
	@Autowired CopyrightDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public HashMap<String, Object> getList(String page, String perPage, String search) {
		String url = "https://api.odcloud.kr/api/CpyrRegInforService/v1/getCpyrRegInforUniList";
		// encoding 된 키를 사용
		String serviceKey = "yoPQ5U1JaR0FD5Si6lrl319%2BD33lM1%2By71R%2Bffw4Tlcf21nIYMY0kUd48%2BADR37sfqec6JwElM3f3F5A%2BILBrw%3D%3D";
		
		// 특수문자가 있는 키가 url 에 포함되어 갈 떄는 특별한 처리를 해 줘야 한다.
		DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(url);
		factory.setEncodingMode(EncodingMode.VALUES_ONLY);
		
		WebClient client = WebClient.builder().uriBuilderFactory(factory).baseUrl(url).build();
				
		Mono<HashMap> mono=client.get()
			.uri("?page="+page+"&perPage="+perPage+"&cond%5BREG_ID%3A%3AEQ%5D="+search+"&serviceKey="+serviceKey)
			.retrieve().bodyToMono(HashMap.class);
		
		HashMap<String, Object> resp = mono.block();
		logger.info("response="+resp);
		
		return resp;
	}
	
	

	public HashMap<String, Object> getListdetail(String page, String perPage, String search) {
		logger.info("search"+search);
		String url = "https://api.odcloud.kr/api/CpyrRegInforService/v1/getCpyrRegInforUniDetail";
		// encoding 된 키를 사용
		String serviceKey = "yoPQ5U1JaR0FD5Si6lrl319%2BD33lM1%2By71R%2Bffw4Tlcf21nIYMY0kUd48%2BADR37sfqec6JwElM3f3F5A%2BILBrw%3D%3D";
		
		// 특수문자가 있는 키가 url 에 포함되어 갈 떄는 특별한 처리를 해 줘야 한다.
		DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(url);
		factory.setEncodingMode(EncodingMode.VALUES_ONLY);
		
		WebClient client = WebClient.builder().uriBuilderFactory(factory).baseUrl(url).build();
		
		Mono<HashMap> mono=client.get()
			.uri("?page="+page+"&perPage="+perPage+"&cond%5BREG_ID%3A%3AEQ%5D="+search+"&serviceKey="+serviceKey)
			.retrieve().bodyToMono(HashMap.class);
		
		HashMap<String, Object> resp = mono.block();
		logger.info("response="+resp);
		
		return resp;
	}
	

	//--------------------------등록중 저작권 목록 뿌리기 및 검색---------------------------
	public Map<String, Object> copyrightlist(String page,String pagePerNum, String search, String searchtag) {
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자

		logger.info("searchtag : "+searchtag);
		
		int offset = 0;
		int p =Integer.parseInt(page);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.copyrightlist(search,searchtag,offset);
		logger.info("list : "+list);
		//만들수 있는 총 페이지수
		logger.info("filter : "+Integer.parseInt(pagePerNum));
		logger.info("search : "+search);
		int max = dao.maxpage(Integer.parseInt(pagePerNum),search,searchtag);
		logger.info("만들 수 있는 총 페이지수 : "+max);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 만약 현재 보고있는 페이지가, 총 페이지수 보다 크면 현재페이지를 총 페이지수로 변경한다.
		if(p>max) {
			
			p = max;
		}
		
		map.put("currPage", p);
		
		map.put("pages", max+1);
		logger.info("list : "+list);
		map.put("list", list);
		
		
		
		return map;
		}

	
	//--------------------------만료 및 취소중 저작권 목록 뿌리기 및 검색---------------------------
	public Map<String, Object> copyrightnolist(String page,String pagePerNum, String search, String searchtag) {
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자

		logger.info("searchtag : "+searchtag);
		
		int offset = 0;
		int p =Integer.parseInt(page);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.copyrightnolist(search,searchtag,offset);
		logger.info("list : "+list);
		//만들수 있는 총 페이지수
		logger.info("filter : "+Integer.parseInt(pagePerNum));
		logger.info("search : "+search);
		int max = dao.nomaxpage(Integer.parseInt(pagePerNum),search,searchtag);
		logger.info("만들 수 있는 총 페이지수 : "+max);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 만약 현재 보고있는 페이지가, 총 페이지수 보다 크면 현재페이지를 총 페이지수로 변경한다.
		if(p>max) {
			
			p = max;
		}
		
		map.put("currPage", p);
		
		map.put("pages", max+1);
		logger.info("list : "+list);
		map.put("list", list);
		
		
		
		return map;
		}



	public Map<String, Object> detaildata(String num) {
		
		return dao.detaildata(num);
		
		
	}


	
	
	
	
	//-----------------------------------실적------------------------------------
	//실적등록
	public void resourceCopyrightregister(String no, String date, String price) {
		dao.resourceCopyrightregister(no,date,Integer.parseInt(price));
		
	}

	//--------------------------------------------------------------------------
}
