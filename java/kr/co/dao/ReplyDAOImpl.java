package kr.co.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.B_replyVO;
import kr.co.vo.ItemReplyVO;
import kr.co.vo.ReviewCriteria;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	SqlSessionTemplate sql;

	// 댓글 조회
	@Override
	public List<B_replyVO> readReply(int b_no) throws Exception {
		return sql.selectList("replyMapper.readReply", b_no);
	}

	// 댓글 작성
	@Override
	public void writeReply(B_replyVO vo) throws Exception {
		sql.insert("replyMapper.writeReply", vo);
	}

	// 댓글 수정
	@Override
	public void updateReply(B_replyVO vo) throws Exception {
		sql.update("replyMapper.updateReply", vo);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(int r_no) throws Exception {
		sql.delete("replyMapper.deleteReply", r_no);
	}

	// 댓글 검색
	@Override
	public B_replyVO selectReply(int r_no) throws Exception {
		return sql.selectOne("replyMapper.selectReply", r_no);
	}

	// 리뷰 조회
	@Override
	public List<ItemReplyVO> item_replyList(int rpl_item_no) throws Exception {
		return sql.selectList("replyMapper.item_replyList", rpl_item_no);
	}

	// 리뷰 작성
	public void item_reply_write(ItemReplyVO ivo) throws Exception {
		sql.insert("replyMapper.item_reply_write", ivo);
	}

	public void item_reply_img(Map<String, Object> map) throws Exception {
		sql.update("replyMapper.item_reply_img", map);
	}

	// 리뷰 수정
	public void item_reply_update(ItemReplyVO ivo) throws Exception {
		sql.update("replyMapper.item_reply_update", ivo);
	}

	// 리뷰 삭제
	public void item_reply_delete(int rpl_no) throws Exception {
		sql.delete("replyMapper.item_reply_delete", rpl_no);
	}

	// 평점
	public List<ItemReplyVO> item_star(int item_no) throws Exception {
		return sql.selectList("replyMapper.item_star", item_no);
	}

	public void item_starUpdate(Map<String, Object> map) throws Exception {
		sql.update("replyMapper.item_starUpdate", map);
	}

	//사진 리뷰 조회
	public List<ItemReplyVO> photoreview(ReviewCriteria rcri) throws Exception {
		return sql.selectList("replyMapper.photoreview", rcri);
	}
	// 사진 리뷰 조회 갯수
	public int reviewCount() throws Exception {
		return sql.selectOne("replyMapper.reviewCount");
	}
}
