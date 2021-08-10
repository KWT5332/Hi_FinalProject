package kh.spring.dto;

import java.sql.Date;

public class BoardDTO {

	private int seq;
	private String title;
	private String content;
	private String writer;
	private Date write_date;
	private int view_count;
	
	public BoardDTO() {
		super();
	}
	


	public BoardDTO(int seq, String title, String content, String writer, Date write_date, int view_count) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.write_date = write_date;
		this.view_count = view_count;
	}
	
	public BoardDTO(int seq, String title, String content, String writer) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.writer = writer;
	}
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	
}