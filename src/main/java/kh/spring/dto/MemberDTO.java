package kh.spring.dto;

import java.sql.Date;

public class MemberDTO {
	private String email;
	private String pw;
	private String name;
	private String school;
	private String gender;
	private String age;
	private String oriName;
	private String sysName;
	private String phone;
	private Date reg_date;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String email, String pw, String name, String school, String gender, String age, String oriName,
			String sysName, String phone, Date reg_date) {
		super();
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.school = school;
		this.gender = gender;
		this.age = age;
		this.oriName = oriName;
		this.sysName = sysName;
		this.phone = phone;
		this.reg_date = reg_date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
