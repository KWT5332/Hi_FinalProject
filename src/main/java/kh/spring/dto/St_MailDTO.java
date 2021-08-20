package kh.spring.dto;

public class St_MailDTO {

	private String school;
	private String stu_name;
	private String stu_email;
	
	public St_MailDTO() {}

	public St_MailDTO(String school, String stu_name, String stu_email) {
		super();
		this.school = school;
		this.stu_name = stu_name;
		this.stu_email = stu_email;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getStu_email() {
		return stu_email;
	}

	public void setStu_email(String stu_email) {
		this.stu_email = stu_email;
	}
	
}
