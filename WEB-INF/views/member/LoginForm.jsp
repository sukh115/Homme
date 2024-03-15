<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
if( ${msg != null}){
	
	alert('${msg}');
};

$(document).ready(function(){
	
	var formObj = $("form[name='loginForm']");
	
	$("#loginBtn").on("click", function(){
		formObj.attr("action", "/member/Login");
		formObj.attr("method", "post");
		formObj.submit();
	});
	
	$("#register").on("click", function(){
	location.href="/member/RegisterForm";
	});
	
});

</script>
<style>
.src {
    width: auto; height: auto;
    max-width: 200px;
    max-height: 50px;
}
</style>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->
     <div class="main">
        <section class="module bg-dark" style="position: relative; top: 100px;" data-background="/resources/assets/images/background/armany.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3" >
                <h1 class="module-title font-alt">Login-Register</h1>
              </div>
            </div>
          </div>
        </section>
        </div>
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3 mb-sm-40">
                <h2 class="font-alt">Login</h2>
                <hr class="divider-w mt-10 mb-20">
                <form class="form" method="post" action="/member/Login" name="loginForm">
                  <div class="form-group">
                    <input class="form-control input-lg well" id="MEM_ID" type="text" name="MEM_ID" placeholder="ID"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control input-lg well" id="MEM_PW" type="password" name="MEM_PW" placeholder="PASSWORD"/>
                  </div>
                  <div>
                  <label style = " font-size:1.4em;">Keep me signed in</label>
                  <input type="checkbox"   name="useCookie" style="zoom:1.4"/>
                  </div>
                  <br/>
                  <div class="form-group">
                    <button class="btn btn-round btn-b" type="button" id="loginBtn" >Login</button>
                    <button class="btn btn-round btn-b" type="button" id="register">Sing-up</button>
                  </div>
                  <div class="form-group" style=" font-size: 1.3em;"><a href="/member/userSearch">Forgot ID?</a></div>
                  <div class="form-group" style=" font-size: 1.3em;"><a href="/member/findPwView">Forgot PASSWORD?</a></div>
                   <a href="${naver_url}"><img src="/resources/assets/images/login/btnW_official.png" style="float:left; margin:0 auto; width :227.5; height:50;"></a>
<div id="google_id_login"><a href="${google_url}"><img src="/resources/assets/images/login/btn_google_signin_light_normal_web@2x.png" style="float:left;  margin:0 auto; width : 229.5; height :50;"></a></div>
                </form>
              </div>
              </div>
              </div>
           </section>
    </main>
<!-- footer 입니다 -->
<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->