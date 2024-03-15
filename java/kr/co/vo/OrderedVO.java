package kr.co.vo;

import java.util.Date;

public class OrderedVO {

	private int ordered_no; //PR
	private int ordered_mem_no; // 주문회원PR
	private String ordered_to_name; //주문자
	private String ordered_to_tel;
	private String ordered_to_email;
	private String ordered_to_adr;
	private String ordered_to_post;
	private String ordered_from_name; //수취인
	private String ordered_from_tel;
	private String ordered_from_adr;
	private String ordered_from_post;
	private int ordered_cartprice; //총액
	private int ordered_orderprice; //결제금액
	private String ordered_cpn_name; //쿠폰명
	private int ordered_cpn_disc; //쿠폰할인액
	private int ordered_usepoint; // 적립금사용액
	private int ordered_payhow; //결제방식
	private int ordered_paystate; //결제상태 1.일반 2.취소 3. 4.교환
	private int ordered_delivstate; //배송상태 1.물품준비중 , 2.배송전, 3.배송완료
	private String ordered_delivnum; //송장번호
	private Date ordered_date;  //주문일
	private Date ordered_cdate; //주문취소일
	
	
	
	
	public int getOrdered_mem_no() {
		return ordered_mem_no;
	}
	public void setOrdered_mem_no(int ordered_mem_no) {
		this.ordered_mem_no = ordered_mem_no;
	}
	public int getOrdered_no() {
		return ordered_no;
	}
	public void setOrdered_no(int ordered_no) {
		this.ordered_no = ordered_no;
	}
	public String getOrdered_to_name() {
		return ordered_to_name;
	}
	public void setOrdered_to_name(String ordered_to_name) {
		this.ordered_to_name = ordered_to_name;
	}
	public String getOrdered_to_tel() {
		return ordered_to_tel;
	}
	public void setOrdered_to_tel(String ordered_to_tel) {
		this.ordered_to_tel = ordered_to_tel;
	}
	public String getOrdered_to_email() {
		return ordered_to_email;
	}
	public void setOrdered_to_email(String ordered_to_email) {
		this.ordered_to_email = ordered_to_email;
	}
	public String getOrdered_to_adr() {
		return ordered_to_adr;
	}
	public void setOrdered_to_adr(String ordered_to_adr) {
		this.ordered_to_adr = ordered_to_adr;
	}
	public String getOrdered_to_post() {
		return ordered_to_post;
	}
	public void setOrdered_to_post(String ordered_to_post) {
		this.ordered_to_post = ordered_to_post;
	}
	public String getOrdered_from_name() {
		return ordered_from_name;
	}
	public void setOrdered_from_name(String ordered_from_name) {
		this.ordered_from_name = ordered_from_name;
	}
	public String getOrdered_from_tel() {
		return ordered_from_tel;
	}
	public void setOrdered_from_tel(String ordered_from_tel) {
		this.ordered_from_tel = ordered_from_tel;
	}
	public String getOrdered_from_adr() {
		return ordered_from_adr;
	}
	public void setOrdered_from_adr(String ordered_from_adr) {
		this.ordered_from_adr = ordered_from_adr;
	}
	public String getOrdered_from_post() {
		return ordered_from_post;
	}
	public void setOrdered_from_post(String ordered_from_post) {
		this.ordered_from_post = ordered_from_post;
	}
	public int getOrdered_cartprice() {
		return ordered_cartprice;
	}
	public void setOrdered_cartprice(int ordered_cartprice) {
		this.ordered_cartprice = ordered_cartprice;
	}
	public int getOrdered_orderprice() {
		return ordered_orderprice;
	}
	public void setOrdered_orderprice(int ordered_orderprice) {
		this.ordered_orderprice = ordered_orderprice;
	}
	public String getOrdered_cpn_name() {
		return ordered_cpn_name;
	}
	public void setOrdered_cpn_name(String ordered_cpn_name) {
		this.ordered_cpn_name = ordered_cpn_name;
	}
	public int getOrdered_cpn_disc() {
		return ordered_cpn_disc;
	}
	public void setOrdered_cpn_disc(int ordered_cpn_disc) {
		this.ordered_cpn_disc = ordered_cpn_disc;
	}
	public int getOrdered_usepoint() {
		return ordered_usepoint;
	}
	public void setOrdered_usepoint(int ordered_usepoint) {
		this.ordered_usepoint = ordered_usepoint;
	}
	public int getOrdered_payhow() {
		return ordered_payhow;
	}
	public void setOrdered_payhow(int ordered_payhow) {
		this.ordered_payhow = ordered_payhow;
	}
	public int getOrdered_paystate() {
		return ordered_paystate;
	}
	public void setOrdered_paystate(int ordered_paystate) {
		this.ordered_paystate = ordered_paystate;
	}
	public int getOrdered_delivstate() {
		return ordered_delivstate;
	}
	public void setOrdered_delivstate(int ordered_delivstate) {
		this.ordered_delivstate = ordered_delivstate;
	}
	public String getOrdered_delivnum() {
		return ordered_delivnum;
	}
	public void setOrdered_delivnum(String ordered_delivnum) {
		this.ordered_delivnum = ordered_delivnum;
	}
	public Date getOrdered_date() {
		return ordered_date;
	}
	public void setOrdered_date(Date ordered_date) {
		this.ordered_date = ordered_date;
	}
	public Date getOrdered_cdate() {
		return ordered_cdate;
	}
	public void setOrdered_cdate(Date ordered_cdate) {
		this.ordered_cdate = ordered_cdate;
	}
	
	
	
}
