package kr.co.gudi.notification.dao;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import kr.co.gudi.notification.dto.NotiDTO;

@Mapper
public interface NotiDAO {
	ArrayList<NotiDTO> notiList(String member_no, String num);
	void notiStateUpdate(String noti_no, String locate);
	int newNotiCount(String member_no, String num);
	int deleteSelectedNoti(String noti_no);
	void deleteOldNoti();
}