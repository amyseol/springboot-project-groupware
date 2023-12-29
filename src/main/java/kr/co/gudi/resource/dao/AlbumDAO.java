package kr.co.gudi.resource.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.resource.dto.AlbumDTO;

@Mapper
public interface AlbumDAO {

	ArrayList<AlbumDTO> list(int offset);

	int totalPage();

	AlbumDTO detail(String alb_no);

	ArrayList<AlbumDTO> searchList(String a_name, int offset);

	ArrayList<AlbumDTO> chartData(String num, String optionVal);

}
