package kh.spring.dto;

public class FileDTO {

	private int file_seq;
	private String oriName;
	private String sysName;
	private int board_seq;
	

	public FileDTO() {
		super();
	}

	public FileDTO(int file_seq, String oriName, String sysName, int board_seq) {
		super();
		this.file_seq = file_seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.board_seq = board_seq;
	}
	
	public int getFile_seq() {
		return file_seq;
	}
	public void setFile_seq(int file_seq) {
		this.file_seq = file_seq;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	
	
	
	
	
	
	
}
