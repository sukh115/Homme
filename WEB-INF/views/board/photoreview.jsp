<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

<div class="main">
        <section class="module">
           <%@include file="../include/mypageSidebar.jsp"%>
                    	<div class="col-sm-9  mb-sm-10" style="float: none; margin:0 auto;">
 				<h1 class="font-alt mb-0" align="center" style="margin-top: -20; margin-right:140px; padding-bottom: 52px;">Review List</h1>
            <div class="row post-masonry post-columns" style="margin-left: 130px;">
                <c:forEach items="${photoreview}" var = "photoreview">
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post">
                  <div class="post-thumbnail"><img src="/img/${photoreview.rpl_img}" alt="Blog-post Thumbnail"/></div>
                  <div class="post-header font-alt">
                    <c:if test="${photoreview.rpl_star == null}"> 
												<span><i class="fa fa-star star-off"></i></span>
												<span><i class="fa fa-star star-off"></i></span>
												<span><i class="fa fa-star star-off"></i></span>
												<span><i class="fa fa-star star-off"></i></span>
												<span><i class="fa fa-star star-off"></i></span>										
										</c:if>
										<c:if test="${photoreview.rpl_star == 1}">
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star-off"></i></span>
												<span><i class="fa fa-star star-off"></i></span>
												<span><i class="fa fa-star star-off"></i></span>
												<span><i class="fa fa-star star-off"></i></span>																				
										</c:if>
										<c:if test="${photoreview.rpl_star == 2}">
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star-off"></i></span>
												<span><i class="fa fa-star star-off"></i></span>
												<span><i class="fa fa-star star-off"></i></span>																				
										</c:if>
										<c:if test="${photoreview.rpl_star == 3}">
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star-off"></i></span>
												<span><i class="fa fa-star star-off"></i></span>																				
										</c:if>
										<c:if test="${photoreview.rpl_star == 4}">
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star-off"></i></span>																				
										</c:if>										
										<c:if test="${photoreview.rpl_star == 5}">
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star"></i></span>
												<span><i class="fa fa-star star"></i></span>																				
										</c:if>										

                    <div class="post-meta">By&nbsp;${photoreview.rpl_mem_id}&nbsp;| <fmt:formatDate value="${photoreview.rpl_date}" pattern="yy-MM-dd" />
                    </div>
                  </div>
                  <div class="post-entry">
                    <p>${photoreview.rpl_content}</p>
                  </div>
                </div>
              </div>

                </c:forEach>
            </div>
            </div>
          <div class="pagination font-alt" style="position: absolute; right: 44%;">
          <a href="#"><i class="fa fa-angle-left"></i></a>
          <a class="active" href="#">1</a>
          <a href="#">2</a>
          <a href="#">3</a>
          <a href="#">4</a><a href="#">
          <i class="fa fa-angle-right"></i></a></div>
          </div> 
        </section>
          </div>
          


              <%-- <div class="row">
              <div class="col-sm-12">
     <div class="pagination font-alt">
  
    <c:if test="${ReviewPageMaker.prev}">
    <a href="/board/photoreview${ReviewPageMaker.makeQuery(pageMaker.startPage - 1)}"><i class="fa fa-angle-left"></i></a>
    </c:if> 

    <c:forEach begin="${ReviewPageMaker.startPage}" end="${ReviewPageMaker.endPage}" var="idx">
    	<a class="active" href="/board/photoreview${ReviewPageMaker.makeQuery(idx)}">${idx}</a>
    </c:forEach>

    <c:if test="${ReviewPageMaker.next && ReviewPageMaker.endPage > 0}">
    	<a href="/board/photoreview${ReviewPageMaker.makeQuery(pageMaker.endPage + 1)}"><i class="fa fa-angle-right"></i></a>
    </c:if> 

</div>
</div>
</div>  --%>

      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
	<%@include file="../include/footer.jsp"%>
	<!-- footer 입니다 -->