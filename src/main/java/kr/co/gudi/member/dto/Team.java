package kr.co.gudi.member.dto;

import java.io.Serializable;
import java.util.List;


public class Team implements Serializable{
	private static final long serialVersionUID = 7130428203635528055L;
	private int team_no;
	private String team_name;
	private int team_member;
	private String team_state;
	private List<MemberDTO> memberDTO;
	
	public int getTeam_no() {
		return team_no;
	}
	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public int getTeam_member() {
		return team_member;
	}
	public void setTeam_member(int team_member) {
		this.team_member = team_member;
	}
	public String getTeam_state() {
		return team_state;
	}
	public void setTeam_state(String team_state) {
		this.team_state = team_state;
	}
	public List<MemberDTO> getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(List<MemberDTO> memberDTO) {
		this.memberDTO = memberDTO;
	}
}
