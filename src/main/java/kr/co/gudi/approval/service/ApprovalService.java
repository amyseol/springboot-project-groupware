package kr.co.gudi.approval.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.approval.dao.ApprovalDAO;
import kr.co.gudi.approval.dto.ApprovalDTO;

@Service
public class ApprovalService {
	@Autowired
	ApprovalDAO apprDao;
	@Value
	("${spring.servlet.multipart.location}") private String root; // C:/upload
	
	Logger log = LoggerFactory.getLogger(getClass());

	public ModelAndView approvalWrite(HashMap<String, String> params, MultipartFile[] files, int member_no, String[] observer) {
		ModelAndView mav = new ModelAndView();
		ApprovalDTO dto = new ApprovalDTO();
		
		// 사진 테이블에 저장할 고유키 값 가져오기 위한 셋팅
		dto.setMember_no(member_no);
		dto.setApproval_title(params.get("title"));
		dto.setApproval_content(params.get("content"));
		int form_no=Integer.parseInt(params.get("form_no"));
		dto.setForm_no(form_no);
		
		// 공통 내용 추가
		apprDao.commWrite(dto);
		int approval_no = dto.getApproval_no();
		String str_no=String.valueOf(approval_no);
		params.put("approval_no", str_no);
		log.info("apprNo : "+approval_no);
		
		// 사용자가 파일을 선택하였지만 파일 크기가 0인 경우
		if (files != null && files.length > 0 && !files[0].isEmpty()) {
			for (MultipartFile file : files) {
				upload(file, approval_no);
			}
		}
		
		// 폼별 내용 추가
		log.info("formNo : "+params.get("form_no"));
		if(params.get("form_no").equals("1")) { // 기안서일 경우
			apprDao.draftWrite(params);
		}else if(params.get("form_no").equals("3")) { // 휴가신청서일 경우
			
		}
		
		// 결재자 or 참조자 추가
		if(params.get("first_approver") != null) {
			apprDao.firstApprover(params);
			if(params.get("second_approver") != null) {
				apprDao.secondApprover(params);
				if(params.get("third_approver") != null) {
					apprDao.thirdApprover(params);
				}
			}
		}
		
		if(observer != null) {
			for (String obs : observer) {
				apprDao.observer(obs, approval_no);
			}
		}
		
		return mav;
	}

	// 단일 파일 업로드
	private void upload(MultipartFile file, int approval_no) {
		String oriFileName = file.getOriginalFilename(); // 파일명 추출
		String ext = oriFileName.substring(oriFileName.lastIndexOf(".")); // 확장자 추출
		String newFileName = System.currentTimeMillis()+ext; // 새파일명생성 + 확장자
		String file_location = "a";
		try {
			byte[] bytes = file.getBytes();
			double fileSizeInKB = bytes.length / 1024.0;
			int size=(int) fileSizeInKB;
			Path path = Paths.get(root+"/"+newFileName);
			Files.write(path, bytes);
			// 파일위치(a),해당테이블pk(member_no),오리네임,뉴네임,사이즈
			apprDao.saveFile(file_location, approval_no, oriFileName, newFileName, size);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
