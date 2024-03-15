package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.ClientDAO;
import kr.co.vo.CouponVO;
import kr.co.vo.ItemCriteria;
import kr.co.vo.ItemSearchCriteria;
import kr.co.vo.ItemVO;
import kr.co.vo.MemberVO;
import kr.co.vo.OrderItemInsertVO;
import kr.co.vo.OrderedVO;
import kr.co.vo.SearchCriteria;

@Service
public class ClientServiceImpl implements ClientService{

	@Autowired
	private ClientDAO dao;
	
	//회원삭제
	public void deleteClient(String memberId) throws Exception{
		
		dao.deleteClient(memberId);
		
	}
	//회원정지
	public void disableMember(String memberId,int sectiontime) throws Exception {
		dao.disableMember(memberId,sectiontime);
		
	}
	
	//정지해제
	public void disableCancel(String memberId) throws Exception{
		dao.disableCancel(memberId);
	}
	
	//회원조회
	public int count(String memberId) throws Exception{
		return dao.count(memberId);
		
	}
	//회원리스트 목록
	@Override
	public List<MemberVO> list(SearchCriteria scri) throws Exception{
		
		return dao.list(scri);
	}
	//회원리스트 목록갯수
	public int listCount(SearchCriteria scri) throws Exception{
		
		return dao.listCount(scri);
	}
	//상품 삭제
	public void deleteItem(int item_no) throws Exception{
		
		dao.deleteItem(item_no);
		
	}
	//상품 목록
	public int icount(int item_no) throws Exception{
		return dao.icount(item_no);
	}
	//상품 리스트
	public List<ItemVO> ilist(ItemSearchCriteria scri) throws Exception{
		
		return dao.ilist(scri);
	}	
	//상품리스트 목록갯수
	public int ilistCount(ItemSearchCriteria scri) throws Exception{
		
		return dao.ilistCount(scri);
	}	
	//쿠폰리스트
	public List<CouponVO> coulist(SearchCriteria scri)throws Exception{
		
		return dao.coulist(scri);
	}
	
	//쿠폰 갯수
	public int coulistCount(SearchCriteria scri)throws Exception{
		
		return dao.coulistCount(scri);
	}
	//쿠폰삭제
	@Override
	public void deletecoupon(int cpn_no) throws Exception{
		
		dao.deletecoupon(cpn_no);
		
	}
	//쿠폰 정렬
	@Override
	public int coucount(int cpn_no)throws Exception{
		
		return dao.coucount(cpn_no);
	}
	//쿠폰생성
	@Override
	public void newcoupon(CouponVO vo,int edate)throws Exception{
		
		
		 dao.newcoupon(vo,edate);
	}
	
	public void pointInsert(String mem_id, int mem_point)throws Exception{
		dao.pointInsert(mem_id, mem_point);
	}
	
	public void itemCateChange(String item_catesub, int item_no)throws Exception{
		dao.itemCateChange(item_catesub, item_no);
	}
	
	//주문관리목록
	public List<OrderedVO> orderList(ItemCriteria cri) throws Exception{
		return dao.orderList(cri);
	}
	
	//목록count
		public int orderCount(ItemCriteria cri)throws Exception{
			return dao.orderCount(cri);
		}

		public int orderState1()throws Exception{
			return dao.orderState1();
		}
		public int orderState2()throws Exception{
			return dao.orderState2();
		}
		public int orderState3()throws Exception{
			return dao.orderState3();
		}
		
		//배송중으로 바꾸기
		public void delivNumberInsert(OrderedVO orderedVO)throws Exception{
			dao.delivNumberInsert(orderedVO);
		}

		public void delivNumberUpdate(OrderedVO orderedVO)throws Exception{
			dao.delivNumberUpdate(orderedVO);
		}
		
		public void orderExchange(int ordered_no)throws Exception{
			dao.orderExchange(ordered_no);
		}
		
		public void orderCancel(int ordered_no)throws Exception{
			dao.orderCancel(ordered_no);
		}

		public List<OrderItemInsertVO> orderItemView(int ordered_no)throws Exception{
			return dao.orderItemView(ordered_no);
		}
	
		public OrderedVO orderItemInfo(int ordered_no)throws Exception{
			return dao.orderItemInfo(ordered_no);
		}
}
