package kr.co.gudi.member.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.gudi.member.dao.MemberDAO;
import kr.co.gudi.member.dto.Department;
import kr.co.gudi.member.dto.MemberDTO;
import kr.co.gudi.member.vo.MemberVO;

@Service
public class MemberService implements UserDetailsService{
	Logger logger = LoggerFactory.getLogger(getClass());
	
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

	public void updateProfileImg(Map<String, Object> param, Model model, String path) {

		int member_no = (int) param.get("member_no");
		int file_no =  dao.searchFileNo(member_no);
		param.put("file_no", file_no);
		dao.updateProfileImg(param);
		//String new_name = dao.findPhoto(file_no);
		logger.info(path);
		model.addAttribute("photo", path);
	}

	public MemberVO getMember() {
		return dao.getMember();
	}
	
	public List<Department> getAllDepartments() {
		return dao.getAllDepartments();
	}

	public List<MemberDTO> getTeamList(int depart_no) {
		return dao.getTeamList(depart_no);
	}

	public List<MemberDTO> getMemberList(int depart_no) {
		return dao.getMemberList(depart_no);
	}
}
