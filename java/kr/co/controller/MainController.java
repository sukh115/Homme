package kr.co.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import kr.co.service.MainService;
import kr.co.service.ReplyService;
import kr.co.util.FileUtils;
import kr.co.vo.CartVO;
import kr.co.vo.ItemCriteria;
import kr.co.vo.ItemPageMaker;
import kr.co.vo.ItemReplyVO;
import kr.co.vo.ItemVO;
import kr.co.vo.MemberVO;
import kr.co.vo.OrderItemInsertVO;
import kr.co.vo.OrderItemVO;
import kr.co.vo.OrderedVO;

@RequestMapping({"/main"})
@Controller
public class MainController {
  private static final Logger logger = LoggerFactory.getLogger(MainController.class);
  
  @Autowired
  MainService mainService;
  
  @Autowired
  ReplyService replyService;
  
  @Autowired
  FileUtils fileUtils;
  
  @RequestMapping(value = {"/index"}, method = {RequestMethod.GET})
  public String main( Model model) throws Exception{
	  model.addAttribute("mainOuter", mainService.indexMainOuter());
	  model.addAttribute("mainTop", mainService.indexMainTop());
	  model.addAttribute("mainBotton", mainService.indexMainBotton());
	  model.addAttribute("mainShoes", mainService.indexMainShoes());
	  model.addAttribute("mainLatest", mainService.indexLatest());
	  model.addAttribute("mainRandom", mainService.indexRandom());
	  model.addAttribute("mainNews", mainService.indexNews());
	  
    return "/main/index";
  }
  
  @RequestMapping(value = {"/itemView"}, method = {RequestMethod.GET})
  public String itemView(Model model, @ModelAttribute("cri") ItemCriteria cri) throws Exception {
    logger.info("itemView" + cri.getPage());
    model.addAttribute("itemList", this.mainService.itemList(cri));
    ItemPageMaker pageMaker = new ItemPageMaker();
    pageMaker.setCri(cri);
    pageMaker.setTotalCount(this.mainService.itemCount(cri));
    model.addAttribute("pageMaker", pageMaker);
    return "/main/itemView";
  }
  
  @RequestMapping(value = {"/mainTest"}, method = {RequestMethod.GET})
  public String mainTest() throws Exception {
    return "/main/mainTest";
  }
  
  @RequestMapping(value = {"/itemContent"}, method = {RequestMethod.GET})
  public String itemCotent(ItemVO itemVO, @ModelAttribute("cri") ItemCriteria cri, Model model) throws Exception {
    model.addAttribute("itemContent", this.mainService.itemContent(itemVO));
    model.addAttribute("itemOption", this.mainService.itemOption(itemVO));
    
    // 상품 리뷰 리스트
    List<ItemReplyVO> item_replyList = replyService.item_replyList(itemVO.getItem_no());
    model.addAttribute("item_replyList",item_replyList);
    model.addAttribute("itemRandom", mainService.indexRandom());
    
    return "/main/itemContent";
  }
  
  //장바구니 
  @ResponseBody
  @RequestMapping(value = {"/cart"}, method = {RequestMethod.POST})
  public int cart(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cartVO) throws Exception {
    logger.info("itemno=" + cartVO.getCart_item_no());
    Cookie cookie = WebUtils.getCookie(request, "cartCookie");
    
    //비회원장바구니 첫 클릭시 쿠키생성
    if (cookie == null && session.getAttribute("member") == null) {
      String ckid = RandomStringUtils.random(6, true, true);
      Cookie cartCookie = new Cookie("cartCookie", ckid);
      cartCookie.setPath("/");
      cartCookie.setMaxAge(60 * 60 * 24 * 1);
      response.addCookie(cartCookie);
      cartVO.setCart_ckid(ckid);
      this.mainService.cartInsert(cartVO);
      
     //비회원 장바구니 쿠키생성 후 상품추가
    } else if (cookie != null && session.getAttribute("member") == null) {
    	
      String ckValue = cookie.getValue();
      cartVO.setCart_ckid(ckValue);
      //장바구니 중복제한
      if(mainService.cartCheck(cartVO) != 0) {
    	  return 2;
      }
      //쿠키 시간 재설정해주기
      cookie.setPath("/");
      cookie.setMaxAge(60 * 60 * 24 * 1);
      response.addCookie(cookie);
      
      mainService.cartInsert(cartVO);
      
     //회원 장바구니 상품추가
    } else if(session.getAttribute("member") != null){
      MemberVO memberVO = (MemberVO) session.getAttribute("member");
      cartVO.setCart_mem_no(memberVO.getMEM_NO());
      if(mainService.cartMemCheck(cartVO) != 0) {
    	  return 2;
      }
      mainService.cartInsert(cartVO);
    } 
    return 1;
  }
  
  //장바구니 삭제
  @ResponseBody
  @RequestMapping(value="cartDelete", method = RequestMethod.POST)
  public int cartDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cartVO, Model model) throws Exception{
		  mainService.cartDelete(cartVO);
		  return 1;
  }
  
  //장바구니 전체삭제
  @ResponseBody
  @RequestMapping(value="cartDeleteAll", method = RequestMethod.POST)
  public int cartDeleteAll(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cartVO, Model model) throws Exception{
	  
	  
	  //비회원시
	  if(session.getAttribute("member") == null) {
		  Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		  String ckValue = cookie.getValue();
		  cartVO.setCart_ckid(ckValue);
		  mainService.cartDeleteCk(cartVO);
	  }else if(session.getAttribute("member") != null){
		  //회원시
		  MemberVO memberVO = (MemberVO) session.getAttribute("member");
		  cartVO.setCart_mem_no(memberVO.getMEM_NO());
		  mainService.cartDeleteMem(cartVO);		  
	  }
		  return 1;
  }
  
  
  @RequestMapping(value = {"/cartView"}, method = {RequestMethod.GET})
  public String cartView(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cartVO, Model model) throws Exception {
    Cookie cookie = WebUtils.getCookie(request, "cartCookie");
 //비회원시 쿠키value인 ckid 사용
    if (cookie != null && session.getAttribute("member") == null) {
      String cartCookie = cookie.getValue();
      cartVO.setCart_ckid(cartCookie);
      model.addAttribute("cart", mainService.cartList(cartVO));
    } else if (cookie == null && session.getAttribute("member") != null) {
    //회원시 mem_no이용
    	MemberVO memberVO = (MemberVO) session.getAttribute("member");
     cartVO.setCart_mem_no(memberVO.getMEM_NO());
      model.addAttribute("cart", mainService.cartList(cartVO));
      model.addAttribute("cartCount", mainService.cartMemCount(cartVO));
    } 
    return "/main/cartView";
  }
  
  
  @ResponseBody
  @RequestMapping(value = {"/cartHeaderView"}, method = {RequestMethod.GET})
  public List<ItemVO> cartHeaderView(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cartVO, Model model) throws Exception {
    Cookie cookie = WebUtils.getCookie(request, "cartCookie");
    List<ItemVO> list = new ArrayList<>();
 //비회원시 쿠키value인 ckid 사용
    if (cookie != null && session.getAttribute("member") == null) {
      String cartCookie = cookie.getValue();
      cartVO.setCart_ckid(cartCookie);
      list = mainService.cartList(cartVO);
   
    } else if (cookie == null && session.getAttribute("member") != null) {
    //회원시 mem_no이용
    	logger.info("카트헤더들옴??");
    	MemberVO memberVO = (MemberVO) session.getAttribute("member");
    	cartVO.setCart_mem_no(memberVO.getMEM_NO());
    	list = mainService.cartList(cartVO);
    } 
    return list;
  }
  
  
  @RequestMapping(value = "/orderView",method=RequestMethod.POST)
  public String orderView(HttpSession session, HttpServletRequest request, HttpServletResponse response,
		  OrderItemVO orderItemVO, Model model,int totalPrice,int totalVol) throws Exception{
	  List<OrderItemVO> orderList = new ArrayList<>(); 
	  for(int i=0; i < (orderItemVO.getItem_no()).length; i++) {
		
		  OrderItemVO VO = new OrderItemVO();
		  VO.setOrder_item_img(orderItemVO.getItem_img()[i]);
		  VO.setOrder_item_name(orderItemVO.getItem_name()[i]);
		  VO.setOrder_item_option(orderItemVO.getItem_option()[i]);
		  VO.setOrder_item_price(orderItemVO.getItem_price()[i]);
		  VO.setOrder_option_no(orderItemVO.getOption_no()[i]);
		  VO.setOrder_item_no(orderItemVO.getItem_no()[i]);
		  VO.setOrder_select_vol(orderItemVO.getSelect_vol()[i]);
		  orderList.add(VO);

	  }
	  
	  model.addAttribute("order", orderList);
	  model.addAttribute("totalPrice", totalPrice);
	  model.addAttribute("totalVol", totalVol);
	  
	  if(session.getAttribute("member") != null) {
	  	MemberVO memberVO = (MemberVO) session.getAttribute("member");
	  model.addAttribute("coupon", mainService.orderCoupon(memberVO.getMEM_NO()));

	  }
	  return "/main/orderView";
  }
  
  @RequestMapping(value="/orderInsert", method=RequestMethod.POST)
  public String orderInsert(OrderedVO orderedVO, OrderItemInsertVO itemInsertVO, String merchant_uid)throws Exception{
	  logger.info("orderVOtest="+merchant_uid);
	  String ckid = RandomStringUtils.randomNumeric(8);
	  int orderedNo = Integer.parseInt(ckid);
	  orderedVO.setOrdered_no(orderedNo);
	  mainService.orderInsert(orderedVO, itemInsertVO);
	  
	  return "redirect:/main/cartView";
  }
  
  @ResponseBody
  @RequestMapping(value="/selectList", method=RequestMethod.GET)
  public List<ItemVO> selectList(String keyword)throws Exception{
	  if(keyword == "") {
		  List<ItemVO> list = new ArrayList<>(); 
		  return list;
	  }
	 return mainService.selectList(keyword);
  }
  
  
  
  //
  
  // 상품 리뷰 작성 화면
  @RequestMapping(value="/ireplywrite", method= {RequestMethod.GET})
  public String ireplywrite(int item_no,String item_name,Model model) throws Exception{
	  logger.info("ireplywrite"+item_no);
	  model.addAttribute("item_no", item_no);
	  model.addAttribute("item_name", item_name);
	  return "/main/ireplywrite";
  }
  // 상품 리뷰 작성
  @RequestMapping(value="/item_reply_write", method = {RequestMethod.POST})
  public String item_reply_write(ItemReplyVO ivo, MultipartHttpServletRequest mpRequest) throws Exception {
	 logger.info("상품리뷰작성");
	  replyService.item_reply_write(ivo, mpRequest);
	  
	  return "redirect:/main/index";
  }
  // 상품 리뷰 수정 뷰
  @RequestMapping(value="item_reply_updateview", method = {RequestMethod.GET})
  public String item_reply_updateview(ItemReplyVO ivo, Model model) throws Exception{
  	 logger.info("item_reply_updateview");
  	 
  	 return "main/itemreplyupdate";
  }
  // 상품 리뷰 수정
  @RequestMapping(value="item_reply_update", method = {RequestMethod.POST})
  public String item_reply_update(ItemReplyVO ivo) throws Exception{
	  logger.info("item_reply_update");
	  replyService.item_reply_update(ivo);
	  
	  return "redirect:/main/itemcontent";
  }
	@RequestMapping(value="/uploadImg", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> image( MultipartHttpServletRequest multipart) throws Exception{
		logger.info("updateImg");
		
		String imgPath = fileUtils.uploadImg(multipart);
		
		Map<String, Object> mapp = new HashMap<String, Object>();
		
	    mapp.put("uploaded", true);
	    mapp.put("url", imgPath);
	    return mapp;
	}
	/*
	 * // 상품 리뷰 삭제
	 * 
	 * @RequestMapping(value="item_reply_delete", method = {RequestMethod.POST})
	 * public String item_reply_delete(ItemReplyVO ivo) throws Exception{
	 * logger.info("itemreplydelete");
	 * 
	 * replyService.item_reply_delete(ivo.getRpl_no());
	 * 
	 * return "redirect:/main/itemcontent"
	 * 
	 * }
	 */
}
