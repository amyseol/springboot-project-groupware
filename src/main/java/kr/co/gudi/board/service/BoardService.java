package kr.co.gudi.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.board.dao.BoardDAO;
import kr.co.gudi.board.dto.BoardDTO;

@Service
public class BoardService {
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired BoardDAO dao;
	
	public ArrayList<BoardDTO> list() {
		logger.info("service list 함수");
		return dao.list();
	}

	public void write(BoardDTO dto) {
		logger.info("service write 함수");
		dao.write(dto);
	}
	
	public BoardDTO detail(String board_no) {
		logger.info("디테일메서드");
		dao.bHit(board_no); 
		return dao.detail(board_no);
	}

	public void del(String board_no) {
		dao.del(board_no);
	}

	public BoardDTO boardModify(String board_no) {
		return dao.detail(board_no);
	}

	public int modify(HashMap<String, String> params) {
		return dao.modify(params);
	}

}
