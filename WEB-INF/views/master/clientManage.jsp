<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
var msg = "${aaa}";	
	if(msg != ''){
		alert(msg);
	}

});

</script>

<%@include file="../include/header.jsp"%>

     <div class="main">

        
            	
        <section class="module">
          <div class="container">
            <div class="row">
              
<%@include file="../include/masterSidebar.jsp"%>

              
              
              <div class="col-sm-9 col-sm-offset-1">
              <h2>고객관리</h2>
 <form role="form" method="get">
			<table class="table table-bordered table-sm" border="1" >
			<tr>
			<th style="width:6%">번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th style="width:10%">포인트</th>
			<th style="width:6%">랭크</th>
			<th style="width:10%">정지기간</th>
			</tr>
						
	<c:forEach items="${list}" var = "list">
			<tr>
				<td><c:out value="${list.MEM_NO}" /></td>
				<td width="50"><c:out value="${list.MEM_ID}" /></td>
				<td><c:out value="${list.MEM_NAME}" /></td>
				<td><c:out value="${list.MEM_EMAIL}" /></td>
				<td><c:out value="${list.MEM_TEL}"/></td>
				<td><c:out value="${list.MEM_ADR}"/></td>
				<td><c:out value="${list.MEM_POINT}"/></td>
				<td><c:out value="${list.MEM_RANK}"/></td>
				<td>
				<fmt:formatDate pattern="yy-MM-dd" value="${list.MEM_SECTIONTIME}"/>
				
				</td>
				
			</tr>
	</c:forEach>
						
	</table>
	
	
		<div class="col-sm-4">
	  <ul class="pagination">
    <c:if test="${pageMaker.prev}">
    	<a href="/master/clientManage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<a class="active" href="/master/clientManage${pageMaker.makeQuery(idx)}">${idx}</a>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<a href="/master/clientManage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
    </c:if> 
  </ul>
  </div>
	
	
	
	<div  class="search col-sm-6 col-sm-offset-2">
	<select name="searchType">
	<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
	
	 <option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>회원번호</option>
	 <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>아이디</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>이름</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>이메일</option>
      <option value="j"<c:out value="${scri.searchType eq 'j' ? 'selected' : ''}"/>>전화번호</option>
      <option value="k"<c:out value="${scri.searchType eq 'k' ? 'selected' : ''}"/>>주소</option>
      <option value="p"<c:out value="${scri.searchType eq 'p' ? 'selected' : ''}"/>>포인트</option>
      <option value="r"<c:out value="${scri.searchType eq 'r' ? 'selected' : ''}"/>>랭크</option>
	</select>
	<span class="input-group-btn pull-right">
	<button id="searchBtn" type="button" class="btn btn-default pull-right"  >검색</button></span>
	 <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" style="width:300px;" class="pull-right form-control" />	 
    
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "clientManage" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
	</div>
</form>


<div class="col-sm-12 mt-30">
<h4 class="font-alt mb-0">회원관리</h4>
<hr class="divider-w mt-10 mb-20">
<div role="tabpanel">
<ul class="nav nav-tabs font-alt" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#s">회원 정지</a>
  </li>
    <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#t">회원 정지해제</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#d">회원 탈퇴</a>
  </li>
    <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#p">회원 적립금</a>
  </li>

</ul>
<div class="tab-content">

<div class="tab-pane fade in active" id="s">
<form action="disableMember" method="post">
<div class=" form-group">
<h3> 아이디 입력 </h3>
<input type="text" id="memberId" name="memberId" class="form-control" placeholder="정지할 아이디 입력"><br>
<select name ="sectiontime">
<option value="1">1일</option>
<option value="7">7일</option>
<option value="30">30일</option>
<option value="100">100일</option>
</select>
</div>
<button id="memberstop" class="btn btn-primary " type="submit" style="float: right;">정지</button>
</form>
</div>

<div class="tab-pane fade" id="t">
<form action="disableCancel" method="post">
<h3> 아이디 입력 </h3>
<input type="text" id="memberId" name="memberId" class="form-control" placeholder="정지해제 아이디 입력"><br>
<button id="memberstop" class="btn btn-primary " type="submit" style="float: right;">정지해제</button>
</form>
	</div>



<div class="tab-pane fade" id="d">
<form action="deleteClient" method="post">
<h3> 아이디 입력 </h3>
<input type="text" id="memberId" name="memberId" class="form-control" placeholder="탈퇴시킬 아이디 입력"><br>
<button id="memberstop" class="btn btn-primary " type="submit" style="float: right;">탈퇴</button>
</form>
	</div>
	
	<div class="tab-pane fade" id="p">
<form action="/master/pointInsert" method="post">
<h3> 아이디 입력 </h3>
<input type="text" id="mem" name="mem_id" class="form-control" placeholder="조정 할 아이디 입력"><br>
<h3> 적립금 입력 </h3>
<input type="number" id="memberPoint" name="mem_point" class="form-control" placeholder="적립금 조정 (감소 시 -)"><br>
<button class="btn btn-primary " type="submit" style="float: right;">적용</button>
</form>
	</div>
	
	
		</div>
			</div>

</div>

</div>
</section>

    			   
        </div>
<%@include file="../include/footer.jsp"%>