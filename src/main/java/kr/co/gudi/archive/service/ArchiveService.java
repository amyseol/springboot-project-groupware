package kr.co.gudi.archive.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import kr.co.gudi.archive.dao.ArchiveDAO;
import kr.co.gudi.archive.dto.ArchiveDTO;

@Service
public class ArchiveService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ArchiveDAO dao;
	Map<String, Object> map = new HashMap<String, Object>();
	@Value("${spring.servlet.multipart.location}") private String root;

	public Map<String, Object> archiveList(String page, String member_no, 
			String state, String searchKeyword) {
		int currentPageNumber = Integer.parseInt(page);
		int offset = (currentPageNumber - 1) * 20;
		String departmentName = dao.getDepartmentName(member_no);
		int totalPages = dao.totalCompanyPage();
		
		ArrayList<ArchiveDTO> archiveList = new ArrayList<ArchiveDTO>();
		archiveList = dao.companyArchiveList(offset,searchKeyword);
		if(state.equals("부서")) {
			archiveList = dao.departmentArchiveList(offset, departmentName, searchKeyword);
			totalPages = dao.totalDepartmentPage(departmentName);
		}
		if (currentPageNumber > totalPages) {
			currentPageNumber = totalPages;
		}
		map.put("list", archiveList);
		map.put("pages", totalPages);
		map.put("currPage", currentPageNumber);
		return map;
	}

	public void departmentFileUpload(MultipartFile[] uploadFileList, String memberNumber) 
				throws Exception {
		ArchiveDTO dto = new ArchiveDTO();
		String departmentName = dao.getDepartmentName(memberNumber);
		int uploadMemberNumber = Integer.parseInt(memberNumber);
		dto.setMember_no(uploadMemberNumber);
		dto.setArch_depart(departmentName);
		dao.saveDepartArchive(dto);
		
		int archiveIndex = dto.getArch_no();
		if(archiveIndex > 0) {
			saveFile(uploadFileList, archiveIndex);
		}
	}
	
	public void companyFileUpload(MultipartFile[] uploadFileList, String memberNumber) 
			throws Exception {
		ArchiveDTO dto = new ArchiveDTO();
		int uploadMemberNumber = Integer.parseInt(memberNumber);
		dto.setMember_no(uploadMemberNumber);
		dto.setArch_depart("전사");
		dao.saveDepartArchive(dto);
		
		int archiveIndex = dto.getArch_no();
		if(archiveIndex > 0) {
			saveFile(uploadFileList, archiveIndex);
		}
	}	
	
	private void saveFile(MultipartFile[] uploadFileList, int archiveIndex) 
				throws Exception {
		for (MultipartFile file : uploadFileList) {
			String originalFileName = file.getOriginalFilename();
			
			if (!originalFileName.equals("")) {
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
				String newFileName = System.currentTimeMillis() + extension;
				
				byte[] arr = file.getBytes();
				Path path = Paths.get(root+newFileName);
				Files.write(path, arr);
				
				long sizeInKB = Math.round(file.getSize()/1024.0);
				String fileSize = Long.toString(sizeInKB);
				dao.archiveFileUpload(originalFileName, newFileName, archiveIndex, fileSize);
			}
		}	
	}

	public Map<String, Object> archiveDelete(ArrayList<String> deleteFileList, 
			ArrayList<String> checkFileMemberNames, String memberName, Model model) {
		int count = 0;
		for(String name : checkFileMemberNames) {
			if(!name.equals(memberName)) {
				count++;
				break;
			}
		}
		map.put("msg", "작성자만 삭제 가능합니다.");
		int deleteFileCount = 0;
		if(count == 0) {
			for(String archiveIndex : deleteFileList) {
				deleteFileCount += dao.archiveDelete(archiveIndex);
			}
		}
		map.put("del_cnt", deleteFileCount);
		return map;
	}
}