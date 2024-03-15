<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>




<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateview");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			
			// 취소
			$(".boardlist_btn").on("click", function(){
				
				location.href = "/board/boardlist";
			})
			
		})
	</script>
<script>
		//삭제
		function del(b_no) {
			var deleteYN = confirm("삭제하시겠습니까?");
			if (deleteYN) {
					location.href='delete?b_no='+b_no;
			}
		}

</script>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->
<div class="main">
	<section class="module bg-dark-30 about-page-header"
		data-background="/resourced/assets/images/about_bg.jpg">
		<div id="root" class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h1 class="module-title font-alt mb-0">
					<c:if test="${scri.cate==null}">total</c:if>
					<c:if test="${scri.cate==1}">NOTICE</c:if>
					<c:if test="${scri.cate==2}">Q&A</c:if>
					<c:if test="${scri.cate==3}">F&Q</c:if>
					<c:if test="${scri.cate==4}">ENVENT</c:if>
					</h1>
				</div>
			</div>
		</div>
	</section>

	<div class="card-header py-3" align="right">

	</div>

	<section id="container">

<form name="readForm" role="form" method="get" style="margin-bottom: 100px;" action="/board/boardinsert">

			<table class="table" style=" width: 70%; height: 100px; margin: 0 auto; text-align: center;">
				<tr style="text-align:center; height:50px;" class="bg-dark">
					<th style=text-align:center>번호</th>
					<th style=text-align:center>제목</th>
					<th style=text-align:center>작성자</th>
					<th style=text-align:center>등록일</th>
					<th style="width:10%; text-align:center;">조회수</th>
					<th style=text-align:center>삭제</th>
				</tr>
				<c:forEach items="${boardnotice}" var="boardnotice">
									<tr>
						<td width="50" align="center"><strong><c:out
								value="${boardnotice.b_no}" /></strong></td>
						<td width="200" align="center"><a
							href="/board/boardview?b_no=${boardnotice.b_no}">
                  		<strong><c:out value="${boardnotice.b_title}" /></strong></a></td>
						<td width="100" align="center">
						<strong><c:if test="${boardnotice.b_writer == '1234'}">
								Admin
								</c:if>
								<c:if test="${boardnotice.b_writer != '1234'}">
								${boardnotice.b_writer}
								</c:if>
						</strong>
						</td>
						<td width="100" align="center">
						<strong><fmt:formatDate value="${boardnotice.b_date}" pattern="yyyy-MM-dd" /></strong></td>
						<td><strong><c:out value="${boardnotice.b_hit}" /></strong></td>
						<td width="50" align="center">
						<!-- <td width="50" align ="center"><button type="submit" class="delete_btn">삭제</button></td> -->
					</tr>

				</c:forEach>
				<c:forEach items="${boardlist}" var="boardlist">
					<tr>
						<td width="50" align="center"><c:out
								value="${boardlist.b_no}" /></td>
						<td width="200" align="center"><a
							href="/board/boardview?b_no=${boardlist.b_no}&
                  									  page=${scri.page}&
                  									  perPageNum=${scri.perPageNum}&
                  									  searchType=${scri.searchType}&
                  									  keyword=${scri.keyword}&
                  									  cate=${scri.cate}">
                  		<c:out value="${boardlist.b_title}" /></a></td>
						<td width="100" align="center">
						<c:if test="${boardlist.b_writer == '1234'}">
								Admin
						</c:if>
						<c:if test="${boardlist.b_writer != '1234'}">
								${boardlist.b_writer}
						</c:if>
						</td>
						<td width="100" align="center">
						<fmt:formatDate value="${boardlist.b_date}" pattern="yyyy-MM-dd" /></td>
						<td>
						<c:out value="${boardlist.b_hit}"></c:out> </td>
						<td width="50" align="center">
						<c:if test="${member.MEM_ID == boardlist.b_writer}" >
						<input class="btn btn-default btn-round" style="color:#337ab7;" type="button" value="삭제" onclick="del(${boardlist.b_no})">
						</c:if>
						</td>
						
						<!-- <td width="50" align ="center"><button type="submit" class="delete_btn">삭제</button></td> -->
					</tr>
				</c:forEach>
			</table>
			<div align="center" >
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a
							href="boardlist${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li><a href="boardlist${pageMaker.makeSearch(idx)}">${idx}</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="boardlist${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
         	<div class="row" style="position: absolute; bottom:2%; left:18%;">
	<ul class="pagination">
	        <li class="dropdown" style="font-size:13px;"><a  class="dropdown-toggle" href="#"  data-toggle="dropdown">Community</a>
            <ul class="dropdown-menu" style="font-size:15px;">
              <li class="dropdown"><a href="/board/boardlist?page=1&perPageNum=10&sort=b_no&searchType=${scri.searchType}&keyword=${scri.keyword}&cate=${scri.cate}">번호순</a></li>
              <li class="dropdown"><a href="/board/boardlist?page=1&perPageNum=10&sort=b_hit&searchType=${scri.searchType}&keyword=${scri.keyword}&cate=${scri.cate}">조회순</a></li>
              <li class="dropdown"><a href="/board/boardlist?page=1&perPageNum=10&sort=b_hit&searchType=${scri.searchType}&keyword=${scri.keyword}&cate=${scri.cate}">최신순</a></li>
              </ul>
              </ul>
	</div>
               <div style="position: absolute; bottom:5%; right:18%;">
               <a href="/board/boardiview" role="button "
                  class="btn btn-default btn-round" style="color:#337ab7;" >글 작성</a>
            </div>
							<div class="container">
			<div class="row">
			
			<div class="col-sm-1 col-sm-offset-2" >
				<select class="form-control" name="searchType" style="width: 100px;">
					<option value="n"
						<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					<option value="t"
						<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					<option value="c"
						<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					<option value="w"
						<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					<option value="tc"
						<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				</select> 
				</div>
				<div class="col-sm-1" style="width: 550px; padding-right: 0px;">
				<input class="form-control" type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />
				</div>
				<button id="searchBtn" class="form-control" type="button" style="width: 150px;"><i class="fa fa-search"></i>검색</button>
				</div>
				<script>
      				$(function(){
        			$('#searchBtn').click(function() {
          			self.location = "boardlist" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        				});
      					});   
    				</script>
				</div>
		</form>
	</section>
</div>
<!-- footer 입니다 -->

<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->