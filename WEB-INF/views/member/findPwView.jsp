<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	

	if( ${msg != null}){
		
		alert('${msg}');
	};
</script>
     <div class="main">
        <section class="module bg-dark-30" data-background="assets/images/section-4.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt mb-0">Login-Register</h1>
              </div>
            </div>
          </div>
        </section>
        </div>
        <section class="module" style="padding-top: 40px;">
          <div class="container">
            <div class="row">
              <div class="col-sm-5 col-sm-offset-1 mb-sm-40" style="float: none; margin:0 auto;">
                <h2 class="font-alt">Forgot your PASSWORD?</h2>
                <hr class="divider-w mb-10">
                <form class="form" action="/member/findPw" method="post">
                  <div class="form-group">
                    <input class="form-control input-lg well" id="MEM_ID" type="text" name="MEM_ID" placeholder="ID"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control input-lg well" id="MEM_EMAIL" type="email" name="MEM_EMAIL" placeholder="EMAIL" required="required">
                  </div>
                  <div class="form-group">
                    <button class="btn btn-block btn-round btn-b" type="submit" name="findPw">FIND</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
    </main>


<!-- footer 입니다 -->
<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->