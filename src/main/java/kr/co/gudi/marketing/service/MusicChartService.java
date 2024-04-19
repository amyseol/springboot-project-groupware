package kr.co.gudi.marketing.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import kr.co.gudi.marketing.dao.MusicChartDAO;
import kr.co.gudi.marketing.dto.MusicChartDTO;

@Service
public class MusicChartService {
	
	private final MusicChartDAO musicChartDao;
	private static final String MELON_CHART_URL = "https://www.melon.com/chart/index.htm";	
		
	public MusicChartService(MusicChartDAO musicChartDao) {
		this.musicChartDao = musicChartDao;
	}
	
	public void getChartDatetime(Model model) throws Exception {
		Document document = Jsoup.connect(MELON_CHART_URL).get();
		Elements timeDateElement = document.select("div.multi_row"); 
		model.addAttribute("time", timeDateElement.select("span.hour").html());
		model.addAttribute("date", timeDateElement.select("span.year").html());
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
        MusicChartDTO musicChartdto = new MusicChartDTO();
        Elements albumHref = chartElement.select("a.image_typeAll");
        String albumNo = extractAlbumNumber(albumHref);
        musicChartdto.setAlbumNo(albumNo);
        musicChartdto.setMusicRank(chartElement.select("span.rank").html());
        musicChartdto.setAlbumImageSrc(chartElement.select("a.image_typeAll img").attr("src"));	        
        musicChartdto.setSongName(chartElement.select("div.ellipsis.rank01 a").html());
        musicChartdto.setArtistName(chartElement.select("div.ellipsis.rank02 span a").html());
        musicChartdto.setAlbumName(chartElement.select("div.ellipsis.rank03 a").html());
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
