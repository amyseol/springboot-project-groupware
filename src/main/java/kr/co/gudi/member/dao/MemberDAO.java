package kr.co.gudi.member.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.member.vo.MemberVO;

@Mapper
public interface MemberDAO {
	MemberVO selectMemberByParam(Map<String, Object> param);

	MemberVO selectApprovMember(String member_id);

	int updateProfileImg(Map<String, Object> param);

	void fileNo(String member_no);

	MemberVO getMember();
}
