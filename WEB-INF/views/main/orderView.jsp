<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 
<style>
	.updown {
  border-right: solid 0.01px;
    }
</style>
-->
<script>
	function openDaumPostcodeTo() {
		new daum.Postcode({
			oncomplete : function(data) {

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				document.getElementById('order_to_post').value = data.zonecode;
				document.getElementById('order_to_adr').value = data.address;
			}
		}).open();
	}

	function openDaumPostcodeFrom() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
						document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
						document.getElementById('order_from_post').value = data.zonecode;
						document.getElementById('order_from_adr').value = data.address;
					}
				}).open();
	}
</script>
<script>
var payment = 0;
	$(document).ready(function() {
		console.log('ready');

		
		$("#fromBtn").on("click", function(){
			console.log('버튼누림');
			var name = document.getElementById('order_to_name').value; 
			var tel =  document.getElementById('order_to_tel').value; 
			var email =  document.getElementById('order_to_email').value; 
			var post =  document.getElementById('order_to_post').value; 
			var adr =  document.getElementById('order_to_adr').value; 
		
			$("#order_from_name").val(name);
			$("#order_from_tel").val(tel);
			$("#order_from_email").val(email);
			$("#order_from_post").val(post);
			$("#order_from_adr").val(adr);

			
		});
		
		total();
	});
	

	function total() {
		console.log("total실행됨");
		var coupon = document.getElementById("order_coupon");
		var point = document.getElementById("order_point");
		
		var totalPrice = ${totalPrice};

		var order_coupon = coupon.options[coupon.selectedIndex].value;
		var order_coupon_name = coupon.options[coupon.selectedIndex].text;
		var order_point = point.value;
		var mem_point = ${member.MEM_POINT};
		if(parseInt(mem_point) < parseInt(order_point)){
			$("#order_point").val(0);
			return false;
		}
		var discount = (parseInt(totalPrice) * (parseInt(order_coupon) * 0.01))

		payment = parseInt(totalPrice) - discount;
		payment = payment - parseInt(order_point) +2500;

		var sum = new Intl.NumberFormat('ko-KR', {
			style : 'currency',
			currency : 'KRW'
		}).format(payment);
		
		var discountSum = new Intl.NumberFormat('ko-KR', {
			style : 'currency',
			currency : 'KRW'
		}).format(discount);
		
		$("#payment").html(sum);
		$("#discount").html(discountSum);
		$("#order_cpn_name").val(order_coupon_name);
		$("#ordered_cpn_disc").val(parseInt(discount));
		$("#ordered_orderprice").val(parseInt(payment));
		
		

	}
	
	function orderBtn(){
		
		var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var tel_rule = /^\d{2,3}\d{3,4}\d{4}$/;

		if ($("#order_to_name").val() == null || $("#order_to_name").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("구매자 명을 입력해주세요");
			$("#order_to_name").focus();

			return false;
		}

		if ($("#order_to_tel").val() == null || $("#order_to_tel").val() == "") {
			
			toastr.options.preventDuplicates = true;
			toastr.warning("구매자번호를 입력해주세요.");
			$("#order_to_tel").focus();

			return false;
		}

		if ($("#order_to_email").val() == null || $("#order_to_email").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("구매자이메일을 입력해주세요.");
			$("#order_to_email").focus();

			return false;
		}

		if ($("#order_to_adr").val() == null || $("#order_to_adr").val() == "") {

			toastr.options.preventDuplicates = true;
			toastr.warning("구매자주소를 입력해주세요.");
			$("#order_to_adr").focus();

			return false;
		}

		if ($("#order_from_name").val() == null || $("#order_from_name").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("수취인명을 입력해주세요.");
			$("#order_from_name").focus();

			return false;
		}

		if ($("#order_from_tel").val() == null || $("#order_from_tel").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("수취인번호를 입력해주세요.");
			$("#order_from_tel").focus();

			return false;
		}


		if ($("#order_from_adr").val() == null || $("#order_from_adr").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("수취인 주소를 입력해주세요.");
			$("#order_from_adr").focus();

			return false;
		}

		if ($("#order_from_post").val() == null || $("#order_from_post").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("수취인 우편번호를 입력해주세요.");
			$("#order_from_post").focus();

			return false;
		}

		if ($("#order_to_post").val() == null || $("#order_to_post").val() == "") {
			toastr.options.preventDuplicates = true;
			toastr.warning("구매자 우편번호를 입력해주세요.");
			$("#order_to_post").focus();

			return false;
		}
		iamport();
	}
	
	
	function iamport(){
		
		var name = document.getElementById('order_to_name').value; 
		var tel =  document.getElementById('order_to_tel').value; 
		var email =  document.getElementById('order_to_email').value; 
		var post =  document.getElementById('order_to_post').value; 
		var adr =  document.getElementById('order_to_adr').value;  
		console.log("totalPay11=" + payment);
		
		IMP.init('imp66390967');
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : 'card',
		    merchant_uid : new Date().getTime() ,
		    name : 'Homme 결제' ,
		    amount : parseInt(payment), 
		    buyer_email : email,
		    buyer_name : name,
		    buyer_tel : tel,
		    buyer_addr : adr,
		    buyer_postcode : post
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
				
				$("#merchant_uid").val(parseInt(rsp.merchant_uid));

		        orderInsert();
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '//' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
	
	function orderInsert(){
		
		var formObj = $("form[name='orderForm']");


			formObj.attr("action", "/main/orderInsert");
			formObj.attr("method", "post");
			formObj.submit();
		
	}
</script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->
<div class="main">
	<section class="module">
		<form name="orderForm">
		<input type="hidden" id="ordered_mem_no" name="ordered_mem_no" value="${member.MEM_NO}">
		 <input type="hidden" id="merchant_uid" name="merchant_uid" > <!-- ordered_no 입니다 -->
		

			<div class="container">
				<div class="row">
					<div class="col-sm-12 ">
						<h1 class="module-title font-alt">Order</h1>

						<hr class="divider-w pt-20">
						<table class="table ">
							<tbody>
								<tr class=" bg-dark">
									<th width="7%" class="hidden-xs">Item</th>
									<th width="45%">Name</th>
									<th width="15%" style="text-align: center;">option</th>
									<th class="hidden-xs" width="18%" style="text-align: center;">Price</th>
									<th width="10%" style="text-align: center;">Quantity</th>

								</tr>
								<c:forEach items="${order}" var="order">
									<!-- <input type="hidden" id="Inorderitem_order_no" name="Inorderitem_order_no" value=""> -->
									<input type="hidden" id="Inorderitem_img" name="Inorderitem_img" value="${order.order_item_img}">
									<input type="hidden" id="Inorderitem_name" name="Inorderitem_name" value="${order.order_item_name}">
									<input type="hidden" id="Inorderitem_option" name="Inorderitem_option" value="${order.order_item_option}">
									<input type="hidden" id="Inorderitem_price" name="Inorderitem_price" value="${order.order_item_price}">
									<input type="hidden" id="Inorderitem_item_no" name="Inorderitem_item_no" value="${order.order_item_no}">
									<input type="hidden" id="Inorderitem_select_vol" name="Inorderitem_select_vol" value="${order.order_select_vol}">


									<tr>
										<td class="hidden-xs" height="5px"><a
											href="/main/itemContent?item_no=${order.order_item_no}"><img
												src="/img/${order.order_item_img}" alt="Accessories Pack" /></a></td>
										<td style="vertical-align: middle;">
											<h5 class="product-title font-alt">
												<a href="/main/itemContent?item_no=${order.order_item_no}">
													${order.order_item_name} </a>
											</h5>
										</td>
										<td style="vertical-align: middle; text-align: center;">
											<h5 class="product-title font-alt">${order.order_item_option}</h5>
										</td>
										<td class="hidden-xs"
											style="vertical-align: middle; text-align: center;">
											<h5 class="product-title font-alt">
												₩
												<fmt:formatNumber pattern="###,###,###"
													value="${order.order_item_price}" />
											</h5>
										</td>
										<td  style="vertical-align: middle; text-align: center;">

											<h5>${order.order_select_vol}</h5>
										</td>
									</tr>
								</c:forEach>



							</tbody>

						</table>








						<hr class="divider-w">

						<h2 class="module-title font-alt mt-40">information</h2>
						<div class="form-group col-sm-8 col-sm-offset-2 font-alt updown ">

							<!-- 구매자 -->
							<h3 class="font-alt mb-0">buyer</h3>
							<hr class="divider-w mt-10 mb-20">
							<div class="mb-30 ">
							
								<h5>NAME</h5>
								<input class=" form-control input-lg well" type="text"
									placeholder="구매자 성명을 입력해주세요" name="ordered_to_name"
									id="order_to_name" value="${member.MEM_NAME}" />
							</div>

							<div class="mb-30">
								<h5>TEL</h5>
								<input class="form-control input-lg well" type="number"
									placeholder="연락처를 입력해주세요" name="ordered_to_tel" id="order_to_tel"
									value="${member.MEM_TEL}"
									 />
							</div>

							<div class="mb-30">
								<h5>EMAIL</h5>
								<input class="form-control input-lg well" type="email"
									placeholder="이메일을 입력해주세요" name="ordered_to_email"
									id="order_to_email" value="${member.MEM_EMAIL}" style="text-transform: lowercase;" />
							</div>

							<div class="mb-30">

								<h5>Address</h5>
								<input class="form-control" id="order_to_post" type="text"
									name="ordered_to_post" placeholder="우편번호를 검색해주세요"
									readonly="readonly" style="width: 200px; float: left" value="${member.MEM_POST}"/>
								<button type="button" class="form-control"
									onclick="openDaumPostcodeTo()" style="width: 150px;">
									<i class="fa fa-search"></i> 우편번호 찾기
								</button>

								<input class="form-control input-lg well mt-10" type="text"
									placeholder="주소를 입력해주세요" name="ordered_to_adr" id="order_to_adr"
									value="${member.MEM_ADR}"
									/>

							</div>
						</div>


						<div class="form-group col-sm-6 col-sm-offset-3  font-alt">
							<hr class="divider-w mt-20 mb-50">
						</div>

						<!-- 배송정보 -->
						<div class="form-group col-sm-8 col-sm-offset-2 font-alt updown ">

							<h3 class="font-alt mb-0">receiver</h3>
							<hr class="divider-w mt-10 mb-20">

							<div class="mb-30 ">
							<button class="btn btn-g btn-round btn-xs" id="fromBtn" type="button">위와 동일</button>
							
								<h5>NAME</h5>
								<input class="form-control input-lg well" type="text"
									placeholder="수취인 성명을 입력해주세요" name="ordered_from_name"
									id="order_from_name" />
							</div>

							<div class="mb-30">
								<h5>TEL</h5>
								<input class="form-control input-lg well" type="tel"
									placeholder="연락처를 입력해주세요" name="ordered_from_tel"
									id="order_from_tel" />
							</div>


							<div class="mb-30">

								<h5>Address</h5>
								<input class="form-control" style="width: 200px; float: left" id="order_from_post" type="text"
									name="ordered_from_post" placeholder="우편번호를 검색해주세요"
									readonly="readonly" />
								<button type="button" class="form-control"
									onclick="openDaumPostcodeFrom()" style="width: 150px;">
									<i class="fa fa-search"></i> 우편번호 찾기
								</button>

								<input class="form-control input-lg well mt-10" type="text"
									placeholder="주소를 입력해주세요" name="ordered_from_adr"
									id="order_from_adr" >

							</div>
						</div>
						<div class="col-sm-12 ">
							<hr />
							<h2 class="module-title font-alt mt-40">payment</h2>

						</div>


						<div class="col-sm-8 col-sm-offset-2 ">

							<table class="table  table-bordered">
								<tbody>
									<tr>
										<th width="150px" class=" bg-dark">총액</th>
										<td>&nbsp; ₩ <fmt:formatNumber pattern="###,###,###"
												value="${totalPrice}" />
												<input type="hidden" id="ordered_cartprice" name="ordered_cartprice" value="${totalPrice}">
										</td>
									</tr>
									<tr>
										<th width="150px" class="hidden-xs bg-dark">할인쿠폰</th>
										<td><select class="form-control" id="order_coupon"
											name="order_coupon" onchange="total(); ">
										
									<option value="0">-----------</option>
								
												<c:forEach items="${coupon}" var="coupon">
													<option value="${coupon.cpn_disc}">${coupon.cpn_name}</option>
												</c:forEach>
										</select>
									<input type="hidden" id="order_cpn_name" name="ordered_cpn_name">
										
										</td>
									
									</tr>
									<tr>
									<th width="150px" class="hidden-xs bg-dark">할인금액</th>
									<td>&nbsp; - <span id="discount"></span>
									<input type="hidden" id="ordered_cpn_disc" name="ordered_cpn_disc">
									
									</td>
									</tr>
									<tr>
										<th width="150px" class="hidden-xs bg-dark">적립금사용</th>
										<td><input type="number" id="order_point"
											name="ordered_usepoint" class="form-control "
											style="width: 30%; float: left" min="0"
											max="${member.MEM_POINT}" value="0" onchange="total();" /> 
											<label
											for="order_point" class="control-label"> &nbsp; 가용적립금 :
												₩ <fmt:formatNumber pattern="###,###,###"
													value="${member.MEM_POINT}" />
										</label></td>

									</tr>
									<tr>
										<th width="150px" class="hidden-xs bg-dark">배송비</th>
										<td>&nbsp; ₩ <fmt:formatNumber pattern="###,###,###"
												value="2500" /></td>

									</tr>

									<tr>
										<th width="150px" class="hidden-xs bg-dark">총결제액</th>
										
										<td> &nbsp; <strong><span id="payment" style="font-size : 20pt"></span></strong>
										<input type="hidden" id="ordered_orderprice" name="ordered_orderprice">
										
										</td>
										

									</tr>
									
									<tr>
										<th width="150px" class="hidden-xs bg-dark">결제방식</th>
										<td>
																					<div class="form-check">
												<input class="form-check-input" type="radio"
													name="ordered_payhow" id="flexRadioDefault2" value="1" checked>
												<label class="form-check-label" for="flexRadioDefault2">
													통합결제</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="ordered_payhow" id="flexRadioDefault1" value="2"> <label
													class="form-check-label" for="flexRadioDefault1">
													무통장입금 </label>
											</div>


											</td>
									</tr>




								</tbody>

							</table>
								

						</div>
						

						<div class="col-sm-4 col-sm-offset-6">
						<button class="btn btn-lg btn-block btn-round btn-d"
									type="button" onclick="orderBtn();">
									결제</button>
						</div>



					</div>
				</div>
			</div>
		</form>
	</section>


	<!-- col-sm-offset-7 -->

	<!-- footer 입니다 -->

	<%@include file="../include/footer.jsp"%>
	<!-- footer 입니다 -->