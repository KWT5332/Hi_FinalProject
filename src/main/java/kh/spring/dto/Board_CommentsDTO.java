package kh.spring.dto;

import java.sql.Date;

public class Board_CommentsDTO {
	
	private int seq;
	private String writer;
	private String contents;
	private Date write_date;
	private int board_seq;
	
	public Board_CommentsDTO() {}

	public Board_CommentsDTO(int seq, String writer, String contents, Date write_date, int board_seq) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
		this.board_seq = board_seq;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

}
