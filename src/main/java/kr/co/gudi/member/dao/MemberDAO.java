package kr.co.gudi.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.member.dto.MemberDTO;

@Mapper
public interface MemberDAO {

	void join(HashMap<String, String> params);

	int getMember_id();

	void uploadProfile(String file_location, int file_unique_no, String oriFileName, String newFileName, int size);

	ArrayList<MemberDTO> list(String member_state, String depart_name);

	void depart(int member_no, String depart_name);

	void team(int member_no, String team_name);

	ArrayList<MemberDTO> detail(String member_no);

	String file(String member_no, String string);

	void updateDo(String member_no);

	void updateDo(HashMap<String, Object> params);

	void updateDepart(HashMap<String, Object> params);

	void updateTeam(HashMap<String, Object> params);

	void updateProfile(String file_location, String member_no, String oriFileName, String newFileName, int size);

	HashMap<String, Object> departList(String depart_state);

	List<MemberDTO> getDepartList();

	List<MemberDTO> teamList(int depart_no);

	

}
