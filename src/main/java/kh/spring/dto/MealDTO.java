package kh.spring.dto;

import java.sql.Date;

public class MealDTO {
	private String month;
	private Date meal_date;
	private String school;
	private String writer; // 아마 이메일
	private String menu1;
	private String menu2;
	private String menu3;
	private String menu4;
	private String menu5;
	private String menu6;
	private String oriName;
	private String sysName;
	
	public MealDTO() {
		super();
	}

	public MealDTO(String month, Date meal_date, String school, String writer, String menu1, String menu2,
			String menu3, String menu4, String menu5, String menu6, String oriName, String sysName) {
		super();
		this.month = month;
		this.meal_date = meal_date;
		this.school = school;
		this.writer = writer;
		this.menu1 = menu1;
		this.menu2 = menu2;
		this.menu3 = menu3;
		this.menu4 = menu4;
		this.menu5 = menu5;
		this.menu6 = menu6;
		this.oriName = oriName;
		this.sysName = sysName;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public Date getMeal_date() {
		return meal_date;
	}

	public void setMeal_date(Date meal_date) {
		this.meal_date = meal_date;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getMenu1() {
		return menu1;
	}

	public void setMenu1(String menu1) {
		this.menu1 = menu1;
	}

	public String getMenu2() {
		return menu2;
	}

	public void setMenu2(String menu2) {
		this.menu2 = menu2;
	}

	public String getMenu3() {
		return menu3;
	}

	public void setMenu3(String menu3) {
		this.menu3 = menu3;
	}

	public String getMenu4() {
		return menu4;
	}

	public void setMenu4(String menu4) {
		this.menu4 = menu4;
	}

	public String getMenu5() {
		return menu5;
	}

	public void setMenu5(String menu5) {
		this.menu5 = menu5;
	}

	public String getMenu6() {
		return menu6;
	}

	public void setMenu6(String menu6) {
		this.menu6 = menu6;
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
}
