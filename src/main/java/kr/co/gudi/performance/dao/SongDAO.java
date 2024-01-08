package kr.co.gudi.performance.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.performance.dto.SongDTO;

@Mapper
public interface SongDAO {

	ArrayList<SongDTO> list(int offset);

	int totalPage();

	SongDTO songDetail(String song_no);

	ArrayList<SongDTO> getFile(String song_no);

	ArrayList<SongDTO> songSearch(String search_info, int offset);

	void fileUpload(int song_no, String oriFileName, String newFileName, String size);

}
