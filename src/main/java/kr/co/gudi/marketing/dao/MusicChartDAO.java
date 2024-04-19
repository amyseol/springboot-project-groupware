package kr.co.gudi.marketing.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.co.gudi.marketing.dto.MusicChartDTO;

@Mapper
public interface MusicChartDAO {

	List<MusicChartDTO> musicArtistList(List<String> artistList);
	
}
