package kh.spring.dto;

public class ChartDTO {

	private int seq;  // 설문 시퀀스
	private String feedback;  // 만족도
	private String bestmenu;  // 베스트 메뉴
	private String worstmenu;  // 워스트 메뉴
	private String parent_email;  // 담당 영양사
	private String school;  // 해당 학교
	
	public ChartDTO() {
		super();
	}
	
	public ChartDTO(int seq, String feedback, String bestmenu, String worstmenu, String parent_email, String school) {
		super();
		this.seq = seq;
		this.feedback = feedback;
		this.bestmenu = bestmenu;
		this.worstmenu = worstmenu;
		this.parent_email = parent_email;
		this.school = school;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public String getBestmenu() {
		return bestmenu;
	}
	public void setBestmenu(String bestmenu) {
		this.bestmenu = bestmenu;
	}
	public String getWorstmenu() {
		return worstmenu;
	}
	public void setWorstmenu(String worstmenu) {
		this.worstmenu = worstmenu;
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
	
}
