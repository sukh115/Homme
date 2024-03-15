<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
//				document.getElementById('join_zip1').value = data.postcode1;
//				document.getElementById('join_zip2').value = data.postcode2;
				document.getElementById('MEM_POST').value = data.zonecode;
				document.getElementById('MEM_ADR').value = data.address;
			}
		}).open();
	}
</script>
<script type="text/javascript">
		$(document).ready(function(){
			$("#submit").on("click", function(){
				if($.trim($("#MEM_PW").val())==""){
					toastr.warning("비밀번호를 입력해주세요.");
					$("#MEM_PW").focus();
					return false;
				}
				if($.trim($("#MEM_NAME").val())==""){
					toastr.warning("성명을 입력해주세요.");
					$("#MEM_NAME").focus();
					return false;
				}
				if($.trim($("#MEM_POST").val())==""){
					toastr.warning("우편번호를 입력해주세요.");
					$("#MEM_post").focus();
					return false;
				}
				if($.trim($("#MEM_ADR").val())==""){
					toastr.warning("주소를 입력해주세요.");
					$("#MEM_ADR").focus();
					return false;
				}
				if($.trim($("#MEM_TEL").val())==""){
					toastr.warning("휴대전화를 입력해주세요.");
					$("#MEM_TEL").focus();
					return false;
				}
				if($.trim($("#MEM_EMAIL").val())==""){
					toastr.warning("이메일을 입력해주세요.");
					$("#MEM_EMAIL").focus();
					return false;
				}
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#memberUpdate").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(toastr.confirm("회원수정하시겠습니까?")){
									console.log("submit 호출");
								var formdata = $("#memberUpdate").serialize(); 
								$.post("/member/memberUpdate", formdata , function(d){
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
                    <h1 class="font-alt" align="center" style="margin-top: -30; padding-bottom: 0px; margin-top: 0px; margin-bottom: 0px;" >Edit Profile</h1>
                   <form class="form" method="post" id="memberUpdate" style="float: center;">
                   <h5 style="margin-right: 565px;">ID</h5>
                      <input class="form-control input-lg well" id="MEM_ID" type="text" name="MEM_ID" value="${member.MEM_ID}" style="width: 600px;"/>
                  <div class="form-group">
                  <h5 style="margin-right: 540px;">NAME</h5>
                    <input class="form-control input-lg well" id="MEM_NAME" type="text" name="MEM_NAME" value="${member.MEM_NAME}" style="width: 600px;"/>
                  </div>  
                  <h5 style="margin-right: 480px;">POST/ADDRESS</h5>
                  <div class="form-group" style="text-align: center;">
                    <input class="form-control input-lg well" id="MEM_POST" type="text" name="MEM_POST" value="${member.MEM_POST}" style="width: 400px;  margin-left: 220px; float: left;"/>
                    <button type="button" class="form-control" onclick="openDaumPostcode()" style="width: 200px; height:43px;"><i class="fa fa-search"></i> 우편번호 찾기</button>
                  </div>  
                  <div class="form-group">
                    <input class="form-control input-lg well" id="MEM_ADR" type="text" name="MEM_ADR" value="${member.MEM_ADR}"style="width: 600px;"/>
                  </div>  
                  <h5 style="margin-right: 540px;">PHONE</h5>
                  <div class="form-group">
                    <input class="form-control input-lg well" id="MEM_TEL" type="text" name="MEM_TEL" value="${member.MEM_TEL}"style="width: 600px;"/>
                  </div>
                  <h5 style="margin-right: 545px;">EMAIL</h5>
                  <div class="form-group">
                    <input class="form-control input-lg well" id="MEM_EMAIL" type="text" name="MEM_EMAIL" value="${member.MEM_EMAIL}" style="width: 600px; margin-left: 53px;"/>
                  </div>
                  <h5 style="margin-right: 460px;";">PASSWORD</h5>
                  <div class="form-group">
                    <input class="form-control input-lg well" id="MEM_PW" type="password" name="MEM_PW" placeholder="PASSWORD"style="width: 600px; margin-left: 53px;"/>
                  </div>  
                  <div class="form-group">
                    <button class="btn btn-block btn-round btn-b" type="button" id="submit" style="width: 600px; margin-left: 53px;">Update</button>
                  </div>
                </form>
                  </div>
        </section>
                  </div>
    </main>
 <!-- footer 입니다 -->
<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->