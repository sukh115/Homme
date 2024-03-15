/*    */ package kr.co.service;
/*    */ 
/*    */ import java.util.List;
/*    */ import kr.co.dao.MainDAO;
import kr.co.vo.BoardVO;
/*    */ import kr.co.vo.CartVO;
import kr.co.vo.CouponVO;
/*    */ import kr.co.vo.ItemCriteria;
/*    */ import kr.co.vo.ItemVO;
import kr.co.vo.OrderItemInsertVO;
import kr.co.vo.OrderedVO;

/*    */ import org.springframework.beans.factory.annotation.Autowired;
/*    */ import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/*    */ 
/*    */ 
/*    */ 
/*    */ @Service
/*    */ public class MainServiceImpl
/*    */   implements MainService
/*    */ {
/*    */   @Autowired
/*    */   private MainDAO mainDAO;
/*    */   
/*    */   public List<ItemVO> itemList(ItemCriteria cri) throws Exception {
/* 21 */     return this.mainDAO.itemList(cri);
/*    */   }
/*    */ 
/*    */   
/*    */   public int itemCount(ItemCriteria cri) throws Exception {
/* 26 */     return this.mainDAO.itemCount(cri);
/*    */   }
/*    */   
/*    */   public ItemVO itemContent(ItemVO itemVO) throws Exception {
/* 30 */     return this.mainDAO.itemContent(itemVO);
/*    */   }
/*    */   
/*    */   public List<ItemVO> itemOption(ItemVO itemVO) throws Exception {
/* 34 */     return this.mainDAO.itemOption(itemVO);
/*    */   }
/*    */   
			@Transactional
/*    */   public void cartInsert(CartVO cartVO) throws Exception {
/* 38 */     this.mainDAO.cartInsert(cartVO);
/*    */   }
/*    */   
/*    */   public void cartDelete(CartVO cartVO) throws Exception {
/* 42 */     this.mainDAO.cartDelete(cartVO);
/*    */   }
/*    */   
/*    */   public void cartDeleteCk(CartVO cartVO) throws Exception {
/* 46 */     this.mainDAO.cartDeleteCk(cartVO);
/*    */   }
/*    */   
/*    */   public void cartDeleteMem(CartVO cartVO) throws Exception {
/* 50 */     this.mainDAO.cartDeleteMem(cartVO);
/*    */   }
/*    */   
/*    */   public List<ItemVO> cartList(CartVO cartVO) throws Exception {
/* 54 */     return this.mainDAO.cartList(cartVO);
/*    */   }

		public void cartUpdate(int mem_no , String cart_ckid) throws Exception{
			mainDAO.cartUpdate(mem_no, cart_ckid);
		}
		
		  public int cartMemCount(CartVO cartVO) throws Exception{
			  return mainDAO.cartMemCount(cartVO);
		  }
		  
		  public int cartMemCheck(CartVO cartVO)throws Exception{
			  return mainDAO.cartMemCheck(cartVO);
		  }
		  
		  public int cartCheck(CartVO cartVO)throws Exception{
			  return mainDAO.cartCheck(cartVO);
		  }
		  
		  public List<CouponVO> orderCoupon(int mem_no)throws Exception{
			  return mainDAO.orderCoupon(mem_no);
		  }
		  
		  @Transactional
		  public void orderInsert(OrderedVO orderedVO, OrderItemInsertVO itemInsertVO)throws Exception{
			  mainDAO.orderInsert(orderedVO);
			  int orderNo = orderedVO.getOrdered_no();
			  
			  
			  itemInsertVO.setOrderitem_order_no(orderNo);
			  itemInsertVO.setOrderitem_mem_no(orderedVO.getOrdered_mem_no());
			  for(int i =0; i < (itemInsertVO.getInorderitem_name()).length; i++) {
				  itemInsertVO.setOrderitem_img(itemInsertVO.getInorderitem_img()[i]);
				  itemInsertVO.setOrderitem_name(itemInsertVO.getInorderitem_name()[i]);
				  itemInsertVO.setOrderitem_option(itemInsertVO.getInorderitem_option()[i]);
				  itemInsertVO.setOrderitem_price(itemInsertVO.getInorderitem_price()[i]);
				  itemInsertVO.setOrderitem_item_no(itemInsertVO.getInorderitem_item_no()[i]);
				  itemInsertVO.setOrderitem_select_vol(itemInsertVO.getInorderitem_select_vol()[i]);
				mainDAO.orderItemInsert(itemInsertVO);
				//상품 옵션 개수 감소
				mainDAO.itemVolDelete(itemInsertVO.getOrderitem_select_vol(), itemInsertVO.getOrderitem_item_no());
			  }
			  
			  
			  //쿠폰 사용시 사용내역 , 쿠폰삭제
			  if(orderedVO.getOrdered_cpn_disc() != 0) {
				  
			  String history_content = "쿠폰 :[ "+orderedVO.getOrdered_cpn_name() + "]을 사용하셨습니다";
			  int history_mem_no = orderedVO.getOrdered_mem_no();
			  mainDAO.historyInsert(history_content, history_mem_no);
			  mainDAO.couponDelete(orderedVO.getOrdered_cpn_name(), orderedVO.getOrdered_mem_no());
			  }
			  
			  //적립금 사용시 사용내역, 적립금 감소
			  if(orderedVO.getOrdered_usepoint() != 0) {
				  String history_content = "적립금  : ["+orderedVO.getOrdered_usepoint() + "원]을 사용하셨습니다";
				  int history_mem_no = orderedVO.getOrdered_mem_no();
				  mainDAO.historyInsert(history_content, history_mem_no);
				  mainDAO.pointDelete(orderedVO.getOrdered_usepoint(), orderedVO.getOrdered_mem_no());
			  }
			  
			  //장바구니 초기화
			  mainDAO.cartReset(orderedVO.getOrdered_mem_no());
			  
	
		  }
		  
		  public List<ItemVO> selectList(String keyword)throws Exception{
			  return mainDAO.selectList(keyword);
		  }
		  
		  //메인페이지
		  public ItemVO indexMainOuter()throws Exception{
			  return mainDAO.indexMainOuter();
		  }
		  public ItemVO indexMainTop()throws Exception{
			  return mainDAO.indexMainTop();
		  }
		  public ItemVO indexMainBotton()throws Exception{
			  return mainDAO.indexMainBotton();
		  }
		  public ItemVO indexMainShoes()throws Exception{
			  return mainDAO.indexMainShoes();
		  }
		  
		  public List<ItemVO> indexLatest() throws Exception{
			  return mainDAO.indexLatest();
		  }

		  public List<ItemVO> indexRandom() throws Exception{
			  return mainDAO.indexRandom();
				
		  }
		 
		  public List<BoardVO> indexNews() throws Exception{
			  return mainDAO.indexNews();
		  }


}


