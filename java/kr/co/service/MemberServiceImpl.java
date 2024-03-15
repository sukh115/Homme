package kr.co.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.MemberDAO;
import kr.co.util.MailUtils;
import kr.co.util.TempKey;
import kr.co.vo.BoardVO;
import kr.co.vo.HistoryVO;
import kr.co.vo.MemberVO;
import kr.co.vo.OrderItemVO;
import kr.co.vo.WishListVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;

	@Autowired
	JavaMailSender mailSender;

	@Transactional
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}
	@Transactional
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	@Override
    public void keepLogin(String MEM_ID, String sessionId, Date sessionLimit) throws Exception {
        dao.keepLogin(MEM_ID, sessionId, sessionLimit);
    }
	@Override
    public MemberVO checkLoginBefore(String value) throws Exception {
        return dao.checkUserWithSessionKey(value);
    }
	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}
	@Transactional
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {

		dao.memberUpdate(vo);
	}
	@Transactional
	@Override
	public void memberDelete(MemberVO vo) throws Exception {

		dao.memberDelete(vo);
	}
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
	@Override
	public ArrayList<String> findid(MemberVO vo) throws Exception {
		List<MemberVO> list = dao.findid(vo);
		ArrayList<String> findid = new ArrayList<String>();
		for(int i =0; i <list.size(); i ++) {
			String email = list.get(i).getMEM_ID();
			findid.add(email);
		}
		return findid;
	}
	@Override
	public int findPwCheck(MemberVO vo) throws Exception {
		return dao.findPwCheck(vo);
	}
	@Override
	public void findPw(String MEM_EMAIL,String MEM_ID) throws Exception {
		String memberKey = new TempKey().getKey(6,false);
		String MEM_PW = BCrypt.hashpw(memberKey,BCrypt.gensalt());
		 dao.findPw(MEM_EMAIL,MEM_ID,MEM_PW);
		 MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("[Homme 임시 비밀번호 입니다.]"); //메일제목
			sendMail.setText(
					"<h1>임시비밀번호 발급</h1>" +
							"<br/>"+MEM_ID+"님 "+
							"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
							"<br/>임시비밀번호 :   <h2>"+memberKey+"</h2>"+
							"<br/>로그인 후 비밀번호 변경을 해주세요."+
							"<a href='http://localhost:80/member/LoginForm"+
							">로그인 페이지</a>");
			sendMail.setFrom("rinkim98@gmail.com", "Homme");
			sendMail.setTo(MEM_EMAIL);
			sendMail.send();
	}
	@Override
	public void changePw(String MEM_PW , String MEM_ID) throws Exception {
		dao.changePw(MEM_PW , MEM_ID);
	}
	//소셜로그인
	@Override
	public void snsRegister(String id,String name,String email)throws Exception{
		dao.snsRegister(id, name, email);
	}
	//소셜로그인 체크
	@Override
	public int snsLoginCheck(String id)throws Exception{
		return dao.snsLoginCheck(id);
	}
	//소셜로그인
	@Override
	public MemberVO snsLogin(String id)throws Exception{
		return dao.snsLogin(id);
		}
	// 주문 조회 리스트
	@Override
	public List<OrderItemVO> orderList(int orderitem_mem_no) throws Exception{
		return dao.orderList(orderitem_mem_no);
	}

	//위시리스트
	public void wishListInsert(WishListVO wishListVO)throws Exception{
		dao.wishListInsert(wishListVO);
	}

	public List<WishListVO> wishList(int wish_mem_no)throws Exception{
		return dao.wishList(wish_mem_no);
	}

	public int wishListCheck(WishListVO wishListVO)throws Exception{
		return dao.wishListCheck(wishListVO);
	}

	public void wishListDelete(int wish_no)throws Exception{
		dao.wishListDelete(wish_no);
	}

	public List<HistoryVO> history(int history_mem_no)throws Exception{
		return dao.history(history_mem_no);
	}

	//회원정지확인
	public int loginCheck(MemberVO memberVO)throws Exception{
		return dao.loginCheck(memberVO);
	}
	public int coupon(int cpn_mem_no)throws Exception{
		return dao.coupon(cpn_mem_no);
	}
	// 일대일 상담
	public List<BoardVO> consult(String b_writer) throws Exception {
		return dao.consult(b_writer);
	}


	public void updatePaystate(int ordered_no)throws Exception{
		dao.updatePaystate(ordered_no);
	}
}
