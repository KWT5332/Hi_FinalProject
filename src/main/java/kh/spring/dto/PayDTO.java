package kh.spring.dto;

import java.sql.Date;

public class PayDTO {

	private int seq;  // 결제 시퀀스
	private String st_name;  // 학생 이름
	private String st_email;  // 학생 이메일
	private String st_school;  // 소속 학교
	private String payment;  // 결제 금액
	private String apply_num;  // 승인번호
	private Date pay_date;  // 결제 일자
	private String month;   // 결제한 달
	
	public PayDTO() {
		super();
	}

	public PayDTO(int seq, String st_name, String st_email, String st_school, String payment, String apply_num,
			Date pay_date, String month) {
		super();
		this.seq = seq;
		this.st_name = st_name;
		this.st_email = st_email;
		this.st_school = st_school;
		this.payment = payment;
		this.apply_num = apply_num;
		this.pay_date = pay_date;
		this.month = month;
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

	public String getSt_email() {
		return st_email;
	}

	public void setSt_email(String st_email) {
		this.st_email = st_email;
	}

	public String getSt_school() {
		return st_school;
	}

	public void setSt_school(String st_school) {
		this.st_school = st_school;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getApply_num() {
		return apply_num;
	}

	public void setApply_num(String apply_num) {
		this.apply_num = apply_num;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
		
}

