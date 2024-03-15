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
          <div class="container">
              <div class="col-sm-9  mb-sm-10" style="float: none; margin:0 auto;">
                <h1 class="font-alt mb-0" align="center" style="margin-top: -20; margin-right:30px; padding-bottom: 52px;">DEPOSIT/COUPON</h1>
                <div class="row multi-columns-row" style="height: 190px;">
                  <div class="col-sm-6 col-md-6 col-lg-6">
                    <div class="features-item">
                      <div class="features-icon"><i class="fa fa-fw">&#xf155;</i></div>
                      <h1 class="features-title font-alt">DEPOSIT</h1><span style="font-size: 15px;">₩ ${member.MEM_POINT}</span>
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-6">
                    <div class="features-item">
                      <div class="features-icon"><i class="fa fa-fw">&#xf145;</i></div>
                      <h2 class="features-title font-alt">COUPON</h2><span style="font-size: 15px;">${coupon}</span>
                    </div>
                  </div>
                </div>
                    <h4 class="font-alt mb-0">DEPOSIT/COUPON LIST</h4>
                
                    <div class="col-sm-12">
                   <table class="table" style="text-align: center;">
                  <tbody >
                    <tr style="text-align: center;">
                      <th style="text-align: center;" width="20%" class="hidden-xs">NO</th>
                      <th style="text-align: center;" width="50%">CONTENT</th>
                      <th style="text-align: center;"  width="30%">DATE</th>
                    </tr>
                    <c:forEach items="${history}" var="history">
                    <tr>
                      <td class="hidden-xs" height="5px">${history.history_no}</td>
                      <td style="vertical-align : middle;">
                        <h5 class="product-title font-alt">${history.history_content}</h5>
                      </td>
                      <td class="hidden-xs" style="vertical-align : middle">
                        <h5 class="product-title font-alt"> <fmt:formatDate value="${history.history_date}" pattern="yyyy-MM-dd" /> </h5>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
               
                  </div>
          </section>
          </div>
    </main>
<!-- footer 입니다 -->
<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->