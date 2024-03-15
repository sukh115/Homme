<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->
	<style>
	.ck.ck-editor {
    	max-width: 1000px;
	}
	.ck-editor__editable {
	    min-height: 300px;
	}
	</style>
	<style>
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
.star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}

.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('./img/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}
ratingToPercent() {
      const score = +this.restaurant.averageScore * 20;
      return score + 1.5;
 }
</style>
        <section class="module bg-dark-30 about-page-header" data-background="/resourced/assets/images/about_bg.jpg">
          <div id="root" class="root">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt mb-0">상품 리뷰</h1>
              </div>
            </div>
          </div>
        </section>
<section id="container">
          <div class="container">
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
                <h4 class="font-alt mb-0">상품리뷰 작성</h4>
                <hr class="divider-w mt-10 mb-20">
                <form class="validation-form" role="form" method="post" action="/main/item_reply_write" enctype="multipart/form-data">
                <div class="form-group">
                 <input type="text" id="rpl_item_no" name="rpl_item_no" value="${item_no}" class="hidden"/>
                 <h3>${item_name}</h3>
                </div>
				<div class="form-group">
                  <label for="rpl_writer">작성자</label><input class="form-control input-lg" name="rpl_mem_id" id="rpl_mem_id" type="text" placeholder="이름을 입력해 주세요" value="${member.MEM_ID}" required readonly="readonly"/>
				</div>
										<div class="star-rating space-x-4 mx-auto">
										<input type="radio" id="5-stars" name="rpl_star" value="5" v-model="ratings"/>
										<label for="5-stars" class="star pr-4">★</label>
										<input type="radio" id="4-stars" name="rpl_star" value="4" v-model="ratings"/>
										<label for="4-stars" class="star">★</label>
										<input type="radio" id="3-stars" name="rpl_star" value="3" v-model="ratings"/>
										<label for="3-stars" class="star">★</label>
										<input type="radio" id="2-stars" name="rpl_star" value="2" v-model="ratings"/>
										<label for="2-stars" class="star">★</label>

										<input type="radio" id="1-star" name="rpl_star" value="1" v-model="ratings" />
										<label for="1-star" class="star">★</label>
										</div>
				<div class="form-group">
				사진<input class="form-control input-lg" type="file" name="rpl_mainimg" id="rpl_mainimg">
				</div>
				<div class="form-group">
                  <textarea class="form-control" class="ckeditor" id="ckeditor" name="rpl_content" rows="20" cols="100" style="width: %; height:500px;"required>
                  </textarea>    
				</div>
                  <script>
             	 ClassicEditor
					.create( document.querySelector( '#ckeditor' ) ,{
						ckfinder: {
							uploadUrl: '/board/uploadImg',
						}
					})
					
					.catch( error => {
						console.error( error );
							   } );
//                  CKEDITOR.instances.b_content.getData();
                  </script>
                <div class="form-group">
                    <button class="form-control" id="writebtn" name="writebtn" type="submit">작성</button>

          
                  </div>
                </form>
              </div>
            </div>
            </div>
        </section>

<!-- 		<script type="text/javascript">
        	var oEditors = [];
		$(document).ready(function(){
        	
        	nhn.husky.EZCreator.createInIFrame({
        		  oAppRef : oEditors,
        		  elPlaceHolder : "b_content",
        		  sSkinURI : "/resources/smartEditor/SmartEditor2Skin.html",
        		  fCreator : "createSEditor2",
        		  htParams : {
        			// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
        			bUseToolbar : true, 
        			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
        			bUseVerticalResizer : true, 
        			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
        			bUseModeChanger : true,
        			
        		  }
        	});
		})
        </script>
        <script type="text/javascript">
        window.onload =function(){
        	var btn =document.getElementById("writebtn");
        	btn.onclick = function(){
        		submitContents(btn);
        	}
        }
        function submitContents(elClickedObj) 	{
        	oEditors.getById["b_content"].exec("UPDATE_CONTENTS_FIELD", []);
        	
        	try {
        		elClickedObj.form.submit();
        	} catch(e){
        		
        	}
        }
        </script> -->
	<!-- footer 입니다 -->
	<%@include file="../include/footer.jsp"%>
	<!-- footer 입니다 -->