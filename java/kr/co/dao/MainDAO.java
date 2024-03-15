package kr.co.dao;

import java.util.List;

import kr.co.vo.BoardVO;
import kr.co.vo.CartVO;
import kr.co.vo.CouponVO;
import kr.co.vo.ItemCriteria;
import kr.co.vo.ItemVO;
import kr.co.vo.OrderItemInsertVO;
import kr.co.vo.OrderedVO;

public interface MainDAO {
  List<ItemVO> itemList(ItemCriteria paramItemCriteria) throws Exception;
  
  int itemCount(ItemCriteria cri) throws Exception;
  
  ItemVO itemContent(ItemVO paramItemVO) throws Exception;
  
  List<ItemVO> itemOption(ItemVO paramItemVO) throws Exception;
  
  void cartInsert(CartVO paramCartVO) throws Exception;
  
  void cartDelete(CartVO paramCartVO) throws Exception;
  
  void cartDeleteCk(CartVO paramCartVO) throws Exception;
  
  void cartDeleteMem(CartVO paramCartVO) throws Exception;
  
  List<ItemVO> cartList(CartVO paramCartVO) throws Exception;
  
  public void cartUpdate(int mem_no , String cart_ckid) throws Exception;
  
  public int cartMemCount(CartVO cartVO) throws Exception;
  
  public int cartMemCheck(CartVO cartVO)throws Exception;
 
  public int cartCheck(CartVO cartVO)throws Exception;
  
  public List<CouponVO> orderCoupon(int mem_no)throws Exception;
  
  public void orderInsert(OrderedVO orderedVO)throws Exception;
  
  public void orderItemInsert(OrderItemInsertVO itemInsertVO) throws Exception;
  
  public void historyInsert(String history_content,int history_mem_no) throws Exception;
  
  public void couponDelete(String cpn_name , int cpn_mem_no)throws Exception;
  
  public void pointDelete(int ordered_usepoint , int ordered_mem_no)throws Exception;

  public void itemVolDelete(int orderitem_select_vol , int orderitem_no)throws Exception;

  public void cartReset(int ordered_mem_no)throws Exception;
  
  public List<ItemVO> selectList(String keyword)throws Exception;
  
  //메인페이지
  public ItemVO indexMainOuter()throws Exception;
  public ItemVO indexMainTop()throws Exception;
  public ItemVO indexMainBotton()throws Exception;
  public ItemVO indexMainShoes()throws Exception;
  
  public List<ItemVO> indexLatest() throws Exception;
  
  public List<ItemVO> indexRandom() throws Exception;
  
  public List<BoardVO> indexNews() throws Exception;
}


