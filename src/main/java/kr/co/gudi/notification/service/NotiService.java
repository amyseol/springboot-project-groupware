package kr.co.gudi.notification.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.member.vo.MemberVO;
import kr.co.gudi.notification.dao.NotiDAO;

@Service
public class NotiService {

	@Autowired NotiDAO dao;
	

}
