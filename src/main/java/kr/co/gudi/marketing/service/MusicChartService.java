package kr.co.gudi.marketing.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import kr.co.gudi.marketing.dao.MusicChartDAO;
import kr.co.gudi.marketing.dto.MusicChartDTO;

@Service
public class MusicChartService {
	
	private static final String MELON_CHART_URL = "https://www.melon.com/chart/index.htm";	
	private static final String LIVE_TIME = "time";
	private static final String LIVE_DATE = "date";
	
	private final MusicChartDAO musicChartDao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public MusicChartService(MusicChartDAO musicChartDao) {
		this.musicChartDao = musicChartDao;
	}
	
	public void getChartDatetime(Model model) throws Exception {
		Document document = Jsoup.connect(MELON_CHART_URL).get();
		Elements timeDateElement = document.select("div.multi_row"); 
		model.addAttribute(LIVE_TIME, timeDateElement.select("span.hour").html());
		model.addAttribute(LIVE_DATE, timeDateElement.select("span.year").html());
	}

	public List<MusicChartDTO> getMusicChartList() throws IOException {
		Document document = Jsoup.connect(MELON_CHART_URL).get();
		List<MusicChartDTO> musicChartList = new ArrayList<>();
		Elements element = document.select("table tbody tr.lst50, table tbody tr.lst100");
		
		for(Element chartElement : element) {
	        MusicChartDTO musicChartdto = createMusicChartDTO(chartElement);	        
	        musicChartList.add(musicChartdto);
	    }
		return musicChartList;
	}
	
    private MusicChartDTO createMusicChartDTO(Element chartElement) {
        Elements albumHref = chartElement.select("a.image_typeAll");
        String musicRank = chartElement.select("span.rank").html();
        String albumImageSrc = chartElement.select("a.image_typeAll img").attr("src");
        String albumNo = extractAlbumNumber(albumHref);
        String songName = chartElement.select("div.ellipsis.rank01 a").html();
        String artistName = chartElement.select("div.ellipsis.rank02 span a").html();
        String albumName = chartElement.select("div.ellipsis.rank03 a").html();
        
        MusicChartDTO musicChartdto = 
        		new MusicChartDTO(musicRank, albumImageSrc, albumNo, songName, artistName, albumName);
        
        return musicChartdto;
    }
	
	private String extractAlbumNumber(Elements albumHref) {
        String[] albumNumberList = albumHref.attr("href").split("\\D+");
        StringBuilder albumNumber = new StringBuilder();
        for (String no : albumNumberList) {
            albumNumber.append(no);
        }
        return albumNumber.toString();
	}

	public List<MusicChartDTO> getMusicArtistList() throws IOException {
		Document document =  Jsoup.connect(MELON_CHART_URL).get();
		Elements artistElement = document.select("div.ellipsis.rank02 span a");
		List<String> artistList = extractArtistName(artistElement);
		return musicChartDao.musicArtistList(artistList);
	}

	private List<String> extractArtistName(Elements artistElement) {
		List<String> artistList = new ArrayList<String>();
		for(Element artistName : artistElement) {
			artistList.add(artistName.html());
		}
		return artistList;
	}

}
