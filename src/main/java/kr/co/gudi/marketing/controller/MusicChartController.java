package kr.co.gudi.marketing.controller;

import java.io.IOException;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.gudi.marketing.dto.MusicChartDTO;
import kr.co.gudi.marketing.service.MusicChartService;

@Controller
public class MusicChartController {
	
	private final MusicChartService musicChartService;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public MusicChartController(MusicChartService musicChartService) {
		this.musicChartService = musicChartService;
	}
	
	@GetMapping(value="/musicChart")
	public String musicChart(Model model) throws Exception {
		musicChartService.getChartDatetime(model);
		return "musicChart/musicChart";
	}
	
	@GetMapping(value="/chart/list")
	@ResponseBody
	public List<MusicChartDTO> musicChartList() throws IOException {
		return musicChartService.getMusicChartList();
	}
	
	@GetMapping(value="/musicArtist/list")
	@ResponseBody
	public List<MusicChartDTO> musicArtistList() throws IOException{
		return musicChartService.getMusicArtistList();
	}
	
}
