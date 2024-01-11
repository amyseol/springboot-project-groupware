package kr.co.gudi.schedule.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ScheduleDAO {

	void write(HashMap<String, Object> param);

	List<ScheduleDTO> list(int member_no);

	String addForm(HashMap<String, Object> params);

	ScheduleDTO detail(String sch_no);

	ArrayList<ScheduleDTO> schDetail(String sch_no);

	void delSch(String sch_no);

	void nWrite(HashMap<String, Object> param);

	List<ScheduleDTO> list(int member_no, String sch_state, int sch_depart);

	List<ScheduleDTO> allList(String sch_state);

	List<ScheduleDTO> dptList(String sch_state, int sch_depart);

}
