/*    */ package kr.co.dao;
import java.util.HashMap;
/*    */ 
/*    */ import java.util.List;
import java.util.Map;

/*    */ import org.apache.ibatis.session.SqlSession;
/*    */ import org.springframework.beans.factory.annotation.Autowired;
/*    */ import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
/*    */ import kr.co.vo.CartVO;
import kr.co.vo.CouponVO;
/*    */ import kr.co.vo.ItemCriteria;
/*    */ import kr.co.vo.ItemVO;
import kr.co.vo.OrderItemInsertVO;
import kr.co.vo.OrderedVO;
/*    */ 
/*    */ 
/*    */ @Repository
/*    */ public class MainDAOImpl
/*    */   implements MainDAO
/*    */ {
/*    */   @Autowired
/*    */   private SqlSession sqlSession;
/*    */   
/*    */   public List<ItemVO> itemList(ItemCriteria cri) throws Exception {
/* 20 */     return this.sqlSession.selectList("MainMapper.itemList", cri);
/*    */   }
/*    */   
/*    */   public int itemCount(ItemCriteria cri) throws Exception {
/* 24 */     return sqlSession.selectOne("MainMapper.itemCount", cri);
/*    */   }
/*    */   
/*    */   public ItemVO itemContent(ItemVO itemVO) throws Exception {
/* 28 */     return (ItemVO)this.sqlSession.selectOne("MainMapper.itemContent", itemVO);
/*    */   }
/*    */   
/*    */   public List<ItemVO> itemOption(ItemVO itemVO) throws Exception {
/* 32 */     return this.sqlSession.selectList("MainMapper.itemOption", itemVO);
/*    */   }
/*    */   
/*    */   public void cartInsert(CartVO cartVO) throws Exception {
/* 36 */     this.sqlSession.insert("MainMapper.cartInsert", cartVO);
/*    */   }
/*    */   
/*    */   public void cartDelete(CartVO cartVO) throws Exception {
/* 40 */     this.sqlSession.delete("MainMapper.cartDelete", cartVO);
/*    */   }
/*    */   
/*    */   public void cartDeleteCk(CartVO cartVO) throws Exception {
/* 44 */     this.sqlSession.delete("MainMapper.cartDeleteCk", cartVO);
/*    */   }
/*    */   
/*    */   public void cartDeleteMem(CartVO cartVO) throws Exception {
/* 48 */     this.sqlSession.delete("MainMapper.cartDeleteMem", cartVO);
/*    */   }
/*    */   
/*    */   public List<ItemVO> cartList(CartVO cartVO) throws Exception {
/* 52 */     return this.sqlSession.selectList("MainMapper.cartList", cartVO);
/*    */   }

			public void cartUpdate(int mem_no , String cart_ckid) throws Exception {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("mem_no", mem_no);
				map.put("cart_ckid", cart_ckid);
				sqlSession.update("MainMapper.cartUpdate", map);
			}
			
			  public int cartMemCount(CartVO cartVO) throws Exception{
				  return sqlSession.selectOne("MainMapper.cartMemCount", cartVO);
			  }
			  
			  public int cartMemCheck(CartVO cartVO)throws Exception{
				  return sqlSession.selectOne("MainMapper.cartMemCheck", cartVO);
			  }
			  
			  public int cartCheck(CartVO cartVO)throws Exception{
				  return sqlSession.selectOne("MainMapper.cartCheck", cartVO);
			  }
			  
			  public List<CouponVO> orderCoupon(int mem_no)throws Exception{
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("mem_no", mem_no);
				  return sqlSession.selectList("MainMapper.orderCoupon", map);
			  }
			  
			  public void orderInsert(OrderedVO orderedVO)throws Exception{
				  sqlSession.insert("MainMapper.orderInsert", orderedVO);
			  }
			  
			  public void orderItemInsert(OrderItemInsertVO itemInsertVO) throws Exception{
				  sqlSession.insert("MainMapper.orderItemInsert", itemInsertVO);
			  }
			  
			  public void historyInsert(String history_content,int history_mem_no) throws Exception{
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("history_content", history_content);
					map.put("history_mem_no", history_mem_no);
				  sqlSession.insert("MainMapper.historyInsert", map);
			  }
			  
			  public void couponDelete(String cpn_name , int cpn_mem_no)throws Exception{
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("cpn_name", cpn_name);
					map.put("cpn_mem_no", cpn_mem_no);
					sqlSession.delete("MainMapper.couponDelete", map);
			  }
			  
			  public void pointDelete(int ordered_usepoint , int ordered_mem_no)throws Exception{
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("ordered_usepoint", ordered_usepoint);
					map.put("ordered_mem_no", ordered_mem_no);
					sqlSession.update("MainMapper.pointDelete", map);
			  }
			  
			  public void itemVolDelete(int orderitem_select_vol , int orderitem_no)throws Exception{
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("orderitem_select_vol", orderitem_select_vol);
					map.put("orderitem_no", orderitem_no);
					sqlSession.update("MainMapper.itemVolDelete", map);
			  }
			  
			  public void cartReset(int ordered_mem_no)throws Exception{
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("ordered_mem_no", ordered_mem_no);
				  sqlSession.delete("MainMapper.cartReset", map);
			  }
			  
			  public List<ItemVO> selectList(String keyword)throws Exception{
				  return sqlSession.selectList("MainMapper.selectList", keyword);
			  }
			  
			  //메인페이지
			  public ItemVO indexMainOuter()throws Exception{
				  return sqlSession.selectOne("MainMapper.indexMainOuter");
			  }
			  public ItemVO indexMainTop()throws Exception{
				  return sqlSession.selectOne("MainMapper.indexMainTop");
			  }
			  public ItemVO indexMainBotton()throws Exception{
				  return sqlSession.selectOne("MainMapper.indexMainBotton");
			  }
			  public ItemVO indexMainShoes()throws Exception{
				  return sqlSession.selectOne("MainMapper.indexMainShoes");
			  }
			  
			  public List<ItemVO> indexLatest() throws Exception{
				  return sqlSession.selectList("MainMapper.indexLatest");
			  }
			  
			  public List<ItemVO> indexRandom() throws Exception{
				  return sqlSession.selectList("MainMapper.indexRandom");
			  }

			  public List<BoardVO> indexNews() throws Exception{
				  return sqlSession.selectList("MainMapper.indexNews");
			  }
			
}



