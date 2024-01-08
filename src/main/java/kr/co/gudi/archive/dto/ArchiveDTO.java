package kr.co.gudi.archive.dto;

import java.sql.Date;

public class ArchiveDTO {

	private int arch_no;
	private int member_no;
	private String arch_depart;
	private Date arch_date;
	
	private int file_no;
    private String file_location;
    private int file_unique_no;
    private String file_oriname;
    private String file_newname;
    private String file_size;
    private String file_state;
    
	public int getArch_no() {
		return arch_no;
	}
	public void setArch_no(int arch_no) {
		this.arch_no = arch_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getArch_depart() {
		return arch_depart;
	}
	public void setArch_depart(String arch_depart) {
		this.arch_depart = arch_depart;
	}
	public Date getArch_date() {
		return arch_date;
	}
	public void setArch_date(Date arch_date) {
		this.arch_date = arch_date;
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getFile_location() {
		return file_location;
	}
	public void setFile_location(String file_location) {
		this.file_location = file_location;
	}
	public int getFile_unique_no() {
		return file_unique_no;
	}
	public void setFile_unique_no(int file_unique_no) {
		this.file_unique_no = file_unique_no;
	}
	public String getFile_oriname() {
		return file_oriname;
	}
	public void setFile_oriname(String file_oriname) {
		this.file_oriname = file_oriname;
	}
	public String getFile_newname() {
		return file_newname;
	}
	public void setFile_newname(String file_newname) {
		this.file_newname = file_newname;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public String getFile_state() {
		return file_state;
	}
	public void setFile_state(String file_state) {
		this.file_state = file_state;
	}
	
	
}
