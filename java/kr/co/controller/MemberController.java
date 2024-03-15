package kr.co.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import kr.co.service.ClientService;
import kr.co.service.MainService;
import kr.co.service.MemberService;
import kr.co.sns.SNSLogin;
import kr.co.sns.SnsValue;
import kr.co.vo.MemberVO;
import kr.co.vo.OrderItemVO;
import kr.co.vo.WishListVO;

@Controller
@RequestMapping({ "/member/*" })
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService service;

	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@Autowired
	JavaMailSender mailSender;
	@Autowired
	MainService mainService;

	@Autowired
	SnsValue naverSns;

	@Autowired
	GoogleConnectionFactory googleConnectionFactory;

	@Autowired
	OAuth2Parameters googleOAuth2Parameters;

	@Autowired
	ClientService clientService;

	// 회원가입 GET
	@RequestMapping(value = "/RegisterForm", method = RequestMethod.GET)
	public String getRegister(MemberVO vo) throws Exception {
		logger.info("get register");
		return "/member/RegisterForm";
	}

	// 회원가입 POST
	@RequestMapping(value = "/Register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register" + vo.getMEM_ID());

		String inputPass = vo.getMEM_PW();
		String pass = pwdEncoder.encode(inputPass);
		vo.setMEM_PW(pass);
		service.register(vo);
		return "/member/LoginForm";
	}

	// 로그인 GET
	@RequestMapping(value = "/LoginForm", method = RequestMethod.GET)
	public String getLogin(Model model, HttpSession session) throws Exception {
		logger.info("get login");
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("google_url", url);
		logger.info("google_url" + url);

		return "/member/LoginForm";
	}

	// 로그인 POST
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr, Model model) throws Exception {
		logger.info("post login");

		MemberVO login = service.login(vo);

		boolean pwdMatch = pwdEncoder.matches(vo.getMEM_PW(), login.getMEM_PW());
		if (service.loginCheck(login) != 0 && pwdMatch == true) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy년 MM월 dd일"); // 원하는 데이터 포맷 지정 String strNowDate
																						// =
																						// simpleDateFormat.format(nowDate);
			String strNowDate = simpleDateFormat.format(login.getMEM_SECTIONTIME()); // 지정한 포맷으로 변환
			rttr.addFlashAttribute("msg", strNowDate + "까지 정지된 회원입니다.");
			return "redirect:/member/LoginForm";
		}
		if (login != null && pwdMatch == true) {
			logger.info("sadasd");
			model.addAttribute("member", login);
			// 로그인 유지를 선택할 경우
			if (vo.isUseCookie()) {
				int amount = 60 * 60 * 24 * 7; // 7일
				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정
				service.keepLogin(vo.getMEM_ID(), session.getId(), sessionLimit);
			}

			// 비회원 장바구니 회원장바구니로 이동
			Cookie cookie = WebUtils.getCookie(request, "cartCookie");

			if (cookie != null) {
				String ckValue = cookie.getValue();
				logger.info("비회원장바구니 삭제");
//쿠키에 담긴 정보에 회원NO 입력

				mainService.cartUpdate(login.getMEM_NO(), ckValue);
//쿠키삭제
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			return "/main/index";

		} else {
			model.addAttribute("member", null);
			rttr.addFlashAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
			return "redirect:/member/LoginForm";
		}
	}

	// 네이버 로그인
	@RequestMapping(value = "/naverLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String snsLoginCallback(HttpSession session, Model model, @RequestParam String code) throws Exception {
		logger.info("naverLogin");
		SnsValue sns = naverSns;
		SNSLogin snsLogin = new SNSLogin(sns);
		MemberVO snsUser = snsLogin.getUserProfile(code);
		logger.info("Profile=" + snsUser.getNaverid());

		if (service.snsLoginCheck(snsUser.getNaverid()) == 0) {
			service.snsRegister(snsUser.getNaverid(), snsUser.getNickname(), snsUser.getEmail());
		}
		MemberVO memberVO = service.snsLogin(snsUser.getNaverid());
		session.setAttribute("member", memberVO);
		return "/main/index";
	}

	// 구글 로그인
	@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws IOException {

		System.out.println("Google login success");

		return "/main/index";
	}

	// 로그아웃 GET
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Object object = session.getAttribute("member");
		if (object != null) {
			MemberVO vo = (MemberVO) object;
			session.removeAttribute("member");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				Date date = new Date(System.currentTimeMillis());
				service.keepLogin(vo.getMEM_ID(), "none", date);
			}
		}

		return "/member/LogoutForm";
	}

	// 회원수정 GET
	@RequestMapping(value = "/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {

		return "/member/memberUpdateView";
	}

	// 회원수정 POST
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception {
		logger.info("수정");
		service.memberUpdate(vo);

		MemberVO membervo = (MemberVO) session.getAttribute("member");
		membervo.setMEM_ID(vo.getMEM_ID());
		membervo.setMEM_NAME(vo.getMEM_NAME());
		membervo.setMEM_POST(vo.getMEM_POST());
		membervo.setMEM_ADR(vo.getMEM_ADR());
		membervo.setMEM_TEL(vo.getMEM_TEL());
		membervo.setMEM_EMAIL(vo.getMEM_EMAIL());

		session.setAttribute("member", vo);
		logger.info("들어왔니?");

		return "/member/memberUpdateView";
	}

	// 회원삭제 GET
	@RequestMapping(value = "/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		logger.info("제발~");
		return "/member/memberDeleteView";

	}

	// 회원삭제 POST
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("제발 되라~");
		service.memberDelete(vo);
		session.invalidate();
		return "/main/index";
	}

	// 비밀번호 체크
	@ResponseBody
	@RequestMapping(value = "/member/passChk", method = RequestMethod.POST)
	public boolean passChk(MemberVO vo) throws Exception {
		MemberVO login = service.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getMEM_PW(), login.getMEM_PW());
		logger.info("됨?" + pwdChk);
		return pwdChk;
	}

	// 아이디 체크
	@ResponseBody
	@RequestMapping(value = "/member/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		logger.info("id:" + vo.getMEM_ID());
		int result = service.idChk(vo);
		logger.info("result:" + result);

		return result;
	}

	// 이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(@RequestParam("MEM_EMAIL") String MEM_EMAIL) throws Exception {

		// 뷰(View)로부터 넘어온 데이터 확인
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증번호 :" + MEM_EMAIL);

		// 인증번호(난수) 생성
		int checkNum = (int) ((Math.random() * (99999 - 10000 + 1)) + 10000);
		logger.info("인증번호 " + checkNum);

		// 이메일 보내기
		String setFrom = "rinkim98@gmail.com";
		String toMail = MEM_EMAIL;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		String num = "";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			num = Integer.toString(checkNum);

		} catch (Exception e) {
			num = "error";
		}
		return num;
	}

	// 아이디 찾기 GET
	@RequestMapping(value = "/userSearch", method = RequestMethod.GET)
	public String userSearchGET() throws Exception {
		return "/member/userSearch";
	}

	// 아이디 찾기 POST
	@RequestMapping(value = "/findid", method = RequestMethod.POST)
	public @ResponseBody String findid(@ModelAttribute MemberVO vo, Model model, HttpServletResponse response)
			throws Exception {
		logger.info("post findid//" + vo.getMEM_NAME() + "///" + vo.getMEM_EMAIL());
		System.out.println(vo.toString());
		ArrayList<String> emailList = service.findid(vo);
		System.out.println(emailList.toString());
		System.out.println(emailList.get(0));
		String findEmail = "{\"MEM_EMAIL\":\"" + emailList + "\"}";

		System.out.println(findEmail);

		return findEmail;
	}

	// 비밀번호 찾기 GET
	@RequestMapping(value = "/findPwView", method = RequestMethod.GET)
	public String findPwView() throws Exception {
		return "/member/findPwView";
	}

	// 비밀번호 찾기 POST
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public String findPw(MemberVO vo, Model model) throws Exception {
		logger.info("memberPw" + vo.getMEM_ID());

		if (service.findPwCheck(vo) == 0) {
			logger.info("memberPWCheck");
			model.addAttribute("msg", "아이디와 이메일를 확인해주세요");

			return "/member/findPwView";
		} else {

			service.findPw(vo.getMEM_EMAIL(), vo.getMEM_ID());
			model.addAttribute("member", vo.getMEM_EMAIL());
			model.addAttribute("msg", "임시비밀번호가 전송되었습니다");
			return "/member/LoginForm";
		}
	}

	// 마이페이지 get
	@RequestMapping(value = "/MyPageView", method = RequestMethod.GET)
	public String getMyPageView(HttpSession session, String update, MemberVO vo, Model model, OrderItemVO gvo)
			throws Exception {
		logger.info("get MyPageView");
		// 주문 조회 리스트
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		List<OrderItemVO> getOrderList = service.orderList(memberVO.getMEM_NO());

		model.addAttribute("getOrderList", getOrderList);

		return "/member/MyPageView";
	}

	// 비밀번호 변경
	@RequestMapping(value = "/changePwView", method = RequestMethod.GET)
	public String changePw(MemberVO vo) throws Exception {

		return "/member/changePwView";
	}

	// 비밀번호 변경 POST
	@ResponseBody
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public String changePw(HttpSession session, MemberVO vo, String PW, String newPW, Model model) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		boolean pwdMatch = pwdEncoder.matches(memberVO.getMEM_PW(), vo.getMEM_PW());

		logger.info("아무거나");

		if (pwdMatch != true) {
			model.addAttribute("msg", "현재 비밀번호가 옳지 않습니다.");
			return "/member/changePwView";
		} else {
			String hashPW = BCrypt.hashpw(newPW, BCrypt.gensalt());
			service.changePw(hashPW, memberVO.getMEM_ID());
			logger.info("노래");
			session.invalidate();
			return "/member/LoginForm";

		}
	}

	@RequestMapping(value = "/wishListView", method = RequestMethod.GET)
	public String wishListView(HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		model.addAttribute("wishList", service.wishList(memberVO.getMEM_NO()));
		return "/member/wishListView";
	}

	@ResponseBody
	@RequestMapping(value = "/wishListInsert", method = RequestMethod.POST)
	public int wishListInsert(WishListVO wishListVO, HttpSession session) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		wishListVO.setWish_mem_no(memberVO.getMEM_NO());
		if (service.wishListCheck(wishListVO) != 0) {
			return 2;
		}
		service.wishListInsert(wishListVO);
		return 1;
	}

	@ResponseBody
	@RequestMapping(value = "wishListDelete", method = RequestMethod.POST)
	public int wishListDelete(int wish_no) throws Exception {
		service.wishListDelete(wish_no);
		return 1;
	}

	// 쿠폰 내역
	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public String history(HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		model.addAttribute("history", service.history(memberVO.getMEM_NO()));
		model.addAttribute("coupon", service.coupon(memberVO.getMEM_NO()));
		return "/member/pointView";
	}

	@RequestMapping(value = "/consult", method = RequestMethod.GET)
	public String consult(String b_writer, Model model, HttpSession session) throws Exception {

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		model.addAttribute("consult", service.consult(memberVO.getMEM_ID()));

		return "/member/consultview";
	}

	@RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
	public String orderItemView(int ordered_no, Model model) throws Exception {
		logger.info("ordered_no" + ordered_no);
		model.addAttribute("orderItemView", clientService.orderItemView(ordered_no));
		model.addAttribute("orderItemInfo", clientService.orderItemInfo(ordered_no));
		return "/member/orderDetail";
	}

	@RequestMapping(value = "/updatePaystate" , method = RequestMethod.POST)
public String updatePaystate(int ordered_no)throws Exception{
	service.updatePaystate(ordered_no);
	return "redirect:/member/MyPageView";
}

}
