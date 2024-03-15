package kr.co.dao;

import java.util.List;

import kr.co.vo.CouponVO;
import kr.co.vo.ItemCriteria;
import kr.co.vo.ItemSearchCriteria;
import kr.co.vo.ItemVO;
import kr.co.vo.MemberVO;
import kr.co.vo.OrderItemInsertVO;
import kr.co.vo.OrderedVO;
import kr.co.vo.SearchCriteria;

public interface ClientDAO {
	//(관리자)회원삭제
	public void deleteClient(String memberId) throws Exception;
	//(관리자)회원정지
	public void disableMember(String memberId,int sectiontime) throws Exception;
	
	//정지해제
	public void disableCancel(String memberId) throws Exception;
	
	//(관리자)회원조회
	public int count(String memberId) throws Exception;
	//(관리자)회원목록
	public List<MemberVO> list(SearchCriteria scri) throws Exception;
	//(관리자)회원목록갯수
	public int listCount(SearchCriteria scri) throws Exception;
	//상품삭제
	public void deleteItem(int item_no) throws Exception;
	//상품조회
	public int icount(int item_no)throws Exception;
	//상품목록
	public List<ItemVO> ilist(ItemSearchCriteria scri) throws Exception;
	//상품목록 갯수
	public int ilistCount(ItemSearchCriteria scri) throws Exception;
	//쿠폰리스트
	public List<CouponVO> coulist(SearchCriteria scri) throws Exception;
	//쿠폰 갯수
	public int coulistCount(SearchCriteria scri) throws Exception;
	//쿠폰 정렬
	public int coucount(int cpn_no)throws Exception;
	//쿠폰 삭제
	public void deletecoupon(int cpn_no)throws Exception;
	//쿠폰생성
	public void newcoupon(CouponVO vo,int edate) throws Exception;
	
	public void pointInsert(String mem_id, int mem_point)throws Exception;

	public void itemCateChange(String item_catesub, int item_no)throws Exception;
	
	//주문관리목록
	public List<OrderedVO> orderList(ItemCriteria cri) throws Exception;
	
	//목록count
	public int orderCount(ItemCriteria cri)throws Exception;
	
	public int orderState1()throws Exception; 
	public int orderState2()throws Exception; 
	public int orderState3()throws Exception; 
	
	//배송중으로 바꾸기
	public void delivNumberInsert(OrderedVO orderedVO)throws Exception;

	public void delivNumberUpdate(OrderedVO orderedVO)throws Exception;
	
	public void orderExchange(int ordered_no)throws Exception;
	
	public void orderCancel(int ordered_no)throws Exception;

	public List<OrderItemInsertVO> orderItemView(int ordered_no)throws Exception;

	public OrderedVO orderItemInfo(int ordered_no)throws Exception;
	}
