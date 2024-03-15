<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
if( ${msg != null}){
	
	alert('${msg}');
};
		$(document).ready(function(){
			$("#submit").on("click", function(){
				console.log("버튼클릭");
				if($.trim($("#newPW").val()) != $.trim($("#MEM_PWa").val())){
					toastr.error("새 비밀번호가 일치하지 않습니다.");
					$("#newPW").focus();
					return false;
				}if($.trim($("#newPW").val())==""){
					toastr.warning("새 비밀번호를 입력해주세요.");
					$("#newPW").focus();
					return false;
				}if($.trim($("#MEM_PWa").val())==""){
					toastr.warning("새 비밀번호 확인란을  입력해주세요.");
					$("#MEM_PWa").focus();
					return false;
				}
				
				if(confirm("변경하시겠습니까?")){
				
				changePW();
				}
				
				return false;		
				
				

				});
			})
			
			function changePW(){
			var insertMemPw = document.getElementById("MEM_PW");
			var insertNewPw = document.getElementById("newPW");
			var MEM_PW = insertMemPw.value;
			var newPW = insertNewPw.value;
			$.ajax({
				url : "/member/changePw",
				type : "POST",
				dateType : "json",
				data : {"MEM_PW" : MEM_PW , "newPW": newPW},
				success: function(data){
					if(data = 1){
						toastr.success("변경완료");
				   location.href="/member/LoginForm";
				   
					}else if(data = 2){
						toastr.warning("패스워드가 틀렸습니다.");
					}
				}
			})
		}
		
</script>
<main>
    <div class="main">
        <section class="module">
                     <%@include file="../include/mypageSidebar.jsp"%>
                   <div class="col-sm-8 col-sm-offset-10 mb-sm-10" style="float: none; margin:0 auto;" align="center">
                    <h1 class="font-alt" align="center" style="margin-top: -30; padding-bottom: 0px; margin-top: 0px; margin-bottom: 0px;" >Change Password</h1>
                <form class="form" method="post" id="changePw" style="float: center;">
                  <h5 style="margin-right: 442px;">CURRENT PASSWORD</h5>
                  <div class="form-group">
                    <input class="form-control input-lg well" id="MEM_PW" type="password" name="MEM_PW" placeholder="current password" style="width: 600px;"/>
                  </div>
                  <div class="form-group">
                    <h5 style="margin-right: 473px;">NEW PASSWORD</h5>
                    <input class="form-control input-lg well" id="newPW" type="password" name="newPW" placeholder="NEW Password" required="required" style="width: 600px;">
                  </div>
                  <div class="form-group">
                    <h5 style="margin-right: 407px;">CONFIRM NEW PASSWORD</h5>
                    <input class="form-control input-lg well" id="MEM_PWa" type="password" name="MEM_PWa" placeholder="CONFIRM NEW Password" required="required" style="width: 600px;">
                  </div>
                  <div class="form-group">
                    <button class="btn btn-block btn-round btn-b" type="button" id="submit" style="width: 600px;">Change Your Password</button>
                  </div>
          </form>
                  </div>
        </section>
            </div>
    </main>
<!-- footer 입니다 -->
<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->