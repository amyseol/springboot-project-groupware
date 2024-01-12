package kr.co.gudi.board.controller;

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
import kr.co.gudi.member.vo.MemberVO;

@Controller
public class BoardController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardService service;
	
	@RequestMapping(value = "/board")
	public String home() {
		return "board/boardList"; 
		
	}
	 
	@RequestMapping(value = "/boardD")
	public String homeD() {
		return "board/boardListD"; 
		
	}
	
	@GetMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(@RequestParam String page,@RequestParam String board_name, HttpSession session){
		
		int member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
	    logger.info("@@ list @@ 세션 로그인 아이디 체크 : "+member_no);
		logger.info("보여줄 페이지 : "+page);
		
		return service.list(page,board_name,member_no);
	}
	

	@GetMapping(value = "/listD")
	@ResponseBody
	public Map<String, Object> listD(@RequestParam String page,@RequestParam String board_name, HttpSession session){
		
		int member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
	    logger.info("@@ listD @@ 세션 로그인 아이디 체크 : "+member_no);
		logger.info("보여줄 페이지 : "+page);
		
		return service.listD(page,board_name,member_no);
	}
	
	@GetMapping(value = "/boardWrite")
	public String boardWrite() {
		logger.info("boardWrite로 이동");
		return "board/boardWrite";
	}
	
	@GetMapping(value = "/boardWriteD")
	public String boardWriteD(HttpSession session) {
		logger.info("boardWriteD로 이동");
		
		int member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
	    logger.info("@@boardWriteD@@ 세션 로그인 아이디 체크 : "+member_no);
		
	    if(member_no == 20) {
	    	return "board/boardWriteD";
	    }
	    return "redirect:./";
	}
	
	@PostMapping(value = "/write")
	public String write(BoardDTO dto, MultipartFile[] photos, HttpSession session) throws Exception {
		
		int member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
	    logger.info("@@write@@ 세션 로그인 아이디 체크 : "+member_no);
	    String depart_name=((MemberVO)session.getAttribute("loginMember")).getDepart_name();
	    logger.info("로그인한 부서명 : "+depart_name);
	    dto.setMember_no(member_no);
	    dto.setBoard_depart(depart_name);
	    
		if(photos==null) {
			logger.info("photos null");
		}else {
		
		logger.info("===write 함수===");
		logger.info("file 갯수 : "+photos.length);
		service.write(dto, photos);
		}
		return "redirect:./";
	}
	
	@PostMapping(value = "/writeD")
	public String writeD(BoardDTO dto, MultipartFile[] photos, HttpSession session) throws Exception {
		
		int member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
	    logger.info("@@writeD@@ 세션 로그인 아이디 체크 : "+member_no);
	    String depart_name=((MemberVO)session.getAttribute("loginMember")).getDepart_name();
	    logger.info("로그인한 부서명 : "+depart_name);
	    dto.setMember_no(member_no);
	    dto.setBoard_depart("전사");
	     
		if(photos==null) {
			logger.info("photos null");
		}else {
		
		logger.info("===writeD 함수===");
		logger.info("file 갯수 : "+photos.length);
		service.writeD(dto, photos);
		}
		return "redirect:./";
	}
	
	@GetMapping(value = "/boardDetail")
	public String detail(@RequestParam String board_no, Model model, HttpSession session) {
		logger.info("===detail 함수===");
		
		int member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
	    logger.info("@@detail@@ 세션 로그인 아이디 체크 : "+member_no);
	    
		service.detail(board_no,model);
		
		return "board/boardDetail";
	}

	@GetMapping(value = "/del")
	public String del(@RequestParam String board_no) {
		logger.info("===del 함수===");
		service.del(board_no);
		return "redirect:./";
	}
	
	@GetMapping(value = "/boardModify")
	public String boardModify(@RequestParam String board_no, Model model) {
		logger.info("===boardModify 함수===");
		model.addAttribute("board", service.boardModify(board_no));
		return "board/boardModify";
	}
	
	@PostMapping(value = "/modify")
	public ModelAndView modify(@RequestParam HashMap<String, String> params, @RequestParam("photos") MultipartFile file) {
		String board_no = (String) params.get("board_no");
		ModelAndView mav = new ModelAndView("board/boardModify");
		logger.info("수정 내용 {} : "+params);
		service.modify(board_no, params, file);
		
		return mav;
	}
	
	
}
