package kr.co.gudi.attend.service;

import java.sql.Time;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.attend.dao.AttendDAO;
import kr.co.gudi.attend.dto.AttendDTO;

@Service
public class AttendService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AttendDAO dao;
	
	public int attTime(HashMap<String, Object> param) {
		int success=0;
		
		if(param.get("type").equals("in")) {
			//String attTimeString = (String) param.get("attTime");
			//Time attTimeValue = Time.valueOf(attTimeString);		
			success=dao.inTime(param);
		}else {
			success=dao.outTime(param);
			AttendDTO dto = new AttendDTO();
			String work=dao.getHours(param);
			logger.info("오늘 노동시간 : "+work);
			param.put("work_hours", work);
			dao.workHours(param);
		}
		return success;
	}

	public AttendDTO notiTime(int member_no, LocalDate today) {
		AttendDTO dto = new AttendDTO();
		dto = dao.notiTime(member_no,today);
		return dto;
	}

	public HashMap<String, Object> timeTable(HashMap<String, Object> map) {
		HashMap<String, Object> time = new HashMap<String, Object>();
		String work=dao.timeTable(map);
		if(work!=null) {
		work = work.startsWith("-") ? work.substring(1) : work;
		logger.info("몇시간 일했나? : "+work);
		}else {
			work="00:00:00";
		}
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		LocalTime localTime =LocalTime.parse(work, formatter);
		int work_seconds = localTime.toSecondOfDay();
		logger.info("초 변환 : "+work_seconds);
        // 시간, 분, 초 추출
        int work_hour = localTime.getHour();
        int work_minute = localTime.getMinute();
        int work_second = localTime.getSecond();
		time.put("total_week_hour", work_hour);
		time.put("total_week_minute", work_minute);
		time.put("total_week_second", work_second);
		if(work_hour>=40) {
			int over_hour =work_hour-40;
			time.put("week_over_hour", over_hour);
			time.put("week_over_minute", work_minute);
			time.put("week_over_second", work_second);
		}else {
			time.put("week_over_hour", 0);
			time.put("week_over_minute", 0);
			time.put("week_over_second", 0);
		}
		int week_left = 144000;
		int week_left_hour =0-work_hour;
		int week_left_minute=0-work_minute;
		int week_left_second=0-work_second;
		int mCnt=0;
		int hCnt=0;
		if(work_seconds<week_left) {
			if(week_left_second<0) {
				week_left_second=60-work_second;
				mCnt++;
				time.put("week_left_second",week_left_second);
			}else {
				time.put("week_left_second",week_left_second);
			}
			if(week_left_minute<0) {
				week_left_minute=60-work_minute-mCnt;
				hCnt++;
				time.put("week_left_minute",week_left_minute);
			}else {
				time.put("week_left_minute",week_left_minute);
			}
			if(week_left_hour<0) {
				week_left_hour=40-work_hour-hCnt;
				time.put("week_left_hour",week_left_hour);
			}else {
				week_left_hour=40-work_hour-hCnt;
				time.put("week_left_hour",week_left_hour);
			}
				
			
		}else {
			time.put("week_left_hour", 0);
			time.put("week_left_minute", 0);
			time.put("week_left_second", 0);
		}
		
		 // 이번달
		// 1. 현재 날짜 구하기
        LocalDate currentDate = LocalDate.now();
        // 이번 달의 연도와 월 정보 가져오기
        int year = currentDate.getYear();
        int month = currentDate.getMonthValue();
        // 이번 달의 첫째 날 구하기
        LocalDate firstDayOfMonth = LocalDate.of(year, month, 1);
        // 이번 달의 마지막 날 구하기
        YearMonth yearMonth = YearMonth.of(year, month);
        LocalDate lastDayOfMonth = yearMonth.atEndOfMonth();
        int member_no=(int) map.get("member_no");
        String totalM=dao.totalM(firstDayOfMonth,lastDayOfMonth,member_no);
        totalM = totalM.startsWith("-") ? totalM.substring(1) : totalM;
        logger.info("이번달 근무시간 : "+totalM);
        LocalTime localTotalM =LocalTime.parse(totalM, formatter);
        int totalM_hour = localTotalM.getHour();
        int totalM_minute = localTotalM.getMinute();
        int totalM_second = localTotalM.getSecond();
        time.put("total_month_hour", totalM_hour);
        time.put("total_month_minute", totalM_minute);
        time.put("total_month_second", totalM_second);
        
        String overTime = dao.overTime(firstDayOfMonth,lastDayOfMonth,member_no);
        logger.info("OT 야간근무 : "+overTime);
        LocalTime localOt =LocalTime.parse(overTime, formatter);
        if(overTime!=null) {
        	time.put("overTime_hour", localOt.getHour());
        	time.put("overTime_minute",localOt.getMinute());
        	time.put("overTime_second",localOt.getSecond());
        }else {
        	time.put("overTime_hour", 0);
        	time.put("overTime_minute", 0);
        	time.put("overTime_second", 0);
        }
        
		return time;
	}
	

}
