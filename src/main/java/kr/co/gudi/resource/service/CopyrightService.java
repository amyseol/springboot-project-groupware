package kr.co.gudi.resource.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	public ArrayList<CopyrightDTO> copyrightlist(){
		
		ArrayList<CopyrightDTO> result = dao.copyrightlist();
		
		logger.info("result"+result);
		
		return result;
	}

	public ArrayList<CopyrightDTO> copyrightnolist() {
		ArrayList<CopyrightDTO> result = dao.copyrightnolist();
		
		logger.info("result"+result);
		
		return result;
	}

}
