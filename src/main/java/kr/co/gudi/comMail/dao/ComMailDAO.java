package kr.co.gudi.comMail.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.comMail.dto.ComMailDTO;

@Mapper
public interface ComMailDAO {

	int getReTotalMail(int member_no);

	int getReUnreadMail(int member_no);
	
	ArrayList<ComMailDTO> receiveList(int offset, String loginId);

	ArrayList<ComMailDTO> receiveListRead(int offset, String loginId);
	
	ArrayList<ComMailDTO> receiveListUnread(int offset, String loginId);
	
	int totalPage();

	ArrayList<ComMailDTO> reMailSearch(String search_info, int offset);

	void delReceive(String idx);

	ComMailDTO receiveMailDetail(String note_no);

	ArrayList<ComMailDTO> getFile(String note_no);
	
	int getSeTotalMail(int member_no);
	
	int getSeUnreadMail(int member_no);

	ArrayList<ComMailDTO> sendList(int offset, String loginId);
	
	ArrayList<ComMailDTO> sendListRead(int offset, String loginId);
	
	ArrayList<ComMailDTO> sendListUnread(int offset, String loginId);
	
	ArrayList<ComMailDTO> seMailSearch(String search_info, int offset);
	
	void delSend(String idx);
	
	ComMailDTO sendMailDetail(String note_no);
	
	ComMailDTO write(HashMap<String, String> param);

	int getReceiverNo(String receiver_name);

	void upload(ComMailDTO dto);

	void updateSeState(String note_no);

	void updateReState(String note_no);
}
