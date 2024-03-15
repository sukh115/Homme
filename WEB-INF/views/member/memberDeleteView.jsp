<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->

<script type="text/javascript">
		$(document).ready(function(){
			$("#submit").on("click", function(){
				
				if($.trim($("#MEM_PW").val())==""){
					toastr.warning("비밀번호를 입력해주세요.");
					$("#MEM_PW").focus();
					return false;
				}
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#memberDelete").serializeArray(),
					success: function(data){
						if(data==true){
							if(confirm("회원삭제를 하시겠습니까?")){
								console.log("submit 호출");
								var formdata = $("#memberDelete").serialize(); 
								$.post("/member/memberDelete", formdata , function(d){
								location.href="/main/index";
								});		
							}
							
						}else{
							toastr.error("패스워드가 틀렸습니다.");
							return;
						}
					}
			})
		});
		})
</script>
<main>
    <div class="main">
        <section class="module">
                    <%@include file="../include/mypageSidebar.jsp"%>
                    <div class="col-sm-8 col-sm-offset-10 mb-sm-10" style="float: none; margin:0 auto;" align="center">
                    <h1 class="font-alt" align="center" style="margin-top: -30; padding-bottom: 0px; margin-top: 0px; margin-bottom: 0px;" >Resign Membership</h1>
                <form class="form" method="post" id="memberDelete" style="float: center;">
                  <h5 style="margin-right: 565px;">ID</h5>
                  <input class="form-control input-lg well" id="MEM_ID" type="text" name="MEM_ID" value="${member.MEM_ID}" readonly="readonly" style="width: 600px;"/>
                  <div class="form-group">
                  <h5 style="margin-right: 540px;">NAME</h5>
                    <input class="form-control input-lg well" id="MEM_NAME" type="text" name="MEM_NAME" value="${member.MEM_NAME}" readonly="readonly" style="width: 600px;"/>
                  </div>  
                  <div>
                  <h5 style="margin-right: 401px;">REASON FOR WITHDRAWAL</h5>
                  <textarea name="content"  id="content" rows="5" cols="40" class="form-control input-lg well" placeholder="Reason for withdrawal" style="width: 600px;"></textarea>
                  </div> 
                  <div class="form-group">
                  <h5 style="margin-right: 505px;">PASSWORD</h5>
                    <input class="form-control input-lg well" id="MEM_PW" type="text" name="MEM_PW" placeholder="PASSWORD" style="width: 600px;"/>
                  </div> 
                  <div class="form-group">
                    <button class="btn btn-block btn-round btn-b" type="button" id="submit" style="width: 600px; margin-left: 56px;">Delete</button>
               </div>
                </form>
                  </div>
        </section>
                </div>
    </main>
 <!-- footer 입니다 -->
<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->