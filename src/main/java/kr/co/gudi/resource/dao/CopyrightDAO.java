package kr.co.gudi.resource.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.resource.dto.CopyrightDTO;

@Mapper 
public interface CopyrightDAO {

	ArrayList<CopyrightDTO> copyrightnolist();

	ArrayList<CopyrightDTO> copyrightlist(String search,String searchtag, int offset);

	int maxpage(int pagePerNum, String search, String searchtag);

	ArrayList<CopyrightDTO> copyrightnolist(String search, String searchtag, int offset);
	
	int nomaxpage(int pagePerNum, String search, String searchtag);
	
	Map<String, Object> detaildata(String num);

	void resourceCopyrightregister(String no, String date, int price);



}
