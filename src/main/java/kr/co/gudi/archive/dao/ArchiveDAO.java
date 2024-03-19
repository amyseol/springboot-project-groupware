package kr.co.gudi.archive.dao;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import kr.co.gudi.archive.dto.ArchiveDTO;

@Mapper
public interface ArchiveDAO {

	ArrayList<ArchiveDTO> companyArchiveList(int offset, String searchKeyword);

	ArrayList<ArchiveDTO> departmentArchiveList(int offset, String departmentName, String searchKeyword);

	int totalCompanyPage();

	int totalDepartmentPage(String departmentName);

	void archiveFileUpload(String oriFileName, String newFileName, int archiveIndex, String fileSize);

	void saveDepartArchive(ArchiveDTO dto);

	String getDepartmentName(String member_no);

	int archiveDelete(String archiveIndex);
}