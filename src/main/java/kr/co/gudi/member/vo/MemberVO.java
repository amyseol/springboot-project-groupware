package kr.co.gudi.member.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.co.gudi.member.dto.Department;
import kr.co.gudi.member.dto.MemberAuthority;
import kr.co.gudi.member.dto.Team;


public class MemberVO implements UserDetails {
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	private int member_no;
	private String member_car_no;
	private String member_id;
	private String pw;
	private String profileImg;
	private String name;
	private String gender;
	private Date birth;
	private String phone;
	private String address;
	private String email;
	private Date hired;
	private int total_leave;
	private int total_point;
	private String member_state;
	private Date resign_date;
	private Department dept;
	private Team team;
	private String member_position;
	

	@Override		// 권한 판단
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<>();
		
		// 부서와 팀에 따른 권한 부여
		if (dept.getDepart_name().equals("경영지원 본부")) {
			if (team.getTeam_name().equals("인사팀")) {
				auth.add(new SimpleGrantedAuthority(MemberAuthority.TEAM_EMP.name()));
			} else if(team.getTeam_name().equals("지원팀")){
				auth.add(new SimpleGrantedAuthority(MemberAuthority.TEAM_EMP.name()));
			} else if(team.getTeam_name().equals("총무팀")) {
				auth.add(new SimpleGrantedAuthority(MemberAuthority.TEAM_EMP.name()));
			}
		} else if(dept.getDepart_name().equals("운영 본부")){
			if (team.getTeam_name().equals("물류팀")) {
				auth.add(new SimpleGrantedAuthority(MemberAuthority.TEAM_EMP.name()));
			} else if(team.getTeam_name().equals("저작권 관리팀")){
				auth.add(new SimpleGrantedAuthority(MemberAuthority.TEAM_EMP.name()));
			} else if(team.getTeam_name().equals("계약운영 관리팀")){
				auth.add(new SimpleGrantedAuthority(MemberAuthority.TEAM_EMP.name()));
			} else if(team.getTeam_name().equals("전략분석 관리팀")){
				auth.add(new SimpleGrantedAuthority(MemberAuthority.TEAM_EMP.name()));
			}
		} else if(dept.getDepart_name().equals("마케팅 본부")) {
			if (team.getTeam_name().equals("광고팀")) {
				auth.add(new SimpleGrantedAuthority(MemberAuthority.TEAM_EMP.name()));
			} else if(team.getTeam_name().equals("기획팀")){
				auth.add(new SimpleGrantedAuthority(MemberAuthority.TEAM_EMP.name()));
			} else if(team.getTeam_name().equals("영상디자인팀")){
				auth.add(new SimpleGrantedAuthority(MemberAuthority.TEAM_EMP.name()));
			}
		}
		return auth;
	}

	@Override		// 사용자 id 반환
	public String getUsername() {
		return member_id;
	}
	
	
	@Override		// 사용자 pw 반환
	public String getPassword() {
		return pw;
	}


	@Override		// 계정 만료 여부 반환
	public boolean isAccountNonExpired() {
		return true;	// true : 만료되지 않음
	}


	@Override		// 계정 잠금 여부 반환
	public boolean isAccountNonLocked() {
		return true;	// true : 잠금 되지 않음
	}


	@Override		// 비밀번호 만료 여부 반환, 퇴사 기간이 지났거나 입사 전이면 권한 없음
	public boolean isCredentialsNonExpired() {
		Date today = new Date();
		return resign_date==null || (today.before(resign_date)&&today.after(hired));
	}


	@Override		// 계정 사용 가능 여부 반환
	public boolean isEnabled() {
		return true;	// true : 사용 가능
	}

	
	public BCryptPasswordEncoder getEncoder() {
		return encoder;
	}


	public void setEncoder(BCryptPasswordEncoder encoder) {
		this.encoder = encoder;
	}


	public int getMember_no() {
		return member_no;
	}


	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}


	public String getMember_car_no() {
		return member_car_no;
	}


	public void setMember_car_no(String member_car_no) {
		this.member_car_no = member_car_no;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getProfileImg() {
		return profileImg;
	}


	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getHired() {
		return hired;
	}


	public void setHired(Date hired) {
		this.hired = hired;
	}


	public int getTotal_leave() {
		return total_leave;
	}


	public void setTotal_leave(int total_leave) {
		this.total_leave = total_leave;
	}


	public int getTotal_point() {
		return total_point;
	}


	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}


	public String getMember_state() {
		return member_state;
	}


	public void setMember_state(String member_state) {
		this.member_state = member_state;
	}


	public Date getResign_date() {
		return resign_date;
	}


	public void setResign_date(Date resign_date) {
		this.resign_date = resign_date;
	}


	public Department getDept() {
		return dept;
	}


	public void setDept(Department dept) {
		this.dept = dept;
	}


	public Team getTeam() {
		return team;
	}


	public void setTeam(Team team) {
		this.team = team;
	}

	
	public String getMember_position() {
		return member_position;
	}

	
	public void setMember_position(String member_position) {
		this.member_position = member_position;
	}
}
