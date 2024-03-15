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
<header>
		<h2>쿠폰관리</h2>
		</header>
	<form role="form" method="get">
			<table class="table"    >
	<tr>
	    <th scope="row">쿠폰 번호</th>
		<th scope="row">쿠폰 이름</th>
		<th scope="row">쿠폰 할인율</th>
		<th scope="row">쿠폰 만기일</th>	
	</tr>
<c:forEach var="cpn" items="${coulist }">
<tr>
	<td><b><c:out value="${cpn.cpn_no}" /></b></td>
	<td><b><c:out value="${cpn.cpn_name}" /></b></td>
	<td><b><c:out value="${cpn.cpn_disc}" /></b></td>
	
	<td>
	<fmt:formatDate pattern="yy-MM-dd" value="${cpn.cpn_edate}"/>
	</td>	
</tr>
</c:forEach>		
</table>
<div  class="cousearch">
	<select name="searchType">
	<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
	
	 <option value="couno"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>쿠폰 번호</option>
	 <option value="couname"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>쿠폰 할인율</option>
      <option value="coudisc"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>쿠폰 만기일</option>
      <option value="couedate"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>쿠폰 이름</option>
	</select>
	<span class="input-group-btn pull-right">
	<button id="searchBtn" type="button" class="btn btn-default pull-right"  >검색</button></span>
	 <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" style="width:500px;" class="pull-right form-control" />	 
    
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "clientManage" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
</div>
</form>

<hr/>

<h2>쿠폰발급</h2>
<form action="/master/newcoupon" method="post" style="text-align: center;">
<div class="form-group">
<input id="cpn_name" name="cpn_name" class="form-control" type="text" style="width:800px;height:30px; " placeholder="쿠폰명" />
  <input class="form-control" id="cpn_disc" name="cpn_disc" type="number" style="width:800px;height:30px; " placeholder="쿠폰 할인율"/>
  <input class="form-control" id="edate" name="edate" type="number" style="width:800px;height:30px;" placeholder="쿠폰 만기일(+일 수 )"/>
</div>
<button id = "createbtn" type="submit" class="btn btn-primary mb-3" style="float: middle;">생성</button>
</form>
	
<form action="deletecoupon" method="post" name="deletecoupon">
<div class="form-group">
<input id="cpn_name" name="cpn_no" class="form-control" type="text" style="width:800px;height:30px;" placeholder="삭제 할 쿠폰번호" />
</div>
<div class="form-group" style="text-align: center;">
<button id = "createbtn" type="submit" class="btn btn-primary mb-3" style="float: right;">삭제</button>
</div>
</form>
      			    </div>
      			    
    			    </section>
    			   
        </div>
<%@include file="../include/footer.jsp"%>