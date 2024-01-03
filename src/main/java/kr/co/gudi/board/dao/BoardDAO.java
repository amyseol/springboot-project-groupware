package kr.co.gudi.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.board.dto.BoardDTO;

@Mapper
public interface BoardDAO {

	ArrayList<BoardDTO> list();

	void write(BoardDTO dto);

	BoardDTO detail(String board_no);

	void bHit(String board_no);
	
	void del(String board_no);

	int modify(HashMap<String, String> params);

}
