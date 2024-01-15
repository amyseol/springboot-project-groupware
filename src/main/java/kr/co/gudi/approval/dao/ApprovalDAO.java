package kr.co.gudi.approval.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gudi.approval.dto.ApprovalDTO;

@Mapper
public interface ApprovalDAO {
	
	ApprovalDTO draftsmanInfo(int member_no);

	ArrayList<ApprovalDTO> departmentsInfo();

	ArrayList<ApprovalDTO> membersInfo();
	
	ApprovalDTO setApprover(int member_no);
	
	void commWrite(ApprovalDTO dto);

	void saveFile(String file_location, int approval_no, String oriFileName, String newFileName, int size);

	void draftWrite(HashMap<String, String> params);

	void firstApprover(HashMap<String, String> params);

	void secondApprover(HashMap<String, String> params);

	void thirdApprover(HashMap<String, String> params);

	void observer(String obs, int approval_no);

	ArrayList<ApprovalDTO> draftList(int member_no);

	ArrayList<ApprovalDTO> apprList(int member_no);

	ArrayList<ApprovalDTO> refList(int member_no);

	ApprovalDTO draftDocDetailInfo(int approval_no);

	ArrayList<ApprovalDTO> fileInfo(int approval_no);

	ArrayList<ApprovalDTO> apprInfo(int approval_no);

	ArrayList<ApprovalDTO> refInfo(int approval_no);

	int dratfVarification(int approval_no, int member_no);

	int apprVarification(int approval_no, int member_no);

	int apprOrder(int approval_no, int member_no);

	int getapproverNo(int member_no, int approval_no);

	void commApprove(int approverNo, String approveReason);

	int getApprCnt(int approval_no);

	int getMyApprNum(int member_no, int approval_no);
	
	void apprToss(int approval_no);
	
	void apprFinish(int approval_no);

	void apprReturn(int approverNo, String returnReason);

	void ReturnFinish(int approval_no);

	void withdrawl(int approval_no);

	

	


}
