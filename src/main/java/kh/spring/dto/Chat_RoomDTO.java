package kh.spring.dto;

import java.sql.Date;

public class Chat_RoomDTO {

	private int room_number;
	private String user1;
	private String user2;
	private Date room_date;
	
	public Chat_RoomDTO() {}
	
	public Chat_RoomDTO(int room_number, String user1, String user2, Date room_date) {
		super();
		this.room_number = room_number;
		this.user1 = user1;
		this.user2 = user2;
		this.room_date = room_date;
	}

	public int getRoom_number() {
		return room_number;
	}

	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}

	public String getUser1() {
		return user1;
	}

	public void setUser1(String user1) {
		this.user1 = user1;
	}

	public String getUser2() {
		return user2;
	}

	public void setUser2(String user2) {
		this.user2 = user2;
	}

	public Date getRoom_date() {
		return room_date;
	}

	public void setRoom_date(Date room_date) {
		this.room_date = room_date;
	}

	
}
