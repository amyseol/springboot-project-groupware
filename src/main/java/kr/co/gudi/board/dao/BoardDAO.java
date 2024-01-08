package kr.co.gudi.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.board.dto.BoardDTO;

@Mapper
public interface BoardDAO {

	//ArrayList<BoardDTO> list();

	void write(BoardDTO dto);

	BoardDTO detail(String board_no);

	void bHit(String board_no);
	
	int del(String board_no);

	int modify(HashMap<String, String> params);

	void writePhoto(int board_no, String file_oriname, String file_newname, long fileSize);

	ArrayList<BoardDTO> getPhoto(String board_no);

	//int modifyImage(HashMap<String, String> params);

	void modifyImage(String file_location, String board_no, String file_oriname, String file_newname, int size);

	int totalPage();
	
	ArrayList<BoardDTO> list(int ppn);

	ArrayList<BoardDTO> boardSearch(String board_name, int offset);

}
