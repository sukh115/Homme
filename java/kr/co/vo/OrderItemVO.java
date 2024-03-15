package kr.co.vo;

import java.util.Date;

public class OrderItemVO {
	private String[] item_img;
	private String[] item_name;
	private String[] item_option;
	private String[] item_price;
	private int[] option_no;
	private int[] item_no;
	private int[] select_vol;

	
	private String order_item_img;
	private String order_item_name;
	private String order_item_option;
	private String order_item_price;
	private int order_option_no;
	private int order_item_no;
	private int order_select_vol;
	private Date order_item_date;
	private OrderedVO orderedVO;
	
	

	
	public Date getOrder_item_date() {
		return order_item_date;
	}
	public void setOrder_item_date(Date order_item_date) {
		this.order_item_date = order_item_date;
	}
	public OrderedVO getOrderedVO() {
		return orderedVO;
	}
	public void setOrderedVO(OrderedVO orderedVO) {
		this.orderedVO = orderedVO;
	}
	public String getOrder_item_img() {
		return order_item_img;
	}
	public void setOrder_item_img(String order_item_img) {
		this.order_item_img = order_item_img;
	}
	public String getOrder_item_name() {
		return order_item_name;
	}
	public void setOrder_item_name(String order_item_name) {
		this.order_item_name = order_item_name;
	}
	public String getOrder_item_option() {
		return order_item_option;
	}
	public void setOrder_item_option(String order_item_option) {
		this.order_item_option = order_item_option;
	}
	public String getOrder_item_price() {
		return order_item_price;
	}
	public void setOrder_item_price(String order_item_price) {
		this.order_item_price = order_item_price;
	}
	public int getOrder_option_no() {
		return order_option_no;
	}
	public void setOrder_option_no(int order_option_no) {
		this.order_option_no = order_option_no;
	}
	public int getOrder_item_no() {
		return order_item_no;
	}
	public void setOrder_item_no(int order_item_no) {
		this.order_item_no = order_item_no;
	}
	public int getOrder_select_vol() {
		return order_select_vol;
	}
	public void setOrder_select_vol(int order_select_vol) {
		this.order_select_vol = order_select_vol;
	}
	public String[] getItem_img() {
		return item_img;
	}
	public void setItem_img(String[] item_img) {
		this.item_img = item_img;
	}
	public String[] getItem_name() {
		return item_name;
	}
	public void setItem_name(String[] item_name) {
		this.item_name = item_name;
	}
	public String[] getItem_option() {
		return item_option;
	}
	public void setItem_option(String[] item_option) {
		this.item_option = item_option;
	}
	public String[] getItem_price() {
		return item_price;
	}
	public void setItem_price(String[] item_price) {
		this.item_price = item_price;
	}
	public int[] getOption_no() {
		return option_no;
	}
	public void setOption_no(int[] option_no) {
		this.option_no = option_no;
	}
	public int[] getItem_no() {
		return item_no;
	}
	public void setItem_no(int[] item_no) {
		this.item_no = item_no;
	}
	public int[] getSelect_vol() {
		return select_vol;
	}
	public void setSelect_vol(int[] select_vol) {
		this.select_vol = select_vol;
	}


	
	
	
	
}
