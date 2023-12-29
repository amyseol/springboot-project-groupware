package kr.co.gudi.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.gudi.member.dao.MemberDAO;
import kr.co.gudi.member.vo.MemberVO;

@Service
public class MemberService implements UserDetailsService{
	@Autowired
	private MemberDAO dao;
	
	public MemberVO selectMemberByParam(Map<String, Object> param) {
		return dao.selectMemberByParam(param);
	}
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO loginMember = dao.selectMemberByParam(Map.of("member_id", username));
		if(loginMember==null) return null;
		return loginMember;
	}

	public MemberVO selectApprovMember(String member_id) {
		return dao.selectApprovMember(member_id);
	}

	public void updateProfileImg(Map<String, Object> param) {
		String member_no = (String) param.get("member_no");
		dao.fileNo(member_no);
		
		/*
		if (service.updateProfileImg(param) > 0) {
			model.addAttribute("msg", "프로필이 수정되었습니다.");
			model.addAttribute("url", "/mypage");
			session.setAttribute("loginMember", service.selectMemberByParam(param));
		} else {
			model.addAttribute("msg", "프로필 수정에 실패하였습니다!!");
			model.addAttribute("url", "/mypage");
		}
		*/
	}

	public MemberVO getMember() {
		return dao.getMember();
	}
}
