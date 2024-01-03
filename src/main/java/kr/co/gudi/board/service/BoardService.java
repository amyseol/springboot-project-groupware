package kr.co.gudi.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.board.dao.BoardDAO;
import kr.co.gudi.board.dto.BoardDTO;
import kr.co.gudi.board.dto.BoardPhotoDTO;

@Service
public class BoardService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Value("${spring.servlet.multipart.location}") private String root;
	@Autowired BoardDAO dao;
	
	public ArrayList<BoardDTO> list() {
		logger.info("service list 함수");
		return dao.list();
	}

	public void write(BoardDTO dto, MultipartFile[] photos) {
		logger.info("service write 함수");
		
		dao.write(dto);
		
		int board_no = dto.getMember_no();
		
		if (photos != null && photos.length > 0) {
            for (MultipartFile photo : photos) {
            	saveFile(board_no, photos);
            }
        }
	}
	
	// 파일 저장
    private void saveFile(int board_no, MultipartFile[] photos) {
    	
    	for(MultipartFile photo : photos) {
    		String file_oriname = photo.getOriginalFilename();
    		logger.info("OriginalFilename : "+file_oriname);
    		if(!file_oriname.equals("")) {
    			//파일 이름 변경
    			String ext = file_oriname.substring(file_oriname.lastIndexOf("."));
    		}
    	}
    	
    	
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
