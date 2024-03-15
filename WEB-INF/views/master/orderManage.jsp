<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	console.log("111111");
	delivNumberAdd();
});
function delivNumberAdd() {
	var optionIndex = 1;
	$("#delivNumberAdd_btn")
			.on(
					"click",
					function() {
						console.log("dasda");
						
						$("#delivNumber")
								.append(
										"  <div class='form-group'><input placeholder='송장번호와 택배사' class='form-control' type='text' style='float:left;' name='ordered_delivnum' >"
					
												+ "<button type='submit' class='btn btn-round btn-g'>"
												+ "입력" + "</button></div>"

								);

					});
}
</script>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->

 <main>
    <div class="main">
        <section class="module">
             <%@include file="../include/masterSidebar.jsp"%>
				<div class="col-sm-10  mb-sm-10" style="float: none; margin:0 auto;">
 				<h1 class="font-alt mb-0" align="center" style="margin-top: -20; margin-right:50px; padding-bottom: 52px;">주문관리</h1>
            <div class="row" style="margin-left: 130px;">
              <div class="col-sm-12">
              <div class="col-sm-3 mb-20" >
              <button class="btn btn-round btn-g" onclick="location.href='http://localhost/master/orderManage?delivstate=1'">물품준비중 <span style="font-size:15px;">(${orderState1})</span></button>
              </div>
              <div class="col-sm-3">
              <button class="btn btn-round btn-g" onclick="location.href='http://localhost/master/orderManage?delivstate=2'">배송중<span style="font-size:15px;">(${orderState2})</span></button>
              </div>
              <div class="col-sm-3">
              <button class="btn btn-round btn-g" onclick="location.href='http://localhost/master/orderManage?delivstate=4'">취소신청 <span style="font-size:15px;">(${orderState3})</span></button>
              </div> 
              <div class="col-sm-1">
              <button class="btn btn-round btn-g" onclick="location.href='http://localhost/master/orderManage?delivstate=5'">환불처리 </button>
              </div>     
              <div class="col-sm-1">
              <button class="btn btn-round btn-g" onclick="location.href='http://localhost/master/orderManage?delivstate=6'">교환처리</button>
              </div> 
              <div class="col-sm-1">
              <button class="btn btn-round btn-g" onclick="location.href='http://localhost/master/orderManage?delivstate=3'">배송완료</button>
              </div>                                                                                             
 				
                <table class="table " style="text-align: center;;" >
                  <tbody>
                    <tr style="vertical-align : middle;" >
                      <th  class="font-alt" style="text-align: center; vertical-align : middle; width:13%;" >주문일</th>
                      <th  class="font-alt" style="text-align: center; vertical-align : middle; width:8%;">주문번호</th>
                      <th  class="font-alt" style="text-align: center; vertical-align : middle; width:14%;">주문자</th>
                      <th  class="font-alt" style="text-align: center; vertical-align : middle; width:8%;">총금액</th>
                      <th  class="font-alt" class="hidden-xs" style="text-align: center; vertical-align : middle; width:13%;">결제금액</th>
                      <th  class="font-alt" style="text-align: center; vertical-align : middle;; width:20%;">배송</th>
                      <th  class="font-alt" style="text-align: center; vertical-align : middle;; width:14%;">취소</th>
                    </tr>

                 <c:forEach items="${orderList}" var="orderList">
                 
                   <tr style="text-align: center; ">
         	

                      <td style="vertical-align : middle;">
					<fmt:formatDate pattern="yy-MM-dd" value="${orderList.ordered_date}"/>
                      
                      </td>
                      <td class="hidden-xs" style="vertical-align : middle;">
                       <a href="http://localhost/master/orderItemView?ordered_no=${orderList.ordered_no}">${orderList.ordered_no}</a> 
                      </td>
                        <td class="hidden-xs" style="vertical-align : middle;">
                        ${orderList.ordered_to_name}

                      </td>
                        <td class="hidden-xs" style="vertical-align : middle;">
                        ₩ <fmt:formatNumber pattern="###,###,###" value="${orderList.ordered_cartprice}"/>
                      
                      </td>
                    <td class="hidden-xs" style="vertical-align : middle;">
                    ₩ <fmt:formatNumber pattern="###,###,###" value="${orderList.ordered_orderprice}"/>
                      
                      </td>
                      
                      
                      
                      <td class="hidden-xs" style="vertical-align : middle; " >
                      <form action="/master/delivNumberInsert" method="post">
                      <input type="hidden" value="${orderList.ordered_no}" name="ordered_no" id="ordered_no">
                      <div id="delivNumber">
                     
                      <c:if test="${orderList.ordered_delivstate == 1 and orderList.ordered_paystate == 1}">
                      	물품준비중 
                      	<button class="btn btn-round btn-g" id="delivNumberAdd_btn" type="button">
                      	송장번호입력
                      	</button>
                      </c:if>
                   <c:if test="${orderList.ordered_delivstate == 2}">
                      	배송중
                      </c:if>
                     <c:if test="${orderList.ordered_delivstate == 3}">
                      	배송완료
                      </c:if>
                    
                </div>  
                 </form>
                
                      </td>
                      <td class="hidden-xs" style="vertical-align : middle;">
                     <c:if test="${orderList.ordered_paystate == 1}">
                      	정상주문
                      </c:if>                      
                     <c:if test="${orderList.ordered_paystate == 2}">
                      	취소신청
                      	<form action="/master/orderExchange" method="post">
                      	<input type="hidden" value="${orderList.ordered_no}" name="ordered_no">
                      	<button class="btn btn-round btn-g" type="submit">
                      	교환처리
                      	</button>
                      	</form>
                      	 <form action="/master/orderCancel" method="post">
                      	<input type="hidden" value="${orderList.ordered_no}" name="ordered_no">
                      	<button class="btn btn-round btn-g" type="submit">
                      	환불처리
                      	</button>
                      	</form>                     	
                      </c:if>
                      <c:if test="${orderList.ordered_paystate == 3}">
                      	환불
                      </c:if>
                     <c:if test="${orderList.ordered_paystate == 4}">
                      	교환
                      </c:if>   
                                                            
                      </td>                      
                    </tr>
                 </c:forEach>
                 

                  </tbody>
                </table>
              </div>
              
              
              
              
             <div class="row">
              <div class="col-sm-12">
     <div class="pagination font-alt">
  
    <c:if test="${pageMaker.prev}">
    <a href="/main/itemView${pageMaker.makeOrderQuery(pageMaker.startPage - 1)}"><i class="fa fa-angle-left"></i></a>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<a class="active" href="/main/itemView${pageMaker.makeOrderQuery(idx)}">${idx}</a>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<a href="/main/itemView${pageMaker.makeOrderQuery(pageMaker.endPage + 1)}"><i class="fa fa-angle-right"></i></a>
    </c:if> 

</div>
</div>
</div>
                </div>
                </div>

        </section>
        </div>
    </main>
<!-- footer 입니다 -->
<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->