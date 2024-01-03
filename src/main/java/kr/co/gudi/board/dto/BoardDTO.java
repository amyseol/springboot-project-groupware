package kr.co.gudi.board.dto;


import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("bbs")
public class BoardDTO {
	private int board_no;
	private int member_no;
	private String board_depart;
	private String board_title;
	private String board_content;
	
	private Date board_date;
	
	
	private int bHit;
	private String board_state;
	
	
	

	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getBoard_depart() {
		return board_depart;
	}
	public void setBoard_depart(String board_depart) {
		this.board_depart = board_depart;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public String getBoard_state() {
		return board_state;
	}
	public void setBoard_state(String board_state) {
		this.board_state = board_state;
	}
	
	
}
