package kr.co.dao;

import java.sql.Date;
import java.util.List;

import kr.co.vo.BoardVO;
import kr.co.vo.HistoryVO;
import kr.co.vo.MemberVO;
import kr.co.vo.OrderItemVO;
import kr.co.vo.WishListVO;

public interface MemberDAO {

	// 회원가입
	public void register(MemberVO vo) throws Exception;
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	// 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
    public void keepLogin(String MEM_ID, String sessionId, Date sessionLimit) throws Exception;
    // 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
    public MemberVO checkUserWithSessionKey(String value) throws Exception;
	// 회원수정
	public void memberUpdate(MemberVO vo) throws Exception;
	// 회원 삭제
	public void memberDelete(MemberVO vo) throws Exception;
	// 패스워드 체크
	public int passChk(MemberVO vo) throws Exception;
	// 아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	// 아이디 찾기
	List<MemberVO> findid(MemberVO vo) throws Exception;
	// 아이디,이메일 유효성 검사
	public int findPwCheck(MemberVO vo) throws Exception;
	// 임시 비밀번호 저장
	public int findPw(String MEM_EMAIL, String MEM_ID, String MEM_PW) throws Exception;
	// 비밀번호 변경
	public void changePw(String MEM_PW , String MEM_ID) throws Exception;
	//소셜회원가입
	public void snsRegister(String id,String name,String email)throws Exception;
	//소셜로그인 회원가입체크
	public int snsLoginCheck(String id)throws Exception;
	//소셜로그인
	public MemberVO snsLogin(String id)throws Exception;

	// 주문 조회 리스트
	public List<OrderItemVO> orderList(int orderitem_mem_no) throws Exception;

	//회원정지확인
	public int loginCheck(MemberVO memberVO)throws Exception;

	//위시리스트
	public void wishListInsert(WishListVO wishListVO)throws Exception;

	public List<WishListVO> wishList(int wish_mem_no)throws Exception;

	public int wishListCheck(WishListVO wishListVO)throws Exception;

	public void wishListDelete(int wish_no)throws Exception;

	public List<HistoryVO> history(int history_mem_no)throws Exception;


	public int coupon(int cpn_mem_no)throws Exception;

	// 일대일 상담
	public List<BoardVO> consult(String b_writer) throws Exception;

	public void updatePaystate(int ordered_no)throws Exception;

}
