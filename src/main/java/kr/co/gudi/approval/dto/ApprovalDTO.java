package kr.co.gudi.approval.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("approval")
public class ApprovalDTO {
	
	// approval
	private int approval_no;
	private int member_no;
	private String approval_title;
	private String approval_content;
	private Date approval_start;
	private Date approval_end;
	private int approval_state;
	private int document_state;
	private int form_no;
	
	// approver
	private int approver_no;
	private int approval_order;
	private int sortation;
	
	// approval_history
	private int history_no;
	private int processing_result;
	private String reason;
	private Date processing_date;
	
	// vacation_appr
	private int vacappr_no;
	private int use_days;
	private Date vacappr_startdate;
	private Date vacappr_enddate;
	private int vac_type;
	private int vac_starttime;
	
	public int getApproval_no() {
		return approval_no;
	}
	public void setApproval_no(int approval_no) {
		this.approval_no = approval_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getApproval_title() {
		return approval_title;
	}
	public void setApproval_title(String approval_title) {
		this.approval_title = approval_title;
	}
	public String getApproval_content() {
		return approval_content;
	}
	public void setApproval_content(String approval_content) {
		this.approval_content = approval_content;
	}
	public Date getApproval_start() {
		return approval_start;
	}
	public void setApproval_start(Date approval_start) {
		this.approval_start = approval_start;
	}
	public Date getApproval_end() {
		return approval_end;
	}
	public void setApproval_end(Date approval_end) {
		this.approval_end = approval_end;
	}
	public int getApproval_state() {
		return approval_state;
	}
	public void setApproval_state(int approval_state) {
		this.approval_state = approval_state;
	}
	public int getDocument_state() {
		return document_state;
	}
	public void setDocument_state(int document_state) {
		this.document_state = document_state;
	}
	public int getForm_no() {
		return form_no;
	}
	public void setForm_no(int form_no) {
		this.form_no = form_no;
	}
	public int getApprover_no() {
		return approver_no;
	}
	public void setApprover_no(int approver_no) {
		this.approver_no = approver_no;
	}
	public int getApproval_order() {
		return approval_order;
	}
	public void setApproval_order(int approval_order) {
		this.approval_order = approval_order;
	}
	public int getSortation() {
		return sortation;
	}
	public void setSortation(int sortation) {
		this.sortation = sortation;
	}
	public int getHistory_no() {
		return history_no;
	}
	public void setHistory_no(int history_no) {
		this.history_no = history_no;
	}
	public int getProcessing_result() {
		return processing_result;
	}
	public void setProcessing_result(int processing_result) {
		this.processing_result = processing_result;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getProcessing_date() {
		return processing_date;
	}
	public void setProcessing_date(Date processing_date) {
		this.processing_date = processing_date;
	}
	public int getVacappr_no() {
		return vacappr_no;
	}
	public void setVacappr_no(int vacappr_no) {
		this.vacappr_no = vacappr_no;
	}
	public int getUse_days() {
		return use_days;
	}
	public void setUse_days(int use_days) {
		this.use_days = use_days;
	}
	public Date getVacappr_startdate() {
		return vacappr_startdate;
	}
	public void setVacappr_startdate(Date vacappr_startdate) {
		this.vacappr_startdate = vacappr_startdate;
	}
	public Date getVacappr_enddate() {
		return vacappr_enddate;
	}
	public void setVacappr_enddate(Date vacappr_enddate) {
		this.vacappr_enddate = vacappr_enddate;
	}
	public int getVac_type() {
		return vac_type;
	}
	public void setVac_type(int vac_type) {
		this.vac_type = vac_type;
	}
	public int getVac_starttime() {
		return vac_starttime;
	}
	public void setVac_starttime(int vac_starttime) {
		this.vac_starttime = vac_starttime;
	}
}
