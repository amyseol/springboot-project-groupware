package kr.co.gudi.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("boardP")
public class BoardPhotoDTO {
	private int file_no;
    private String file_location;
    private int file_unique_no;
    private String file_oriname;
    private String file_newname;
    private String file_size;
    private String file_state;
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getFile_location() {
		return file_location;
	}
	public void setFile_location(String file_location) {
		this.file_location = file_location;
	}
	public int getFile_unique_no() {
		return file_unique_no;
	}
	public void setFile_unique_no(int file_unique_no) {
		this.file_unique_no = file_unique_no;
	}
	public String getFile_oriname() {
		return file_oriname;
	}
	public void setFile_oriname(String file_oriname) {
		this.file_oriname = file_oriname;
	}
	public String getFile_newname() {
		return file_newname;
	}
	public void setFile_newname(String file_newname) {
		this.file_newname = file_newname;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public String getFile_state() {
		return file_state;
	}
	public void setFile_state(String file_state) {
		this.file_state = file_state;
	}
    
    
}
