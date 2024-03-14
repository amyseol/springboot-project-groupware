package kr.co.gudi.resource.service;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import kr.co.gudi.member.vo.MemberVO;
import kr.co.gudi.resource.dao.CopyrightDAO;
import kr.co.gudi.resource.dto.CopyrightDTO;
import reactor.core.publisher.Mono;

@Service 
public class CopyrightService {
	@Autowired 
	CopyrightDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${spring.servlet.multipart.location}") private String root;
	
	public HashMap<String, Object> getList(String page, String perPage, String search) {
		// Open API from https://www.data.go.kr/data/15106731/openapi.do
		String url = "https://api.odcloud.kr/api/CpyrRegInforService/v1/getCpyrRegInforUniList";
		String serviceKey = "yoPQ5U1JaR0FD5Si6lrl319%2BD33lM1%2By71R%2Bffw4Tlcf21nIYMY0kUd48%2BADR37sfqec6JwElM3f3F5A%2BILBrw%3D%3D";
		DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(url); // url 특수문자 처리
		factory.setEncodingMode(EncodingMode.VALUES_ONLY);
		
		WebClient client = WebClient.builder().uriBuilderFactory(factory).baseUrl(url).build();
		Mono<HashMap> mono=client.get()
			.uri("?page="+page+"&perPage="+perPage+"&cond%5BREG_ID%3A%3AEQ%5D="+search+"&serviceKey="+serviceKey)
			.retrieve().bodyToMono(HashMap.class);
		HashMap<String, Object> resp = mono.block();
		return resp;
	}

	public HashMap<String, Object> getListdetail(String page, String perPage, String search) {
		String url = "https://api.odcloud.kr/api/CpyrRegInforService/v1/getCpyrRegInforUniDetail";
		String serviceKey = "yoPQ5U1JaR0FD5Si6lrl319%2BD33lM1%2By71R%2Bffw4Tlcf21nIYMY0kUd48%2BADR37sfqec6JwElM3f3F5A%2BILBrw%3D%3D";
		DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(url);
		factory.setEncodingMode(EncodingMode.VALUES_ONLY);
		
		WebClient client = WebClient.builder().uriBuilderFactory(factory).baseUrl(url).build();
		Mono<HashMap> mono=client.get()
			.uri("?page="+page+"&perPage="+perPage+"&cond%5BREG_ID%3A%3AEQ%5D="+search+"&serviceKey="+serviceKey)
			.retrieve().bodyToMono(HashMap.class);
		HashMap<String, Object> resp = mono.block();
		return resp;
	}
	
	public Map<String, Object> copyrightlist(String page,String pagePerNum, String search, String searchtag) {
		int offset = 0;
		int p =Integer.parseInt(page);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.copyrightlist(search,searchtag,offset);
		int max = dao.maxpage(Integer.parseInt(pagePerNum),search,searchtag);		
		if(p>max+1) {p = max;}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currPage", p);
		map.put("pages", max+1);
		map.put("list", list);
		return map;
	}

	public Map<String, Object> copyrightnolist(String page,String pagePerNum, String search, String searchtag) {
		int offset = 0;
		int p =Integer.parseInt(page);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.copyrightnolist(search,searchtag,offset);
		int max = dao.nomaxpage(Integer.parseInt(pagePerNum),search,searchtag);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(p>max+1) {p = max;}
		map.put("currPage", p);
		map.put("pages", max+1);
		map.put("list", list);
		return map;
	}

	public Map<String, Object> detaildata(String num) {
		return dao.detaildata(num);
	}

	public void resourceCopyrightregister(String no, String date, String price, 
			String namae, HttpSession session) {
		String per_member = ((MemberVO)session.getAttribute("loginMember")).getName();
		dao.resourceCopyrightregister(no,date,Integer.parseInt(price),namae,per_member);
	}

	public void copyrightregister(HashMap<String, String> data, MultipartFile[] files, 
			HttpSession session) throws Exception {
		CopyrightDTO dto = new CopyrightDTO();
		dto.setCr_no(data.get("cr_no"));
		dto.setCr_namae(data.get("namae"));
		dto.setCr_name(data.get("name"));
		dto.setCr_price(Integer.parseInt(data.get("price")));
		dto.setCr_member(data.get("member"));
		dto.setMember_no(((MemberVO)session.getAttribute("loginMember")).getMember_no());
		dto.setApproval_title(data.get("title"));
		dto.setApproval_content(data.get("content"));
		dao.copyrightregister(dto);
		dao.apprcr(dto);
		dao.appcon(dto);		
		String idx = dto.getCr_no();
		saveFile(idx, files);
	}

	private void saveFile(String idx, MultipartFile[] files) throws Exception {
		for (MultipartFile photo : files) {
			String oriFileName = photo.getOriginalFilename();
			if (!oriFileName.equals("")) {
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				String newFileName = System.currentTimeMillis()+ext;
				byte[] arr = photo.getBytes();
				String kb = String.valueOf(arr.length/1000);
				Path path = Paths.get(root+newFileName);
				Files.write(path, arr);
				dao.writeFile(idx,oriFileName,newFileName,kb);
			}
		}
	}

	public Map<String, Object> resourcecopyrightgetlist(String page, String pagePerNum, String search,
			String searchtag) {
		int offset = 0;
		int p =Integer.parseInt(page);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.resourcecopyrightgetlist(search,searchtag,offset);
		int max = dao.rclmaxpage(Integer.parseInt(pagePerNum),search,searchtag);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(p>max+1) {p = max;}
		map.put("currPage", p);
		
		if(max<1){
			map.put("pages", max+1);
		} else {
			map.put("pages", max);
		}
		map.put("list", list);
		return map;
	}

	public void resourceCopyrightdelete(String cr_no, String per_price) {
		dao.resourceCopyrightdelete(cr_no,per_price);
	}

	public Map<String, Object> depttlist() {
		return dao.depttlist();
	}

	public ModelAndView crd2(String approval_no, ModelAndView mav) {
		int appr_no = Integer.parseInt(approval_no);
		Map<String, String> map = dao.crd2(appr_no);
		map.put("approval_no", approval_no);
		mav.addObject("data",map);
		return mav;
	}

	public void okcr(String no, String app) {
		dao.okcr(no);
		dao.uprp(Integer.parseInt(app));
	}

	public void nocr(String no, String app) {
		dao.nocr(no);
		dao.uprp(Integer.parseInt(app));
	}
}
