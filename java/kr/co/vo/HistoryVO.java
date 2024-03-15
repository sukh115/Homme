package kr.co.vo;

import java.util.Date;

public class HistoryVO {

	private int history_no;
	private String history_content;
	private int history_mem_no;
	private Date history_date;
	public int getHistory_no() {
		return history_no;
	}
	public void setHistory_no(int history_no) {
		this.history_no = history_no;
	}
	public String getHistory_content() {
		return history_content;
	}
	public void setHistory_content(String history_content) {
		this.history_content = history_content;
	}
	public int getHistory_mem_no() {
		return history_mem_no;
	}
	public void setHistory_mem_no(int history_mem_no) {
		this.history_mem_no = history_mem_no;
	}
	public Date getHistory_date() {
		return history_date;
	}
	public void setHistory_date(Date history_date) {
		this.history_date = history_date;
	}
	
	

}
