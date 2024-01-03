package kr.co.gudi.member.dao;

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
}
