package kh.spring.dto;

public class newChartDTO {

	private int rnum;
	private int count;
	private String bestmenu;
	
	public newChartDTO() {
		super();
	}
	
	public newChartDTO(int rnum, int count, String bestmenu) {
		super();
		this.rnum = rnum;
		this.count = count;
		this.bestmenu = bestmenu;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getBestmenu() {
		return bestmenu;
	}

	public void setBestmenu(String bestmenu) {
		this.bestmenu = bestmenu;
	}

}
