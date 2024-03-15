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
 				<h1 class="font-alt mb-0" align="center" style="margin-top: -20; margin-right:140px; padding-bottom: 52px;">1:1 Consultation</h1>
            <div class="row" style="margin-left: 130px;">
              <div class="col-sm-12">
                  <table class="table  ">
                  <tbody>
                    <tr >
                      <th width="8%" class="hidden-xs">Board</th>
                      <th width="40%">Title</th>
                      <th width="20%">Writer</th>
                      <th class="hidden-xs" width="18%">Date</th>
                    </tr>

                <c:forEach items="${consult}" var="consult">
                <input type="hidden" value="${consult.b_cate}">
                <tr>
                      <td style="vertical-align : middle;">
                        <h5 class="product-title font-alt">${consult.b_no}</h5>
                      </td>
                      <td style="vertical-align : middle;">
                        <h5 class="product-title font-alt"> <a href="/board/boardview?b_no=${consult.b_no}&cate=2">${consult.b_title}</a></h5>
                      </td>
                      <td style="vertical-align : middle;">
                        <h5 class="product-title font-alt">${consult.b_writer}</h5>
                      </td>
                      <td class="hidden-xs" style="vertical-align : middle">
                        <h5 class="product-title font-alt"><fmt:formatDate value="${consult.b_date}" pattern="yyyy-MM-dd" /> </h5>
                      </td>
                    </tr>
                    </c:forEach>
                    <div style="position: absolute; bottom: 0; right: 0;" >
                  <a href="/board/boardiview?cate=2" role="button " class="btn btn-b btn-round" style="margin-right: 15px;" >글 작성</a>
                    </div>
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