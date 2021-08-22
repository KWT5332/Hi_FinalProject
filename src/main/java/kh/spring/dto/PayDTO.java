package kh.spring.dto;

import java.sql.Date;

public class PayDTO {

	private int seq;  // 결제 시퀀스
	private String st_name;  // 학생 이름
	private String school;  // 소속 학교
	private String pay;  // 결제 금액
	private String st_email;  // 학생 이메일
	private String pay_num;  // 승인번호
	private Date pay_date;  // 결제 일자
	
	public PayDTO() {
		super();
	}
	
	public PayDTO(int seq, String st_name, String school, String pay, String st_email, String pay_num, Date pay_date) {
		super();
		this.seq = seq;
		this.st_name = st_name;
		this.school = school;
		this.pay = pay;
		this.st_email = st_email;
		this.pay_num = pay_num;
		this.pay_date = pay_date;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getSt_email() {
		return st_email;
	}
	public void setSt_email(String st_email) {
		this.st_email = st_email;
	}
	public String getPay_num() {
		return pay_num;
	}
	public void setPay_num(String pay_num) {
		this.pay_num = pay_num;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
		
}

