package kr.co.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.ReplyDAO;
import kr.co.util.FileUtils;
import kr.co.vo.B_replyVO;
import kr.co.vo.ItemReplyVO;
import kr.co.vo.ReviewCriteria;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO dao;
	
	@Autowired
	FileUtils fileUtils;
	
	// 댓글 조회
	@Override
	public List<B_replyVO> readReply(int b_no) throws Exception {
		return dao.readReply(b_no);
	}
	// 댓글 작성
	@Override
	public void writeReply(B_replyVO vo) throws Exception {
		dao.writeReply(vo);
	}
	// 댓글 수정
	@Override
	public void updateReply(B_replyVO vo) throws Exception {
		dao.updateReply(vo);
	}
	// 댓글 삭제
	@Override
	public void deleteReply(int r_no) throws Exception {
		dao.deleteReply(r_no);
	}
	//댓글 검색
	@Override
	public B_replyVO selectReply(int r_no) throws Exception {
		return dao.selectReply(r_no);
	}
	// 리뷰 조회
	@Override
	public List<ItemReplyVO> item_replyList(int rpl_item_no) throws Exception{
		return dao.item_replyList(rpl_item_no);
	}
	// 리뷰 작성
	@Override
	public void item_reply_write(ItemReplyVO ivo, MultipartHttpServletRequest mpRequest) throws Exception{
		dao.item_reply_write(ivo);
		Map<String, Object> map = fileUtils.itemReplyImg(ivo, mpRequest);
		dao.item_reply_img(map);
		
		int sum = 0;
		List<ItemReplyVO> star = dao.item_star(ivo.getRpl_item_no());
		for(int i =0; i<star.size(); i++) {
			ItemReplyVO itemReplyVO = star.get(i);
			int s = itemReplyVO.getRpl_star();
			sum = sum + s;
		}
		int a = sum / star.size() ; 
		
		Map<String, Object> Amap = new HashMap<>();
		Amap.put("item_star", a);
		Amap.put("item_no", ivo.getRpl_item_no());
		dao.item_starUpdate(Amap);
		
	}
	
	
	// 리뷰 수정
	@Override
	public void item_reply_update(ItemReplyVO ivo) throws Exception{
		dao.item_reply_update(ivo);
	}
	// 리뷰 삭제
	@Override
	public void item_reply_delete(int rpl_no) throws Exception{
		dao.item_reply_delete(rpl_no);
	}
	//사진 리뷰 조회
	public List<ItemReplyVO> photoreview(ReviewCriteria rcri) throws Exception{
		return dao.photoreview(rcri);
	}
	// 리뷰 조회 갯수
	public int reviewCount() throws Exception {
		return dao.reviewCount();
	}
}
