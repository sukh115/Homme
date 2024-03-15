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
              <h2 >게시판관리</h2>
               		<form role="form" method="get" action="/master">
			<table class="table table-bordered table-sm" >
			<tr><th>글번호</th><th>제목</th><th>작성자</th><th>카테고리</th><th>조회수</th><th>공지사항 등록</th></tr>
	<c:forEach items="${nlist}" var = "list">
	<tr>
				<td><c:out value="${list.b_no}" /></td>
				<td><c:out value="[공지] ${list.b_title}"  /></td>
				<td><c:out value="${list.b_writer}" /></td>
				<td><c:out value="${list.b_cate}" /></td>
				<td><c:out value="${list.b_hit}" /></td>
				<td><input type="button" onclick="location.href='/master/down?boardNo=${list.b_no}'" value="공지사항 해제"></td>
	</tr>	
	</c:forEach>	 			
	<c:forEach items="${list2}" var = "list">
			<tr>
				<td><a href="http://localhost/board/boardview?b_no=${list.b_no }"><c:out value="${list.b_no}" /></a></td>
				<td><a href="http://localhost/board/boardview?b_no=${list.b_no }"><c:out value="${list.b_title}" /></a></td>
				<td><c:out value="${list.b_writer}" /></td>
				<td><c:out value="${list.b_cate}" /></td>
				<td><c:out value="${list.b_hit}" /></td>
				<c:if test="${list.b_cate == 3}">
				<td><input type="button" onclick="location.href='/master/notice?boardNo=${list.b_no}'" value="공지사항 설정"></td>
				</c:if>
			</tr>
	</c:forEach>
						
	</table>
	
	
		    <div>
  <ul class="pagination">
    <c:if test="${pageMaker.prev}">
    	<li><a href="/master/boardManage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a class="active" href="/master/boardManage${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="/master/boardManage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
  </div>
	
	
	
	<div class="search2">
	<select name="searchType">
	<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
	 <option value="a"<c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>글번호</option>
      <option value="b"<c:out value="${scri.searchType eq 'b' ? 'selected' : ''}"/>>제목</option>
      <option value="d"<c:out value="${scri.searchType eq 'd' ? 'selected' : ''}"/>>작성자</option>
      <option value="cate"<c:out value="${scri.searchType eq 'cate' ? 'selected' : ''}"/>>카테고리</option>
      <option value="hit"<c:out value="${scri.searchType eq 'hit' ? 'selected' : ''}"/>>조회수</option>
      
	</select>
	<span class="input-group-btn pull-right">
	<button id="searchBtn" type="button" class="btn btn-default pull-right"  >검색</button></span>
	 <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" style="width:500px;" class="pull-right form-control" />	 
    
    <script>

     
        $('#searchBtn').click(function() {
        	console.log("검색");
          self.location = "boardManage" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      
    </script>
	</div>
</form>
               <h4 class="font-alt mb-0">게시판 관리</h4>
<hr class="divider-w mt-10 mb-20">
<div role="tabpanel">
<ul class="nav nav-tabs font-alt" role="tablist">
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#x">게시글 삭제</a>
  </li>
</ul>
<div class="tab-content">
<div class="tab-pane fade active in" id="x">
<form action="deleteBoard" method="post">
<input type="text" id="boardNo" name="boardNo" class="form-control" placeholder="삭제시킬 게시판 번호"><br>
<button id="deleteboard" class="btn btn-primary " type="submit" style="float: right;">삭제</button>
</form>
			</div>
              </div>
      		      </div>
      			    </div>
      			    
    			    </section>
    			   
        </div>
<%@include file="../include/footer.jsp"%>