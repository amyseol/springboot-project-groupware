package kr.co.gudi.resource.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.resource.dto.CopyrightDTO;

@Mapper
public interface CopyrightDAO {

	ArrayList<CopyrightDTO> copyrightlist();

	ArrayList<CopyrightDTO> copyrightnolist();

}
