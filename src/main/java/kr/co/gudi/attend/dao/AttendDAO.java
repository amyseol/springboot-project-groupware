package kr.co.gudi.attend.dao;

import java.sql.Time;
import java.time.LocalDate;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.attend.dto.AttendDTO;

@Mapper
public interface AttendDAO {

	int inTime(HashMap<String, Object> param);

	int outTime(HashMap<String, Object> param);

	AttendDTO notiTime(int member_no, LocalDate today);

	String getHours(HashMap<String, Object> param);

	void workHours(HashMap<String, Object> param);

	String timeTable(HashMap<String, Object> map);

	String totalM(LocalDate firstDayOfMonth, LocalDate lastDayOfMonth, int member_no);

	String overTime(LocalDate firstDayOfMonth, LocalDate lastDayOfMonth, int member_no);

}
