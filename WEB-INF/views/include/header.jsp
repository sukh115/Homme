<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Homme</title>
    
    <!-- http://localhost/layoutEx 접속주소 -->


    <link rel="apple-touch-icon" sizes="57x57" href="/resources/assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/resources/assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/resources/assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/resources/assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/resources/assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/resources/assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/resources/assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/resources/assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!-- Default stylesheets-->
    <link href="/resources/assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="/resources/assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="/resources/assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="/resources/assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="/resources/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="/resources/assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="/resources/assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <link href="/resources/assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="/resources/assets/css/colors/default.css" rel="stylesheet">
    <!-- toastr css 라이브러리 -->
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- toastr js 라이브러리 -->
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

  </head>
  
  <script>
  
  
  $(document).ready(function(){
	  cartHeaderView();
	  connectWs();
	  $('.dropdown-menu li#aaa').click(function(e) {
		    e.stopPropagation();
		})
	  
	  $('.dropdown-menu li#cartHeaderIcon').click(function(e) {
		    e.stopPropagation();
		})

	  
	  })
  
  function cartHeaderView(){
	  
		$.ajax({
			url : "/main/cartHeaderView",
			type : "get",
			dataType : "json",
			success : function(list){
			var s ='';
			var headersum = 0 ;
			if(list<1){
				s += '<div style="text-align:center"><h3>쇼핑백이 비었습니다</h3></div>' ;
			}
			
			$.each(list, function(key,value){
				var item_price = parseInt(value.itemVO.item_price);
				var price = new Intl.NumberFormat('ko-KR', {
					style : 'currency',
					currency : 'KRW'
				}).format(item_price);
				
				var cart_no = parseInt(value.cart_no);
				
				s +=	'<tr> <td style="width:18%"> <a href="/main/itemContent?item_no='+value.itemVO.item_no+'"><img src="/img/'+value.itemVO.item_imgmain+'"></a></td>';
                s +=	'<td style="vertical-align : bottom; font-size:13px;"><a href="/main/itemContent?item_no='+value.itemVO.item_no+'">'+value.itemVO.item_name+'<p>'+value.optionVO.option_content+'</p></a>';
                s +=	'<a onclick="cartHeaderDel('+cart_no+');" style="font-size:6px" href="#"><u>삭제하기</u></a> </td>';
                s += '<td style="width:20%;vertical-align : middle; font-size:13px;">'+price+'</td> </tr>';
				
                headersum = headersum + parseInt(item_price);
			});
			
			var cartTotal = new Intl.NumberFormat('ko-KR', {
				style : 'currency',
				currency : 'KRW'
			}).format(headersum);
			
			
			$("#cartPrice").html(cartTotal);
			$("#cartView").html(s);
			
			}
		})
	    
	    
  }
  
  function cartHeaderDel(cart_no){
	 
		$.ajax({
			url : "/main/cartDelete",
			type : "post",
			dataType : "json",
			data : {"cart_no" : cart_no},
			success : function(data){
				cartHeaderView();
				toastr.options.preventDuplicates = true;
				toastr.success("삭제완료");
			}
		})
  }
  
  function selectList(){
	  var keyword = document.getElementById('keyword').value;
	  console.log("검색어 들옴?"+keyword);
	  $.ajax({
		  url : "/main/selectList",
		  type : "get",
		  dataType : "json",
		  data : {"keyword": keyword},
		  success : function(data){
			  var s = '';
			  if(data < 1){
				  s += '<div style="text-align:center"><h3>검색결과가 없습니다</h3></div>' ;
			  }
			  
				$.each(data, function(key,value){
					
					var price = new Intl.NumberFormat('ko-KR', {
						style : 'currency',
						currency : 'KRW'
					}).format(value.item_price);
	
					s +=	'<tr> <td style="width:18%"> <a href="/main/itemContent?item_no='+value.item_no+'"><img src="/img/'+value.item_imgmain+'"></a></td>';
	                s +=	'<td style="vertical-align : bottom; font-size:15px;"><a href="/main/itemContent?item_no='+value.item_no+'">'+value.item_name+' <p style="font-size:5px;">'+value.item_catesub+'</p></a></td>';
	                s += '	<td style="width:20%;vertical-align : middle; font-size:13px;">'+price+'</td> </tr>';
					s += '<hr/>';
				})
				
				$("#selectView").html(s);
			  
		  }
	  })
  };
  
  
  </script>
  
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      
      
      <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
        
        
          <div class="navbar-header" style="float: left; padding: 15px; text-align: center; width: 100%;" >
            <a class="navbar-brand" style="float:none; font-size:40px;"href="/main/index">Homme</a>
          </div>
          
          <!--  메인 네브바-->
          
          <div class="collapse navbar-collapse" id="custom-collapse">
          
                    <ul class="nav navbar-nav navbar-right">
	<c:if test="${member == null}">
               <li class="dropdown" style="font-size:13px;"><a href="/member/LoginForm" >LOGIN</a></li>
               <li class="dropdown" style="font-size:13px;"><a href="/member/RegisterForm" >REGISTER</a></li>
	</c:if>
		<c:if test="${member != null}">
          	
          	<c:if test="${member.MEM_ID eq '1234'}">
          	 <li style="font-size:13px;"><a href="/master/orderManage?delivstate=1" >관리자페이지</a></li>
          	
          	</c:if>
          	<li style="font-size:13px;"><a href="/member/logout" >LOGOUT</a></li>
          	
          	
          	
          	
      	  <li class="dropdown" style="font-size:13px;"><a href="/member/MyPageView" >MyPage</a></li>
     <li class="dropdown" style="font-size:13px;"><a href="/member/wishListView" >wishList</a></li>	
</c:if>
	  <li class="dropdown" style="font-size:15px;" id="cartLi"><a  class="dropdown-toggle" href="/main/cartView"  data-toggle="dropdown"><span class="icon-basket" aria-hidden="true"></span></a>
               		 <ul class="dropdown-menu">
               		 <!-- 장바구니 -->
               		   <li class="dropdown" id="cartHeaderIcon"> 
               		   <div style="width:550px;" class="bg-light">
               		   
               		    <table class="table table-hover bg-light" style="">
                    <tbody id="cartView">

                    </tbody>
                  </table>
                  <hr/>
                  <div style="text-align:right" class=" font-serif">
                <span style="font-size:22px;"> total : <span id="cartPrice"></span></span>
               	</div>
               		   </div>
               		   </li>
                 		<li class="dropdown" style="font-size:15px;text-align:right;"><a href="/main/cartView" style="color:white">쇼핑백 보기</a></li>
               		</ul>
               </li>
               
               
               

                <li class="dropdown" style="font-size:13px;"><a  class="dropdown-toggle" href="/board/boardlist?page=1&perPageNum=10&searchType=&keyword=&cate=1"  data-toggle="dropdown">Community</a>
            <ul class="dropdown-menu" style="font-size:14px;">
              <li class="dropdown"><a href="/board/boardlist?page=1&perPageNum=10&searchType=&keyword=&cate=1">NOTICE</a></li>
              <li class="dropdown"><a href="/board/boardlist?page=1&perPageNum=10&searchType=&keyword=&cate=2">Q%A</a></li>
              <li class="dropdown"><a href="/board/boardlist?page=1&perPageNum=10&searchType=&keyword=&cate=3">FAQ</a></li>
              <li class="dropdown"><a href="/board/boardlist?page=1&perPageNum=10&searchType=&keyword=&cate=4">EVENT</a></li>
              </ul>
              </li>
       		 </ul>
          
            <ul class="nav navbar-nav navbar-left">
            
 				<li class="dropdown" style="font-size:13px;"><a class="dropdown-toggle"
							href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=outer&sort="
							data-toggle="dropdown">Outer</a>
							<ul class="dropdown-menu" style="font-size:15px;">
								<li class="dropdown" ><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=jumper&sort=">Jumper</a></li>
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=coat&sort=">Coat</a></li>
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=jacket&sort=">Jacket</a></li>
							</ul></li>
							
						<li class="dropdown" style="font-size:13px;"><a class="dropdown-toggle" href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=top&sort="
							data-toggle="dropdown">Top</a>
							<ul class="dropdown-menu" style="font-size:15px;">
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=knit&sort=">sweater</a></li>
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=halftee&sort=">HOOD</a></li>
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=shirts&sort=">Shirts</a></li>
							</ul></li>
						<li class="dropdown" style="font-size:13px;"><a class="dropdown-toggle"
							href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=bottom&sort="
							data-toggle="dropdown">Bottom</a>
							<ul class="dropdown-menu" style="font-size:15px;">
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=pants&sort=">Pants</a>
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=denim&sort=">Denim</a></li>
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=halfpants&sort=">Sportswear</a></li>
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=jogger&sort=">Jogger</a></li>
							</ul></li>
						<li class="dropdown" style="font-size:13px;"><a class="dropdown-toggle"
							href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=shoes&sort="
							data-toggle="dropdown">Shoes</a>
							<ul class="dropdown-menu" style="font-size:15px;">
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=sneakers&sort=">Sneakers</a>
								<li class="dropdown"><a
									href="/main/itemView?page1&perPageNum=8&catemain=item&catesub=boots&sort=">Boots</a></li>
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=walker&sort=">Walker</a></li>
								<li class="dropdown"><a
									href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=derby&sort=">Derby</a></li>
							</ul></li>
		
			<!-- 
				 <div class="col-sm-6">
	                <div class="footer-social-links">
	                <a href="#"><i class="fa fa-facebook"></i></a>
	                <a href="#"><i class="fa fa-twitter"></i></a>
	                <a href="#"><i class="fa fa-dribbble"></i></a>
	                <a href="#"><i class="fa fa-skype"></i></a>
	                </div>
	              </div>  -->
		
				
				
               <li class="dropdown" style="font-size:13px;"><a class="dropdown-toggle"  href="#" data-toggle="dropdown"><i class="fa fa-fw">&#xF002;</i></a>
                <ul class="dropdown-menu">
                  <li class="dropdown" id="aaa">
                  <div style="width:550px;height:400px;  overflow:auto" class="bg-light">
                  
                  <div>
         	  <input class="form-control input-lg" type="text" id="keyword" name="keyword" onkeyup="selectList();"  placeholder="검색어를 입력해주세요">
                  </div>
                  <div id="selectView" class="bg-light">
                   <table class="table table-hover bg-light">
                    <tbody id="selectView">
										<div> <p style="font-size:20px">&nbsp;&nbsp;추천 검색어 </p> 
						<p style="font-size:15px">&nbsp;&nbsp;<strong>COAT </strong></p> 
						<p style="font-size:15px">&nbsp;&nbsp;<strong>PANTS</strong> </p>
						<p style="font-size:15px">&nbsp;&nbsp;<strong>SNIKERS</strong> </p>
						</div>
                    </tbody>
                  </table>
       
                  </div>
                  </div>
                  </li>
                </ul>
              </li>
              
              
              
            </ul>
            
 
          </div>
        </div>
        
        	
        
<!--      상품목록에 들어갈 네브바입니다 

      <div class="container">
          <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span><span class="icon-bar"></span>
            <span class="icon-bar"></span></button><a class="navbar-brand" href="index.html">Homme</a>
          </div>
          <div class="collapse navbar-collapse" id="custom-collapse">
            <ul class="nav navbar-nav navbar-right">
            
                <li class="dropdown"><a href="#">Shop</a></li>
                <li class="dropdown"><a href="#">Outer</a></li>
                <li class="dropdown"><a href="#">Top</a></li>
                <li class="dropdown"><a href="#">Bottom</a></li>
                <li class="dropdown"><a href="#">Shoes</a></li>
            </ul>
          </div>
          </div> 
          -->

        
      </nav>
      </main>