<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
	var item_no = ${itemContent.item_no};

	$(document)
			.ready(
					function() {
						var target = document.getElementById("item_optiont");
						$("#cartInsert")
								.on(
										"click",
										function() {
											var item_optionValue = target.options[target.selectedIndex].value;
											var item_optionContent = target.options[target.selectedIndex].text;
											$
													.ajax({
														type : "POST",
														url : "/main/cart",
														dataType : "json",
														data : {
															'cart_option_no' : item_optionValue,
															'cart_option_content' : item_optionContent,
															'cart_item_no' : item_no
														},
														error : function(
																request,
																status, error) {
															alert("code:"
																	+ request.status
																	+ "\n"
																	+ "message:"
																	+ request.responseText
																	+ "\n"
																	+ "error:"
																	+ error);
														},
														success : function(data) {

															if (data == 1) {
																cartHeaderView();
																toastr.options.preventDuplicates = true;

																toastr
																		.success("장바구니 추가완료");
															} else if (data == 2) {
																toastr.options.preventDuplicates = true;

																toastr
																		.warning("이미 추가 된 상품입니다");
															}

														}
													});
										})

						$("#wishListInsert")
								.on(
										"click",
										function() {
											var item_optionValue = target.options[target.selectedIndex].value;
											var item_optionContent = target.options[target.selectedIndex].text;
											var item_img = '${itemContent.item_imgmain}';
											var item_name = '${itemContent.item_name}';
											var item_price = ${itemContent.item_price};
											$.ajax({
														type : "POST",
														url : "/member/wishListInsert",
														dataType : "json",
														data : {
															'wish_option_no' : item_optionValue,
															'wish_option_content' : item_optionContent,
															'wish_item_no' : item_no,
															'wish_item_img' : item_img,
															'wish_item_name' : item_name,
															'wish_item_price' : item_price
														},
														error : function(
																request,
																status, error) {
															alert("code:"
																	+ request.status
																	+ "\n"
																	+ "message:"
																	+ request.responseText
																	+ "\n"
																	+ "error:"
																	+ error);
														},
														success : function(data) {

															if (data == 1) {
																toastr.options.preventDuplicates = true;
																toastr
																		.success("wishList 추가완료");
															} else if (data == 2) {
																toastr.options.preventDuplicates = true;
																toastr
																		.warning("이미 추가 된 상품입니다");
															}

														}
													});
										})
					});
</script>

<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->

<div class="main">
	<section class="module">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 mb-sm-40">
					<a class="gallery" href="/img/${itemContent.item_imgmain}"> <img
						src="/img/${itemContent.item_imgmain}" alt="썸네일이미지" /></a>
					<ul class="product-gallery">
						<li><a class="gallery" href="/img/${itemContent.item_imgsub}">
								<img src="/img/${itemContent.item_imgsub}" alt="Single Product" />
						</a></li>
					</ul>
				</div>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-12">
							<h1 class="product-title font-alt">${itemContent.item_name}
							</h1>
						</div>
					</div>
					<!-- 평점 , 별점 -->
					<div class="row mb-20">
						<div class="col-sm-12">
							<c:if test="${itemContent.item_star == 0 }">
								<span><i class="fa fa-star-off"></i></span>
								<span><i class="fa fa-star star-off"></i></span>
								<span><i class="fa fa-star star-off"></i></span>
								<span><i class="fa fa-star star-off"></i></span>
								<span><i class="fa fa-star star-off"></i></span>

							</c:if>
							<c:if test="${itemContent.item_star == 1 }">
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star-off"></i></span>
								<span><i class="fa fa-star star-off"></i></span>
								<span><i class="fa fa-star star-off"></i></span>
								<span><i class="fa fa-star star-off"></i></span>

							</c:if>
							<c:if test="${itemContent.item_star == 2 }">
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star-off"></i></span>
								<span><i class="fa fa-star star-off"></i></span>
								<span><i class="fa fa-star star-off"></i></span>

							</c:if>
							<c:if test="${itemContent.item_star == 3 }">
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star-off"></i></span>
								<span><i class="fa fa-star star-off"></i></span>

							</c:if>
							<c:if test="${itemContent.item_star == 4 }">
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star-off"></i></span>

							</c:if>
							<c:if test="${itemContent.item_star == 5 }">
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>

							</c:if>
							<span>${itemContent.item_star}</span>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-12">
							<div class="price font-alt">
								<span class="amount">￦<fmt:formatNumber
										pattern="###,###,###" value="${itemContent.item_price}" />
								</span>
							</div>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-12">
							<div class="description">

								<p>${itemContent.item_subcontent}</p>
							</div>
							<div class="description">
								<br />
								<p>${itemContent.item_model}</p>
							</div>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-12 mb-sm-20 mb-2">
							<select class="form-control input-lg" name="item_optiont"
								id="item_optiont">
								<c:forEach items="${itemOption}" var="itemOption">
									<c:if test="${itemOption.option_vol > 0}">
										<option value="${itemOption.option_no}">${itemOption.option_content}
											<c:if test="${itemOption.option_vol == 1}"> - 마지막 상품</c:if>
										</option>
									</c:if>
									<c:if test="${itemOption.option_vol < 1}">
										<option value="${itemOption.option_no}" disabled>${itemOption.option_content}
											- 품절</option>
									</c:if>
								</c:forEach>
							</select> <br />
						</div>
					
						<div class="col-sm-4 mb-sm-20 mt-2" id="cartAction">
						<c:if test="${member != null}">
							<a class="btn btn-lg btn-block btn-round btn-g"
								id="wishListInsert"> WishList</a>
								</c:if>
						</div>
						<div class="col-sm-8">
							<a class="btn btn-lg btn-block btn-round btn-b" id="cartInsert">
								Add To Cart</a>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-12">
							<div class="product_meta">
								Categories: &nbsp;<a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=${itemContent.item_catesub}&sort=">${itemContent.item_catesub}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-70">
				<div class="col-sm-12">
					<ul class="nav nav-tabs font-alt" role="tablist">
						<li class="active"><a href="#description" data-toggle="tab">배송안내</a></li>
						<li><a href="#data-sheet" data-toggle="tab">교환안내</a></li>
						<li><a href="#reviews" data-toggle="tab">Reviews</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="description">
							<p style="font-size:13px;"> 'Homme'는 CJ대한통운 택배사를 이용하고 있습니다. ( 1588 - 1255 ) 재고가 있는
								상품에 한하여 '당일출고'를 원칙으로 하고 있습니다. <br/> 하지만, 재고가 없는 상품들은 선 주문 후 입고 시스템으로
								공장과 공급처의 재고 상태에 따라 2~5일 정도 소요 됩니다. (단, 제작이 지연되는 경우 배송 예정일이 보다
								늦어질 수 있습니다.)  <br/> 제품 공급의 문제나 지연이 발생 할 경우 3일 이내에 고객 분들께 개별적으로 연락드리고
								있습니다. <br/>  산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.  <br/>또한, N페이 이용 고객 중
								제주도 및 도서산간지역은 추가배송료가 자동으로 추가되지 않기 때문에, 별도로 3000원을 무통장입금해주셔야 합니다.</p>

						</div>
						<div class="tab-pane" id="data-sheet">
							<p style="font-size:13px;">교환 및 반품 시에는 반드시 수령 후
							24시간 이내에 게시판 or 고객센터(1566-6910)로 접수 부탁드립니다.  <br/>받아보신 상품을 절차 없이 보내실
							경우, 무통보 반송처리되실 수 있으니 이점 유의해주시기 바랍니다. <br/> 교환 및 반품 상품은 상품을 수령한 날(공급 받으신
							날)로부터 'Homme'에 7일 이내로 도착해야 합니다.(영업일 기준 7일)  <br/>교환 및 반품이 불가능한 경우  <br/>- 고객님의
							책임 있는 사유로 상품등이 멸실 또는 훼손된 경우 <br/> - 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우  <br/>-
							수제화 및 핸드메이드 및 Sale(시즌오프) 상품 <br/> - 신발 제품은 선주문 후입고 방식으로, 환불이 불가하며 교환만
							1회 가능합니다. (자세한 내용은 고객 CS 센터나, 카카오톡 'Homme'으로 상담 가능합니다.)  <br/>※ 고객님의 마음이
							바뀌어 교환, 반품을 하실 경우 상품반송 및 교환 비용은 고객님께서 부담하셔야 합니다. (색상 교환, 사이즈 교환 등
							포함) 편도 3,000원 입니다.
							</p>
							</div>
							
						<div class="tab-pane" id="reviews">
							<div class="comments reviews">


								<c:forEach items="${item_replyList}" var="replyList">
								
									<div class="comment clearfix">
										<div class="comment-avatar">
											<img src="/img/${replyList.rpl_img}" alt="avatar" />
										</div>
										<div class="comment-content clearfix">
											<div class="comment-author font-alt">
												<a href="#">${replyList.rpl_mem_id}</a>
											</div>
											<div class="comment-body">${replyList.rpl_content}</div>
											<div class="comment-meta font-alt">

												<fmt:formatDate value="${replyList.rpl_date}"
													pattern="yy-MM-dd" />
												<c:if test="${replyList.rpl_star == null}">
													<span><i class="fa fa-star star-off"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
												</c:if>
												<c:if test="${replyList.rpl_star == 1}">
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
												</c:if>
												<c:if test="${replyList.rpl_star == 2}">
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
												</c:if>
												<c:if test="${replyList.rpl_star == 3}">
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
												</c:if>
												<c:if test="${replyList.rpl_star == 4}">
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star-off"></i></span>
												</c:if>
												<c:if test="${replyList.rpl_star == 5}">
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star"></i></span>
													<span><i class="fa fa-star star"></i></span>
												</c:if>

											</div>
										</div>
									</div>
								</c:forEach>

							</div>



						</div>

					</div>
				</div>
			</div>
		</div>
</div>
</section>
<hr class="divider-w">
<section class="module">
	<div class="container">
		<div class="col-sm-8 col-sm-offset-2">
			${itemContent.item_content}</div>
	</div>
</section>

<hr class="divider-w">
<section class="module">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<h2 class="module-title font-alt">LATEST HOT ITEMS</h2>
				<div class="module-subtitle font-serif">10-RandomItems</div>
			</div>
		</div>
		<div class="row">
			<div class="owl-carousel text-center" data-items="5"
				data-pagination="false" data-navigation="false">
				<c:forEach items="${itemRandom}" var="itemRandom">
				<div class="owl-item">
					<div class="col-sm-12">
						<div class="ex-product">
							<a href="#"><img src="/img/${itemRandom.item_imgmain}"
								alt="Leather belt" /></a>
							<h4 class="shop-item-title font-alt">
								<a href="/main/itemContent?item_no=${itemRandom.item_no}">${itemRandom.item_name}</a>
							</h4>
							￦ <fmt:formatNumber pattern="###,###,###" value="${itemRandom.item_price}"/>
						</div>
					</div>
				</div>
		</c:forEach>
		
			</div>
		</div>
	</div>
</section>
<!-- footer 입니다 -->
<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->