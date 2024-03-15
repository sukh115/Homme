<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->

 <main>
    <div class="main">
        <section class="module">
       <%@include file="../include/mypageSidebar.jsp"%>
				<div class="col-sm-9  mb-sm-10" style="float: none; margin:0 auto;">
 				<h1 class="font-alt mb-0" align="center" style="margin-top: -20; margin-right:140px; padding-bottom: 52px;">ordered</h1>
            <div class="row" style="margin-left: 130px;">
              <div class="col-sm-12">
                <table class="table " style="text-align: center;;" >
                  <tbody>
                    <tr style="vertical-align : middle;" >
                      <th  class="font-alt" style="text-align: center; vertical-align : middle; width:13%;" >주문번호</th>
                      <th  class="font-alt" style="text-align: center; vertical-align : middle; width:8%;">image</th>
                      <th  class="font-alt" class="hidden-xs" style="text-align: center; vertical-align : middle;">item</th>
                      <th  class="font-alt" style="text-align: center; vertical-align : middle; width:14%;">price</th>
                      <th  class="font-alt" style="text-align: center; vertical-align : middle; width:8%;">수량</th>
                      <th  class="font-alt" class="hidden-xs" style="text-align: center; vertical-align : middle; width:13%;">주문상태</th>
                      <th  class="font-alt" style="text-align: center; vertical-align : middle;; width:14%;">배송상태</th>
                    </tr>

                 <c:forEach items="${getOrderList}" var="getOrderList">
                 
                   <tr style="text-align: center; ">
         		
                    <td style="padding-left: 0px; padding-right: 0px; vertical-align : middle;">
                    	<fmt:formatDate value="${getOrderList.order_item_date}"/><br/>
                    	<a href="/member/orderDetail?ordered_no=${getOrderList.orderedVO.ordered_no}">${getOrderList.orderedVO.ordered_no}</a>
                    </td>
                      <td class="hidden-xs" style="vertical-align : middle;"><a href="/main/itemContent?item_no=${getOrderList.order_item_no}"><img src="/img/${getOrderList.order_item_img}" alt="Accessories Pack"/></a></td>
                      <td style="vertical-align : middle;">
                        <h5 class="product-title font-alt">${getOrderList.order_item_name}</h5>
                      </td>
                      <td class="hidden-xs" style="vertical-align : middle;">
                        <h5 class="product-title font-alt">₩ <fmt:formatNumber pattern="###,###,###" value="${getOrderList.order_item_price}"/><br>
                        								  
                        </h5>
                      </td>
                       <td class="hidden-xs" style="vertical-align : middle;">
                        <h5 class="product-title font-alt"> ${getOrderList.order_select_vol}						  
                        </h5>
                      </td>
                        <td class="hidden-xs" style="vertical-align : middle;">
                        <form action="/member/updatePaystate" method="post">
                        <input type="hidden" value="${getOrderList.orderedVO.ordered_no}" name="ordered_no">
                        <h5 class="product-title font-alt"> 
						<c:if test="${getOrderList.orderedVO.ordered_paystate == 1}">입금완료 <button  type="submit" class="btn btn-g btn-round btn-sm">취소신청</button></c:if>
						<c:if test="${getOrderList.orderedVO.ordered_paystate == 2}">주문취소신청</c:if>
						<c:if test="${getOrderList.orderedVO.ordered_paystate == 3}">교환</c:if>
						<c:if test="${getOrderList.orderedVO.ordered_paystate == 4}">환불</c:if>
						  
                        </h5>
                        </form>
                      </td>
                        <td class="hidden-xs" style="vertical-align : middle;">
                        <h5 class="product-title font-alt"> 						  
                       <c:if test="${getOrderList.orderedVO.ordered_delivstate == 1}">물품준비중</c:if>
                       <c:if test="${getOrderList.orderedVO.ordered_delivstate == 2}">배송중<p>${getOrderList.orderedVO.ordered_delivnum}</p> <p><button type="button" class="btn btn-g btn-round btn-sm" onclick="location.href='/main/ireplywrite?item_no=${getOrderList.order_item_no}&item_name=${getOrderList.order_item_name}'" ><span style="font-size:12px">reviews</span></button></p></c:if>
                       <c:if test="${getOrderList.orderedVO.ordered_delivstate == 3}">배송완료<button type="button" class="btn btn-g btn-round btn-sm" onclick="location.href='/main/ireplywrite?item_no=${getOrderList.order_item_no}&item_name=${getOrderList.order_item_name}'" ><span style="font-size:12px">reviews</span></button></c:if>
                        
                        </h5>
                      </td>
                    </tr>
                 </c:forEach>
<!--                     <tr>
                      <td class="hidden-xs"><a href="#"><img src="assets/images/shop/product-13.jpg" alt="Men’s Casual Pack"/></a></td>
                      <td>
                        <h5 class="product-title font-alt">Men’s Casual Pack</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">£20.00</h5>
                      </td>
                      <td>
                        <input class="form-control" type="number" name="" value="1" max="50" min="1"/>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">£20.00</h5>
                      </td>
                      <td class="pr-remove"><a href="#" title="Remove"><i class="fa fa-times"></i></a></td>
                    </tr> -->
                  </tbody>
                </table>
              </div>
                </div>
                </div>

        </section>
        </div>
    </main>
<!-- footer 입니다 -->
<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->