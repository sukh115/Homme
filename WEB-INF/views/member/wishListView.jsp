<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

	
});

function wishListDelete(wish_no){
	 
	$.ajax({
		type : "POST",
		url : "/member/wishListDelete",
		dataType : "json",
		data : {"wish_no" : wish_no},
		error : function(request, status, error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success : function(data){
			if(data == 1){
				toastr.success("삭제완료");
				location.reload();
			}
		}
	
	});
 }
	
</script>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->
 <main>
    <div class="main">
        <section class="module">
       <%@include file="../include/mypageSidebar.jsp"%>
				<div class="col-sm-9  mb-sm-10" style="float: none; margin:0 auto;">
 				<h1 class="font-alt mb-0" align="center" style="margin-top: -20; margin-right:140px; padding-bottom: 52px;">WishList</h1>
            <div class="row" style="margin-left: 130px;">
              <div class="col-sm-12">
                  <table class="table">
                  <tbody>
                    <tr >
                      <th width="8%" class="hidden-xs">Image</th>
                      <th width="40%">Name</th>
                      <th width="20%">option</th>
                      <th class="hidden-xs" width="18%">Price</th>
                      <th width="5%">choice</th>
                    </tr>
                    <c:forEach items="${wishList}" var="wishList">
                    <tr>
                      <td class="hidden-xs" height="5px"><a href="/main/itemContent?item_no=${wishList.wish_item_no}"><img src="/img/${wishList.wish_item_img}"  alt="Accessories Pack"/></a></td>
                      <td style="vertical-align : middle;">
                        <h5 class="product-title font-alt"><a href="/main/itemContent?item_no=${wishList.wish_item_no}"> ${wishList.wish_item_name} </a></h5>
                      </td>
                           <td style="vertical-align : middle">
                        <h5 class="product-title font-alt">${wishList.wish_option_content}</h5>
                      </td>
                      <td class="hidden-xs" style="vertical-align : middle">
                        <h5 class="product-title font-alt">₩ <fmt:formatNumber pattern="###,###,###" value="${wishList.wish_item_price}"/> </h5>
                      </td>
                      <td style="vertical-align : middle" class="pr-remove"><a  onclick="wishListDelete(${wishList.wish_no});" title="Remove"><i class="fa fa-times" style="font-size:30px;"></i></a>
                      </td>
                    </tr>
                    </c:forEach>
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