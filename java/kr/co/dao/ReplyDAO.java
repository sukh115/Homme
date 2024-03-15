package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.B_replyVO;
import kr.co.vo.ItemReplyVO;
import kr.co.vo.ReviewCriteria;

public interface ReplyDAO {
	// 댓글 조회
	public List<B_replyVO> readReply(int b_no) throws Exception;

	// 댓글 작성
	public void writeReply(B_replyVO vo) throws Exception;

	// 댓글 수정
	public void updateReply(B_replyVO vo) throws Exception;

	// 댓글 삭제
	public void deleteReply(int r_no) throws Exception;

	// 댓글 검색
	public B_replyVO selectReply(int r_no) throws Exception;

	// 리뷰 조회
	public List<ItemReplyVO> item_replyList(int rpl_item_no) throws Exception;

	// 리뷰 작성
	public void item_reply_write(ItemReplyVO ivo) throws Exception;

	public void item_reply_img(Map<String, Object> map) throws Exception;

	// 리뷰 수정
	public void item_reply_update(ItemReplyVO ivo) throws Exception;

	// 리뷰 삭제
	public void item_reply_delete(int rpl_no) throws Exception;

	public List<ItemReplyVO> item_star(int item_no) throws Exception;

	public void item_starUpdate(Map<String, Object> map) throws Exception;
	
	//사진 리뷰 조회
	public List<ItemReplyVO> photoreview(ReviewCriteria rcri) throws Exception;
	
	// 사진 리뷰 조회 갯수
	public int reviewCount() throws Exception;
}
