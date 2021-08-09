package kh.spring.dto;

import java.sql.Date;

public class Chat_RoomDTO {

	private int room_number;
	private String user1;
	private String user2;
	private String urser1_photo;
	private String urser2_photo;
	private String user1_state;
	private String user2_state;
	private Date room_date;
	
	public Chat_RoomDTO() {}

	public Chat_RoomDTO(int room_number, String user1, String user2, String urser1_photo, String urser2_photo,
			String user1_state, String user2_state, Date room_date) {
		super();
		this.room_number = room_number;
		this.user1 = user1;
		this.user2 = user2;
		this.urser1_photo = urser1_photo;
		this.urser2_photo = urser2_photo;
		this.user1_state = user1_state;
		this.user2_state = user2_state;
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

	public String getUrser1_photo() {
		return urser1_photo;
	}

	public void setUrser1_photo(String urser1_photo) {
		this.urser1_photo = urser1_photo;
	}

	public String getUrser2_photo() {
		return urser2_photo;
	}

	public void setUrser2_photo(String urser2_photo) {
		this.urser2_photo = urser2_photo;
	}

	public String getUser1_state() {
		return user1_state;
	}

	public void setUser1_state(String user1_state) {
		this.user1_state = user1_state;
	}

	public String getUser2_state() {
		return user2_state;
	}

	public void setUser2_state(String user2_state) {
		this.user2_state = user2_state;
	}

	public Date getRoom_date() {
		return room_date;
	}

	public void setRoom_date(Date room_date) {
		this.room_date = room_date;
	}
}
