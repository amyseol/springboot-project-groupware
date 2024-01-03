package kr.co.gudi.marketing.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class MusicChartService {
	Logger logger = LoggerFactory.getLogger(getClass());

	public ModelAndView getChart() throws IOException {
		String url = "https://www.melon.com/chart/index.htm";	
		// url 에 page 라는 parameter 추가해서 document 객체에 저장
		Document doc = Jsoup.connect(url).get();
		doc = Jsoup.connect(url).get();

        Elements el = doc.select("table"); // table 태그 가져오기
        
        
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();		
		HashMap<String, String> map = null;
		
        for(Element chartList : el) {
			// 반복할 때마다 새로운 hashmap 이 생성됨  
			map = new HashMap<String, String>();
			
			// 순위 출력 
			Elements rank = chartList.select("span.rank");
	        List<Element> rankList = rank.subList(1, rank.size()); // 1번 인덱스부터 가져오기
	        
	        String ranks = "";
	        for (Element rankEl : rankList) {
	        	ranks+=rankEl.html();
	        } 
	        map.put("rank", ranks);
	        
	        // 앨범 이미지 출력 
	        Elements albImg = chartList.select("a.image_typeAll img");
	        String imgSrc = "";
	        for(Element img : albImg) {
	        	imgSrc += img.attr("src");
	        	logger.info("img src ==="+img.attr("src"));
	        }
	        map.put("imgSrc", imgSrc);
	        
	        // 이미지 a 태그 href 출력
	        Elements albHref = chartList.select("a.image_typeAll ");
	        
	        
	        list.add(map);
        }
        
        
		
		return null;
	}

	
}
