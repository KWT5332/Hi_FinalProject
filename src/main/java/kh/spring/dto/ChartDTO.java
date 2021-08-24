package kh.spring.dto;

public class ChartDTO {

	private int seq;  // 설문 시퀀스
	private String b_month;   // 결제한 달
	private String parent_email;  // 담당 영양사
	private String school;  // 해당 학교
	private String feedback;  // 만족도
	private String taste;   // 음식의 간
	private String amount;   // 음식의 양
	private String bestmenu;  // 베스트 메뉴
	private String etc;   // 기타 의견
	
	public ChartDTO() {
		super();
	}

	public ChartDTO(int seq, String b_month, String parent_email, String school, String feedback, String taste,
			String amount, String bestmenu, String etc) {
		super();
		this.seq = seq;
		this.b_month = b_month;
		this.parent_email = parent_email;
		this.school = school;
		this.feedback = feedback;
		this.taste = taste;
		this.amount = amount;
		this.bestmenu = bestmenu;
		this.etc = etc;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getB_month() {
		return b_month;
	}

	public void setB_month(String b_month) {
		this.b_month = b_month;
	}

	public String getParent_email() {
		return parent_email;
	}

	public void setParent_email(String parent_email) {
		this.parent_email = parent_email;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getBestmenu() {
		return bestmenu;
	}

	public void setBestmenu(String bestmenu) {
		this.bestmenu = bestmenu;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	
		
}
