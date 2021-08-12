package kh.spring.dto;

import java.sql.Date;

public class Chat_MessageDTO {

	private int message_number;
	private String sender;
	private String receiver;
	private String contents;
	private Date time;
	private int room_number;
	
	public Chat_MessageDTO() {}

	public Chat_MessageDTO(int message_number, String sender, String receiver, String contents, Date time,
			int room_number) {
		super();
		this.message_number = message_number;
		this.sender = sender;
		this.receiver = receiver;
		this.contents = contents;
		this.time = time;
		this.room_number = room_number;
	}

	public int getMessage_number() {
		return message_number;
	}

	public void setMessage_number(int message_number) {
		this.message_number = message_number;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getRoom_number() {
		return room_number;
	}

	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}
	
	
	
}
