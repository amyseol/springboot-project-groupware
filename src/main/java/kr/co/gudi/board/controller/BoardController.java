package kr.co.gudi.board.controller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.board.dto.BoardDTO;
import kr.co.gudi.board.service.BoardService;

@Controller
public class BoardController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardService service;
	/*
	@RequestMapping(value={ "/"})
	public String list(Model model) {
		logger.info("===list 함수===");
		
		ArrayList<BoardDTO> list = service.list();
		model.addAttribute("list", list);
		
		return "board/boardList";
	}
	*/
	@RequestMapping(value = "/board")
	public String home() {
		return "board/boardList1";
	}
	 
	@GetMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(@RequestParam String page,@RequestParam String board_name ){
		logger.info("보여줄 페이지 : "+page);
		
		return service.list(page,board_name);
	}
	

	@GetMapping(value = "/board/boardWrite")
	public String boardWrite() {
		logger.info("boardWrite로 이동");
		return "board/boardWrite";
	}
	
	@PostMapping(value = "/board/write")
	public String write(BoardDTO dto, MultipartFile[] photos) throws Exception {
		if(photos==null) {
			logger.info("photos null");
		}else {
		
		logger.info("===write 함수===");
		logger.info("file 갯수 : "+photos.length);
		service.write(dto, photos);
		}
		return "redirect:./";
	}
	
	@GetMapping(value = "/boardDetail")
	public String detail(@RequestParam String board_no, Model model) {
		logger.info("===detail 함수===");
		service.detail(board_no,model);
		
		return "board/boardDetail";
	}

	@GetMapping(value = "/board/del")
	public String del(@RequestParam String board_no) {
		logger.info("===del 함수===");
		service.del(board_no);
		return "redirect:./";
	}
	
	@GetMapping(value = "/boardModify")
	public String boardModify(@RequestParam String board_no, Model model) {
		logger.info("===boardModify 함수===");
		model.addAttribute("board", service.boardModify(board_no));
		return "board/BoardModify";
	}
	
	@PostMapping(value = "/modify")
	public ModelAndView modify(@RequestParam HashMap<String, String> params, @RequestParam("photos") MultipartFile file) {
		String board_no = (String) params.get("board_no");
		ModelAndView mav = new ModelAndView("redirect:/board/boardModify"+board_no);
		logger.info("수정 내용 {} : "+params);
		service.modify(board_no, params, file);
		
		return mav;
	}
	
	/*
	@GetMapping(value = "/boardSearch")
	@ResponseBody
	public Map<String, Object> boardSearch(String board_name, String page){
		return service.boardSearch(board_name, page);
	}
	*/
	/*
	@PostMapping(value = "board/modify")
	public String modify(@RequestParam HashMap<String, String> params, @RequestParam("photos") MultipartFile file) {
		logger.info("===modify 함수===");
		String page = "redirect:./boardModify?board_no="+params.get("board_no");
		try {
			// 이미지 파일이 업로드된 경우에만 처리
			if (!file.isEmpty()) {
				// 이미지 파일 업로드 처리
				String file_oriname = file.getOriginalFilename();
				String ext = file_oriname.substring(file_oriname.lastIndexOf("."));
				String file_newname = System.currentTimeMillis() + ext;
				long fileSize = file.getSize(); //@@@@@@@@@@@@--> 소숫점 제거 마지막에 정수형 int 사용
				
				// 파일 저장
				byte[] fileBytes = file.getBytes();
				// 저장 경로 설정 (root는파일이 저장될 실제 경로) -- / 를 빼보기
	            Path path = Paths.get("root/"+file_newname);
	            
	            // 파일 정보 및 게시글 수정
	            params.put("img_file", file_newname); // 이미지 파일 정보를 params에 추가
	            if(service.modify(params)>0) {
	            	logger.info("게시글 및 이미지 수정 완료");
	            	page = "redirect:./detail?board_no="+params.get("board_no");
	            } else {
	                logger.info("게시글 또는 이미지 수정 실패");
	            }
			}
		}catch (Exception e) {
			e.printStackTrace();
	        // 파일 업로드 중 오류 발생 시 처리
	        logger.error("파일 업로드 오류: " + e.getMessage());
		}
		return page;
	}	
	
	*/
	
}
