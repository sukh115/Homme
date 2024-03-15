<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
itemTotal();

});
 function cartDelete(cart_no){
	 
	$.ajax({
		type : "POST",
		url : "/main/cartDelete",
		dataType : "json",
		data : {"cart_no" : cart_no},
		error : function(request, status, error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success : function(data){
			if(data == 1){
				alert("삭제완료");
				location.reload();
			}
		}
	
	});
 }
	
	 function cartDeleteAll(){
		
		 
		 $.ajax({
				type : "POST",
				url : "/main/cartDeleteAll",
				dataType : "json",
				error : function(request, status, error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				},
				success : function(data){
					if(data == 1){
						alert("삭제완료");
						location.reload();
					}
				}
			
			});
 }
	 
	 
	 function orderBtn(){
		 console.log("들어옴?");
		if(${member == null }){
			toastr.options.preventDuplicates = true;
			toastr.warning("주문하시려면 로그인을 해주세요");
			return false;
		}
		 
		 var optionVol = $('input[name="optionVol"]');
		 var sum = 0;
		var count = optionVol.length;
		console.log(count);
		var optionMax= $('input[name="select_vol"]'); 
		for(var i = 0; i < count; i++){
			sum = parseInt(optionVol[i].value);
			summ = parseInt(optionMax[i].value);
			console.log(summ);
			if(sum == 0){
				toastr.options.preventDuplicates = true;
				toastr.warning("품절상품은 주문하실 수 없습니다");
				return false;
			}else if(sum < summ){
				toastr.options.preventDuplicates = true;
				toastr.warning("최대수량을 넘겨서 주문하실 수 없습니다");
				return false;
				
			}
			
		}

		
		
		 var formObj = $("form[name='orderForm']");
		 formObj.attr("action", "/main/orderView");
		 formObj.attr("method", "post");
		 formObj.submit();
		 
	 }
	 
	 
	 
function itemTotal() {
	console.log("토탈들어옴?");
	var itemPrice = $('input[name="itemPrice"]');
	var selectvol = $('input[name="select_vol"]');
	var sum = 0;
	var count = itemPrice.length;
	var itemvol = 0;

	for (var i = 0; i < count; i++){
		
		sum += parseInt(itemPrice[i].value) * parseInt(selectvol[i].value);
		itemvol += parseInt(selectvol[i].value);
	}
	var summ = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(sum);
	$("#itemTotalPrice").html(summ);
	$("#itemTotalVol").html(itemvol);
	$("#totalPrice").val(sum);
	$("#totalVol").val(itemvol);
}
</script>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->
      <div class="main">
        <section class="module">
                         
        <form name="orderForm">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">Cart</h1>
              </div>
            </div>
            <hr class="divider-w pt-20">
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-hover ">
                  <tbody>
                    <tr class="bg-dark">
                      <th width="8%" class="hidden-xs">Item</th>
                      <th width="40%">Name</th>
                      <th width="15%">option</th>
                      <th class="hidden-xs" width="18%">Price</th>
                      <th width="10%">Quantity</th>
                      <th width="5%">Remove</th>
                    </tr>
                    <c:forEach items="${cart}" var="cart">
                    
					<input type="hidden" value="${cart.itemVO.item_price}" name="itemPrice" >
					<input type="hidden" value="${cart.optionVO.option_no}" name="option_no" >
					<input type="hidden" value="${cart.itemVO.item_no }" name="item_no" >
					<input type="hidden" value="${cart.itemVO.item_imgmain}" name="item_img" >
					<input type="hidden" value="${cart.itemVO.item_name}" name="item_name" >
					<input type="hidden" value="${cart.optionVO.option_content}" name="item_option" >
					<input type="hidden" value="${cart.itemVO.item_price}" name="item_price" >
					<input type="hidden" value="${cart.optionVO.option_vol}" name="optionVol">
					
					
                    <tr
                    <c:if test="${cart.optionVO.option_vol == 0}"> 
                    class="active"
                    </c:if> 
                    >
                      <td class="hidden-xs" height="5px"><a href="/main/itemContent?item_no=${cart.itemVO.item_no}"><img src="/img/${cart.itemVO.item_imgmain}"  alt="Accessories Pack"/></a></td>
                      <td style="vertical-align : middle;">
                        <h5 class="product-title font-alt"><a href="/main/itemContent?item_no=${cart.itemVO.item_no}"> ${cart.itemVO.item_name} </a></h5>
                      </td>
                           <td style="vertical-align : middle">
                        <h5 class="product-title font-alt">${cart.optionVO.option_content}</h5>
                      </td>
                      <td class="hidden-xs" style="vertical-align : middle">
                        <h5 class="product-title font-alt">₩ <fmt:formatNumber pattern="###,###,###" value="${cart.itemVO.item_price}"/> </h5>
                      </td>
                      <td style="vertical-align : middle">
                      	<c:if test="${cart.optionVO.option_vol == 0}">
                      	<h4>품절</h4>
                      	</c:if>
                      	<c:if test="${cart.optionVO.option_vol != 0}">
                        <input class="form-control" type="number" name="select_vol" id="select_vol" value="1" max="${cart.optionVO.option_vol}"
                         min="1" onchange="itemTotal();" title="남은 수량 : ${cart.optionVO.option_vol}" style="width: 70%;"/>
                        </c:if>
                      </td>
                 
                      <td style="vertical-align : middle" class="pr-remove"><a onclick="cartDelete(${cart.cart_no}); return flase;" title="Remove"><i class="fa fa-times" style="font-size:30px;"></i></a></td>
                    </tr>
                    </c:forEach>
                  
                  
                  
                  </tbody>
            
                </table>
              
              <c:if test="${cart == null && member == null}">
              <div style="text-align:center;">
              <h3>쇼핑백이 비었습니다.</h3>
              </div>
              </c:if>
              
              <c:if test="${cartCount == 0 && member != null}">
              <div style="text-align:center;">
              <h3>쇼핑백이 비었습니다.</h3>
              </div>
              </c:if>
              </div>
           
            </div>
            <hr class="divider-w mb-10">

            <div class="row mb-30">
              <div class="col-sm-3">
          
              </div>
              <div class="col-sm-3">
              </div>
              <div class="col-sm-3 col-sm-offset-3">
                <div class="form-group">
                    <c:if test="${cart != null && member == null}">
                  <button class="btn btn-block btn-round btn-d pull-right" type="button" onclick="cartDeleteAll(); return false;">Remove All</button>
                  </c:if>
                <c:if test="${cartCount != 0 && member != null}">
             <button class="btn btn-block btn-round btn-d pull-right" type="button" onclick="cartDeleteAll(); return false;">Remove All</button>
                </c:if>
                  
                </div>
              </div>
            </div>
            <hr class="divider-w">
            <div class="row mt-30">
              <div class="col-sm-5 col-sm-offset-7">
                <div class="shop-Cart-totalbox font-serif">
                  <h4 class="font-alt">Cart Totals</h4>
                  <table class="table  table-border checkout-table">
                    <tbody>
     
                      <tr >
                        <th  width="25%" style="vertical-align : middle;">Items : </th>
                        <td id="itemTotalVol" style="font-size : 20pt" ></td>
                      </tr>
                      <tr class="shop-Cart-totalprice ">
                        <th style="vertical-align : middle;">Total :</th>
                        <td id="itemTotalPrice" style="font-size : 20pt"></td>
                      </tr>
                      
                    </tbody>
                  </table>
                
                  <input id="totalPrice" type="hidden" name="totalPrice" >
                  <input id="totalVol" type="hidden" name="totalVol">
                  <button class="btn btn-lg btn-block btn-round btn-d" type="button" onclick="orderBtn(); return false;">Proceed to Checkout</button>
 				      
                </div>
              </div>
            </div>
          </div>
          </form> 
        </section>
<!-- footer 입니다 -->

	<%@include file="../include/footer.jsp"%>
	<!-- footer 입니다 -->