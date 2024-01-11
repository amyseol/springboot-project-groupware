package kr.co.gudi.archive.dao;

<<<<<<< HEAD

=======
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.archive.dto.ArchiveDTO;
import kr.co.gudi.resource.dto.AlbumDTO;

@Mapper
>>>>>>> origin/master
public interface ArchiveDAO {

	int totalPage();

	ArrayList<ArchiveDTO> archAllList(int offset);

	void departFileUpload(String oriFileName, String newFileName, int arch_no, String size);

	void saveDepartArchive(ArchiveDTO dto);

	String getDepartName(String member_no);

	int archiveDel(String arch_no);

	
}
