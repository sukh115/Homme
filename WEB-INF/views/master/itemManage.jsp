<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script type="text/javascript">
if(${nlist == null}){
alert("d널"); 
}else if (${nlist != null}){
	alert("널아님");
}
</script> -->
<%@include file="../include/header.jsp"%>

     <div class="main">
  
        
         
        <section class="module">
          <div class="container mt-80">
            <div class="row">
              
       <%@include file="../include/masterSidebar.jsp"%>
			
              
              <div class="col-sm-8 col-sm-offset-1">
              <h2>상품관리</h2>
<form role="form" method="post" action="/master/deleteItem">
			<table class="table table-boarderd" >
	<tr><th width="10%">번호</th>
		<th width="6%">메인</th>
		<th>이름</th>
		<th >가격</th>
		<th width="10%">별점</th>
		<th width="10%">할인율</th>
		<th width="10%">대분류</th>
		<th >소분류</th>
	</tr>
<c:forEach var="item" items="${ilist}">
<tr>
	<td><a href="/main/itemContent?item_no=${item.item_no}">${item.item_no}</a></td>
	<td><a href="/main/itemContent?item_no=${item.item_no}"><img src="/img/${item.item_imgmain}"></a></td>
	<td><a href="/main/itemContent?item_no=${item.item_no}"><c:out value="${item.item_name}" /></a></td>
	<td><c:out value="${item.item_price}" /></td>
	<td><c:out value="${item.item_star}" /></td>
	<td><c:out value="${item.item_disc}" /></td>
	<td><c:out value="${item.item_catemain}" /></td>
	<td><c:out value="${item.item_catesub}" /></td>
	
</tr>

</c:forEach>	
	</table>
	
	
	<div role="tabpanel">
<ul class="nav nav-tabs font-alt" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#s">상품삭제</a>
  </li>
    <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#t">소분류 변경</a>
  </li>


</ul>
<div class="tab-content">

<div class="tab-pane fade in active" id="s">
<div class="form-group">
<input id="item_no" name="item_no" class="form-control" type="text" style="width:500px;height:50px;" placeholder="삭제 할 상품번호" />
</div>	
<div class="form-group" >
<button id="deleteItem" class="btn btn-primary " type="submit" style="float: right;">삭제</button>
</div>	
</form>		
</div>

<div class="tab-pane fade" id="t">
<form action="itemCateChange" method="post">
<h3> 상품번호 입력 </h3>
<input type="text" id="item_no" name="item_no" class="form-control" placeholder="바꿀 상품 번호 입력"><br>
			<select class="form-control" name="item_catesub"
											id="item_catesub" title="상품 소분류">
											<option value="jumper">Jumper</option>
											<option value="coat">Coat</option>
											<option value="jacket">Jacket</option>
											<option value="padding">Padding</option>
											<option value="shirts">Shirts</option>
											<option value="knit">Knit</option>
											<option value="halftee">1/2 Tee</option>
											<option value="long">Long</option>
											<option value="pants">Pants</option>
											<option value="denim">Denim</option>
											<option value="halfpants">1/2 Pants</option>
											<option value="jogger">jogger</option>
											<option value="sult">sult</option>
											<option value="boots">Boots</option>
											<option value="sneakers">Sneakers</option>
											<option value="walker">walker</option>
											<option value="derby">derby</option>
											<option value="sandal">sandal & slipper</option>

										</select>
<button id="memberstop" class="btn btn-primary " type="submit" style="float: right;">변경</button>
</form>
	</div>



	
	
		</div>
			</div>
	
	
	
	
	






      			    </div>
      			    
    			    </section>
    			   
        </div>
<%@include file="../include/footer.jsp"%>