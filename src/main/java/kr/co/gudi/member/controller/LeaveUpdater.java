package kr.co.gudi.member.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.gudi.member.service.MemberService;

@Component
public class LeaveUpdater {
	    private final MemberService service;
	    Logger logger = LoggerFactory.getLogger(getClass());
	    @Autowired
	    public LeaveUpdater(MemberService service) {
	        this.service = service;
	    }

	    @Scheduled(cron = "0 0 6 * * *") 
	    public void updateLeave() {
	    	LocalDate currentDate = LocalDate.now();
	    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd");
	    	String formattedDate = currentDate.format(formatter);
	    	try {
	    		service.updateLeave(formattedDate);
	    		logger.info("연차 업데이트 성공!");
			} catch (Exception e) {
				logger.info("연차 업데이트 에러 == ", e);
			}
	    }
	    
	   
	}

