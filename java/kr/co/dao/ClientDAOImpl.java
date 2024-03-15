
 package kr.co.dao;
  
  import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import
  org.springframework.beans.factory.annotation.Autowired;
import
  org.springframework.stereotype.Repository;

import kr.co.vo.CouponVO;
import kr.co.vo.ItemCriteria;
import kr.co.vo.ItemSearchCriteria;
import kr.co.vo.ItemVO;
import kr.co.vo.MemberVO;
import kr.co.vo.OrderItemInsertVO;
import kr.co.vo.OrderedVO;
import kr.co.vo.SearchCriteria;
  
  @Repository public class ClientDAOImpl implements ClientDAO{
  
  @Autowired private SqlSession sqlSession;
  //회원 삭제
  public void deleteClient(String memberId) throws Exception{
  sqlSession.delete("ClientMapper.deleteClient", memberId); 
  }
  //회원 정지
  public void disableMember(String memberId,int sectiontime) throws Exception {
	  Map<String, Object> map = new HashMap<String, Object>();
	  map.put("memberId", memberId);
	  map.put("sectiontime", sectiontime);
  sqlSession.update("ClientMapper.disableMember",map);
  
  }
  
	//정지해제
	public void disableCancel(String memberId) throws Exception{
		sqlSession.update("ClientMapper.disableCancel", memberId);
	}
  
  //회원 조회
  public int count(String memberId) throws Exception{
	return  sqlSession.selectOne("ClientMapper.count",memberId);
  }
  //회원 리스트
  @Override
  public List<MemberVO> list(SearchCriteria scri) throws Exception{
	  return sqlSession.selectList("ClientMapper.listPage",scri);
  }
  //회원 목록 갯수
  public int listCount(SearchCriteria scri) throws Exception{
	  return sqlSession.selectOne("ClientMapper.listCount", scri);
  }

  //상품삭제
  public void deleteItem(int item_no) throws Exception{
	  Map<String, Object> map = new HashMap<>();
	  map.put("item_no", item_no);
	  sqlSession.delete("ClientMapper.deleteItem", map); 
	  }
  //상품조회
  public int icount(int item_no) throws Exception{
		return  sqlSession.selectOne("ClientMapper.icount",item_no);
	  }
  //상품 리스트
  @Override
  public List<ItemVO> ilist(ItemSearchCriteria scri) throws Exception{
	  return sqlSession.selectList("ClientMapper.ilistPage",scri);
  }
  //상품 목록 갯수
  @Override
  public int ilistCount(ItemSearchCriteria scri) throws Exception{
	  return sqlSession.selectOne("ClientMapper.ilistCount", scri);
  }
	//쿠폰리스트
  @Override
  public List<CouponVO> coulist(SearchCriteria scri) throws Exception{
	  return sqlSession.selectList("ClientMapper.coulistPage",scri);	
	}
//쿠폰 갯수
  @Override
	public int coulistCount(SearchCriteria scri) throws Exception{
	  return sqlSession.selectOne("ClientMapper.coulistCount", scri);
  }
  //쿠폰 삭제
  @Override
  public void deletecoupon(int cpn_no)throws Exception{
	  sqlSession.delete("ClientMapper.deletecoupon", cpn_no);
  }
  //쿠폰 정렬
  @Override
  public int coucount(int cpn_no)throws Exception{
	  return  sqlSession.selectOne("ClientMapper.coucount",cpn_no);
  }
  //쿠폰생성
  public void newcoupon(CouponVO vo,int edate) throws Exception{
	  Map<String, Object> map = new HashMap<String, Object>();
	  
	  map.put("cpn_name", vo.getCpn_name());
	  map.put("cpn_disc", vo.getCpn_disc());
	  map.put("cpn_edate", edate);
	  sqlSession.insert("ClientMapper.newcoupon",map);
  }
  
	public void pointInsert(String mem_id, int mem_point)throws Exception{
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("mem_id", mem_id);
		  map.put("mem_point", mem_point);
		  sqlSession.update("ClientMapper.pointInsert", map);
		
	}
	
	public void itemCateChange(String item_catesub, int item_no)throws Exception{
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("item_catesub", item_catesub);
		  map.put("item_no", item_no);
		  sqlSession.update("ClientMapper.itemCateChange", map);
	}
	
	public List<OrderedVO> orderList(ItemCriteria cri) throws Exception{
		return sqlSession.selectList("ClientMapper.orderList",cri);
	}
	
	//목록count
		public int orderCount(ItemCriteria cri)throws Exception{
			return sqlSession.selectOne("ClientMapper.orderCount", cri);
		}
		
		public int orderState1()throws Exception{
			return sqlSession.selectOne("ClientMapper.orderState1");
		}
		public int orderState2()throws Exception{
			return sqlSession.selectOne("ClientMapper.orderState2");
		}
		public int orderState3()throws Exception{
			return sqlSession.selectOne("ClientMapper.orderState3");
		}		
		
		
		//배송중으로 바꾸기
		public void delivNumberInsert(OrderedVO orderedVO)throws Exception{
			sqlSession.update("ClientMapper.delivNumberInsert", orderedVO);
		}

		public void delivNumberUpdate(OrderedVO orderedVO)throws Exception{
			sqlSession.update("ClientMapper.delivNumberUpdate", orderedVO);
		}
		
		public void orderExchange(int ordered_no)throws Exception{
			sqlSession.update("ClientMapper.orderExchange", ordered_no);
		}
		
		public void orderCancel(int ordered_no)throws Exception{
			sqlSession.update("ClientMapper.orderCancel", ordered_no);
		}
		public List<OrderItemInsertVO> orderItemView(int ordered_no)throws Exception{
			return sqlSession.selectList("ClientMapper.orderItemView", ordered_no);
		}
		
		public OrderedVO orderItemInfo(int ordered_no)throws Exception{
			return sqlSession.selectOne("ClientMapper.orderItemInfo", ordered_no);
		}

}

