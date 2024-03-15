<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->

<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='readForm']");
	
	// 수정 
	$(".update_btn").on("click", function(){
		formObj.attr("action", "/board/updateview");
		formObj.attr("method", "get");
		formObj.submit();				
	})
    // 목록
	$("#boardlist_btn").on("click", function(){

	location.href = "/board/boardlist?page=${scri.page}"
	+"&perPageNum=${scri.perPageNum}"
	+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
	}) 
	//댓글 작성
	$("#replyWriteBtn").on("click", function(){
		  var formObj = $("form[name='replyForm']");
		  formObj.attr("action", "/board/replyWrite");
		  formObj.submit();
		});

//댓글 수정 View
	$(".replyUpdateBtn").on("click", function(){
		location.href = "/board/replyUpdateView?b_no=${boardview.b_no}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}"
						+ "&r_no="+$(this).attr("data-r_no");
	});
/* 		//댓글삭제
 		$(".replyDeleteBtn").on("click", function(){
		location.href = "/board/replyDeleteView?b_no=${boardview.b_no}"
			+ "&page=${scri.page}"
			+ "&perPageNum=${scri.perPageNum}"
			+ "&searchType=${scri.searchType}"
			+ "&keyword=${scri.keyword}"
			+ "&r_no="+$(this).attr("data-r_no");
	});  */
}) 
</script>
<script>
 		function replydel(r_no) {
			var deleteYN = confirm("삭제하시겠습니까?");
			if (deleteYN) {
					location.href='replyDelete?b_no'+"b_no"

			}
		}

</script>
<main>
<section class="module" style="padding-bottom: 0px;">
 <%@include file="../include/boardpageSidebar.jsp"%>
  <div class="col-sm-8 col-sm-offset-10 mb-sm-10" style="float: none; margin:0 auto;" align="center">
                    <h1 class="font-alt" align="center" style="margin-top: -30; padding-bottom: 0px; margin-top: 0px; margin-bottom: 0px;" >Written Post</h1>
<form name="readForm" role="form" method="post">
  <input type="hidden" id="b_no" name="b_no" value="${boardview.b_no}" />
  <input type="hidden" id="page" name="page" value="${scri.page}"> 
  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
  <input type="hidden" id="cate" name="cate" value="${scri.cate}"> 
</form>
                <c:if test ="${member.MEM_ID == boardview.b_writer}">
         	    </c:if>
<div class="col-sm-8 col-sm-offset-10 mb-sm-10" style="float: none; margin:0 auto;">
               <form class="form" >
                  <div class="form-group">
                 <h5 style="margin-right: 450px; font-weight: bold">제목 &nbsp DATE : <fmt:formatDate value="${boardview.b_date}" pattern="yy/MM/dd"/></h5>
                    <input class="form-control" type="text" name="b_title" id="b_title" value="${boardview.b_title}" readonly="readonly" style="width: 600px;"/>
                  </div>  
                  <div class="form-group">
                  <h5 style="margin-right: 550px; font-weight: bold">작성자 </h5>
                    <input class="form-control" type="text" name="b_writer" id="b_writer" value="${boardview.b_writer}" readonly="readonly" style="width: 600px;"/>
                  </div>  
                  <div>
                  <h5 style="margin-right: 565px; font-weight: bold">내용</h5>
                 	${boardview.b_content}
                  </div> 
                </form>
                </div>
                <br>
                
                <h3 class="comment-form-title font-alt">Add review</h3>
                <div class="col-sm-10 col-sm-offset-6 mb-sm-8" style="float: none; margin:0 auto;">
                <form name="replyForm" method="post" class="form">
              <input type="hidden" id="b_no" name="b_no" value="${boardview.b_no}" />
              <input type="hidden" id="page" name="page" value="${scri.page}"> 
              <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
             <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
              <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
             <input type="hidden" id="cate" name="cate" value="${scri.cate}"> 
                        <div class="row">
                          <div class="col-sm-8">
                            <div class="form-group">
                              <label class="sr-only" for="name">댓글 작성자</label>
                              <input class="form-control" type="text" id="r_writer" name="r_writer" style="width: 300px;" placeholder="이름을 입력해 주세요." readonly value="${member.MEM_ID}" required />
                            </div>
                          </div>

                          <div class="col-sm-16">
                            <div class="form-group">
                              <input  type="text" class="form-control" id="r_content" name="r_content" style="width: 600px; height:100px;"  placeholder="내용을 입력해 주세요" required /></input>
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <button class="btn btn-round btn-default" type="button" id="replyWriteBtn" style="width: 145px;">Reply</button>
                          </div>
                        </div>
           </form>
           </div>
               <table class="table" style="width: 600px; text-align: center;">
                  <tbody>
                    <tr>
                      <th width="15%" class="hidden-xs"  style="text-align: center;">DATE</th>
                      <th width="15%"  style="text-align: center;">Name</th>
                      <th width="30%"  style="text-align: center;">CONTENT</th>
                      <th width="30%"  style="text-align: center;">OPTION</th>
                    </tr>
                    <c:forEach items="${replyList}" var="replyList">
					
                    <tr style="text-align: center;">
                      <td class="hidden-xs" height="5px"><fmt:formatDate value="${replyList.r_date}" pattern="yy/MM/dd" /></td>
                      <td style="vertical-align : middle;">
                        <h5 class="product-title font-alt">${replyList.r_writer}</h5>
                      </td>
                           <td style="vertical-align : middle">
                        <h5 class="product-title font-alt">${replyList.r_content}</h5>
                      </td>
                      <td>
                <c:if test ="${member.MEM_ID == boardview.b_writer}">
                      <a href="/board/replyUpdateView?r_no=${replyList.r_no}" role="button" class="btn btn-default btn-round" style="width: 30px; text-align:left">수정</a>
         		</c:if>
  <button type="button"  class="btn btn-default btn-round" onclick="replydel(${replyList.r_no})" style="width: 30px; text-align: center; ">삭제</button>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
  			
  			<div>
				<button type="button" id="boardlist_btn" class="btn pull-right" align="center">목록</button>
    </div>  
 	 			                 
			</form>
  </main>
        
	<!-- footer 입니다 -->
	<%@include file="../include/footer.jsp"%>
	<!-- footer 입니다 -->