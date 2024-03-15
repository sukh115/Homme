<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->

<main>
	<div class="main">
		<section class="module">
			<%@include file="../include/masterSidebar.jsp"%>
			<div class="col-sm-9  mb-sm-10" style="float: none; margin: 0 auto;">
				<h1 class="font-alt mb-0" align="center"
					style="margin-top: -20; padding-bottom: 52px;">orderItems</h1>
				<div class="row" style="margin-left: 130px;">
					<div class="col-sm-12">
						<table class="table " style="text-align: center;">
							<tbody>
								<tr style="vertical-align: middle;">
									<th class="font-alt"
										style="text-align: center; vertical-align: middle; width: 8%;">image</th>
									<th class="font-alt" class="hidden-xs"
										style="text-align: center; vertical-align: middle;">item</th>

									<th class="font-alt"
										style="text-align: center; vertical-align: middle; width: 20%;">옵션</th>
									<th class="font-alt"
										style="text-align: center; vertical-align: middle; width: 8%;">수량</th>
									<th class="font-alt"
										style="text-align: center; vertical-align: middle; width: 14%;">price</th>
								</tr>

								<c:forEach items="${orderItemView}" var="orderItemView">

									<tr style="text-align: center;">


										<td class="hidden-xs" style="vertical-align: middle;"><a
											href="/main/itemContent?item_no=${orderItemView.orderitem_item_no}"><img
												src="/img/${orderItemView.orderitem_img}"
												alt="Accessories Pack" /></a></td>
										<td style="vertical-align: middle;">
											<h5 class="product-title font-alt">
												<a
													href="/main/itemContent?item_no=${orderItemView.orderitem_item_no}">${orderItemView.orderitem_name}</a>
											</h5>
										</td>
										<td class="hidden-xs" style="vertical-align: middle;">
											<h5 class="product-title font-alt">
												${orderItemView.orderitem_option}</h5>
										</td>
										<td class="hidden-xs" style="vertical-align: middle;">
											<h5 class="product-title font-alt">
												${orderItemView.orderitem_select_vol}</h5>
										</td>

										<td class="hidden-xs" style="vertical-align: middle;">
											<h5 class="product-title font-alt">
												₩
												<fmt:formatNumber pattern="###,###,###"
													value="${orderItemView.orderitem_price}" />
												<br>

											</h5>
										</td>

									</tr>
								</c:forEach>

							</tbody>
						</table>
						<hr />
					</div>
					<h1 class="font-alt mb-0" align="center"
						style="margin-top: -20; margin-right: 120; padding-bottom: 52px;">주문서</h1>


					<div class="col-sm-5">
						<h3>구매자</h3>
						<div class="mb-30">
							<h5>성명</h5>
							<input class=" form-control input-lg well" type="text"
								placeholder="구매자 성명을 입력해주세요" name="ordered_to_name"
								id="order_to_name" value="${orderItemInfo.ordered_to_name}"
								readonly="readonly" />
						</div>

						<div class="mb-30">
							<h5>TEL</h5>
							<input class="form-control input-lg well" type="number"
								placeholder="연락처를 입력해주세요" name="ordered_to_tel"
								id="order_to_tel" value="${orderItemInfo.ordered_to_tel}"
								readonly="readonly" />
						</div>

						<div class="mb-30">
							<h5>EMAIL</h5>
							<input class="form-control input-lg well" type="email"
								placeholder="이메일을 입력해주세요" name="ordered_to_email"
								id="order_to_email" value="${orderItemInfo.ordered_to_email}"
								style="text-transform: lowercase;" readonly="readonly" />
						</div>

						<div class="mb-30">

							<h5>Address</h5>
							<input class="form-control" id="order_to_post" type="text"
								name="ordered_to_post" placeholder="우편번호를 검색해주세요"
								readonly="readonly" style="width: 200px; float: left"
								value="${orderItemInfo.ordered_to_post}" /> <input
								class="form-control input-lg well mt-10" type="text"
								placeholder="주소를 입력해주세요" name="ordered_to_adr" id="order_to_adr"
								value="${orderItemInfo.ordered_to_adr}" readonly="readonly" />

						</div>

					</div>
					<div class="col-sm-5 col-sm-offset-1">
						<h3>수취인</h3>
						<div class="mb-30">
							<h5>성명</h5>
							<input class=" form-control input-lg well" type="text"
								placeholder="구매자 성명을 입력해주세요" name="ordered_to_name"
								id="order_to_name" value="${orderItemInfo.ordered_from_name}"
								readonly="readonly" />
						</div>

						<div class="mb-30">
							<h5>TEL</h5>
							<input class="form-control input-lg well" type="number"
								placeholder="연락처를 입력해주세요" name="ordered_from_tel"
								id="order_to_tel" value="${orderItemInfo.ordered_from_tel}"
								readonly="readonly" />
						</div>


						<div class="mb-30">

							<h5>Address</h5>
							<input class="form-control" id="order_to_post" type="text"
								name="ordered_to_post" placeholder="우편번호를 검색해주세요"
								readonly="readonly" style="width: 200px; float: left"
								value="${orderItemInfo.ordered_from_post}" /> <input
								class="form-control input-lg well mt-10" type="text"
								placeholder="주소를 입력해주세요" name="ordered_to_adr" id="order_to_adr"
								value="${orderItemInfo.ordered_from_adr}" readonly="readonly" />

						</div>

					</div>

					<div class="col-sm-8 col-sm-offset-1">
						<hr />
						<h1 class="font-alt mb-0 mt-20" align="center"
							style="margin-top: -20; padding-bottom: 52px;">결제내역</h1>
						<h5>총액</h5>
						<input class="form-control" type="text"
							value="${orderItemInfo.ordered_cartprice}" readonly>
						<h5>결제금액</h5>
						<input class="form-control" type="text"
							value="${orderItemInfo.ordered_orderprice}" readonly>
						<h5>쿠폰명</h5>
						<input class="form-control" type="text"
							value="${orderItemInfo.ordered_cpn_name}" readonly>
						<h5>쿠폰할인액</h5>
						<input class="form-control" type="text"
							value="${orderItemInfo.ordered_cpn_disc}" readonly>
						<h5>적립금사용액</h5>
						<input class="form-control" type="text"
							value="${orderItemInfo.ordered_usepoint}" readonly>
						<h5>결제방식</h5>
						<input class="form-control" type="text" value="card" readonly>
						<h5>주문일</h5>
						<input class="form-control" type="text"
							value="${orderItemInfo.ordered_date}" readonly>
							
					</div>
				</div>
			</div>

		</section>
	</div>
</main>
<!-- footer 입니다 -->
<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->