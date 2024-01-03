package kr.co.gudi.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.board.dto.BoardDTO;
import kr.co.gudi.board.service.BoardService;

@Controller
public class BoardController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardService service;
	
	@RequestMapping(value={ "/board"})
	public String list(Model model) {
		logger.info("===list 함수===");
		
		ArrayList<BoardDTO> list = service.list();
		model.addAttribute("list", list);
		
		return "board/boardList";
	}
	
	@GetMapping(value = "/board/boardWrite")
	public String boardWrite() {
		logger.info("boardWrite로 이동");
		return "board/boardWrite";
	}
	
	@PostMapping(value = "/board/write")
	public String write(BoardDTO dto, MultipartFile[] photos) {
		logger.info("===write 함수===");
		logger.info("file 갯수 : "+photos.length);
		service.write(dto, photos);
		return "redirect:./";
	}
	
	@GetMapping(value = "/board/detail")
	public String detail(@RequestParam String board_no, Model model) {
		logger.info("===detail 함수===");
		BoardDTO board = service.detail(board_no);
		model.addAttribute("board", board);
		
		return "board/boardDetail";
	}

	@GetMapping(value = "/board/del")
	public String del(@RequestParam String board_no) {
		logger.info("===del 함수===");
		service.del(board_no);
		return "redirect:./";
	}
	
	@GetMapping(value = "board/boardModify")
	public String boardModify(@RequestParam String board_no, Model model) {
		logger.info("===boardModify 함수===");
		model.addAttribute("board", service.boardModify(board_no));
		return "board/boardModify";
	}
	
	@PostMapping(value = "board/modify")
	public String modify(@RequestParam HashMap<String, String> params) {
		logger.info("===modify 함수===");
		String page = "redirect:./boardModify?board_no="+params.get("board_no");
		if(service.modify(params)>0) {
			logger.info("수정 완료");
			page = "redirect:./detail?board_no="+params.get("board_no");
		}else {
			logger.info("수정 실패");
		}		
		return page;
	}
}
