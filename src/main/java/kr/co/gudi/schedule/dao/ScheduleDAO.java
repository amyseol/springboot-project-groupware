package kr.co.gudi.schedule.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.schedule.dto.ScheduleDTO;

@Mapper
public interface ScheduleDAO {

	void write(HashMap<String, Object> param);

	List<ScheduleDTO> list();

	String addForm(HashMap<String, Object> params);

}
