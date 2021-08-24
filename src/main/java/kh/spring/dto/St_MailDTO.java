package kh.spring.dto;

public class St_MailDTO {
	private int seq;
	private String school;
	private String stu_name;
	private String stu_email;
	private String nu_email; // 영양사 이메일
	
	public St_MailDTO() {}
	
	public St_MailDTO(int seq, String school, String stu_name, String stu_email, String nu_email) {
		super();
		this.seq = seq;
		this.school = school;
		this.stu_name = stu_name;
		this.stu_email = stu_email;
		this.nu_email = nu_email;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public String getNu_email() {
		return nu_email;
	}

	public void setNu_email(String nu_email) {
		this.nu_email = nu_email;
	}
}
