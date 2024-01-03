package kr.co.gudi.member.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.member.dto.Department;
import kr.co.gudi.member.dto.MemberDTO;
import kr.co.gudi.member.vo.MemberVO;


@Mapper
public interface MemberDAO {
	MemberVO selectMemberByParam(Map<String, Object> param);

	MemberVO selectApprovMember(String member_id);

	int updateProfileImg(Map<String, Object> param);

	int searchFileNo(int member_no);
	
	MemberVO getMember();

	String findPhoto(int file_no);
	
	List<Department> getAllDepartments();

	List<MemberDTO> getTeamList(int depart_no);

	List<MemberDTO> getMemberList(int depart_no);
	
	List<MemberDTO> getMemberDetail(int member_no);

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
