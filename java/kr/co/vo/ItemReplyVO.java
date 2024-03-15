package kr.co.vo;

import java.util.Date;

public class ItemReplyVO {
	private int rpl_no;
	private int rpl_item_no;
	private String rpl_mem_id;
	private String rpl_content;
	private Date rpl_date;
	private int rpl_star;
	private String rpl_img;
	
	
	
	public String getRpl_mem_id() {
		return rpl_mem_id;
	}
	public void setRpl_mem_id(String rpl_mem_id) {
		this.rpl_mem_id = rpl_mem_id;
	}
	public String getRpl_img() {
		return rpl_img;
	}
	public void setRpl_img(String rpl_img) {
		this.rpl_img = rpl_img;
	}
	public int getRpl_no() {
		return rpl_no;
	}
	public void setRpl_no(int rpl_no) {
		this.rpl_no = rpl_no;
	}
	public int getRpl_item_no() {
		return rpl_item_no;
	}
	public void setRpl_item_no(int rpl_item_no) {
		this.rpl_item_no = rpl_item_no;
	}

	public String getRpl_content() {
		return rpl_content;
	}
	public void setRpl_content(String rpl_content) {
		this.rpl_content = rpl_content;
	}
	public Date getRpl_date() {
		return rpl_date;
	}
	public void setRpl_date(Date rpl_date) {
		this.rpl_date = rpl_date;
	}
	public int getRpl_star() {
		return rpl_star;
	}
	public void setRpl_star(int rpl_star) {
		this.rpl_star = rpl_star;
	}
	

	

}
