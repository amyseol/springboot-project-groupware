package kr.co.gudi.approval.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.approval.dto.ApprovalDTO;

@Mapper
public interface ApprovalDAO {
	
	void commWrite(ApprovalDTO dto);

	void saveFile(String file_location, int approval_no, String oriFileName, String newFileName, int size);

	void draftWrite(HashMap<String, String> params);

	void firstApprover(HashMap<String, String> params);

	void secondApprover(HashMap<String, String> params);

	void thirdApprover(HashMap<String, String> params);

	void observer(String obs, int approval_no);

}
