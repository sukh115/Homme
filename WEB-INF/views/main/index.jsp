<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->




      <section class="home-section home-full-height bg-dark-30" id="home" data-background="assets/images/section-5.jpg">
        <div class="video-player" data-property="{videoURL:'https://www.youtube.com/watch?v=4XWgVoAlOvs', containment:'.home-section', startAt:18, mute:false, autoPlay:true, loop:true, opacity:1, showControls:false, showYTLogo:false, vol:15}"></div>
        <div class="video-controls-box">
          <div class="container">
            <div class="video-controls"><a class="fa fa-volume-up" id="video-volume" href="#">&nbsp;</a><a class="fa fa-pause" id="video-play" href="#">&nbsp;</a></div>
          </div>
        </div>
        <div class="titan-caption">
          <div class="caption-content">
            <div class="font-alt mb-30 titan-title-size-2">Man's Fashion</div>
            <div class="font-alt mb-40 titan-title-size-4">Homme</div>
            <div class="font-alt mb-30 titan-title-size-1">made by team_six</div>
          </div>
        </div>
      </section>
<div class="main">
 <section class="module pb-0" id="works">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Items</h2>
                <div class="module-subtitle font-serif"></div>
              </div>
            </div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-sm-12">
                <ul class="filter font-alt" id="filters" style="font-size:15px">
                  <li><a class="current wow fadeInUp" href="#" data-filter="*">All</a></li>
                  <li><a class="wow fadeInUp" href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=outer&sort=" data-filter=".illustration" data-wow-delay="0.2s">Outer</a></li>
                  <li><a class="wow fadeInUp" href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=top&sort=" data-filter=".marketing" data-wow-delay="0.4s">TOP</a></li>
                  <li><a class="wow fadeInUp" href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=bottom&sort=" data-filter=".photography" data-wow-delay="0.6s">BOTTOM</a></li>
                  <li><a class="wow fadeInUp" href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=shoes&sort=" data-filter=".webdesign" data-wow-delay="0.6s">SHOES</a></li>
                </ul>
              </div>
            </div>
          </div>
          
          <ul class="works-grid works-grid-gut works-grid-3 works-hover-w" id="works-grid">
            <li class="work-item illustration webdesign"><a href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=outer&sort=">
                <div class="work-image"><img src="/img/${mainOuter.item_imgmain}" alt="Portfolio Item"/></div>
                <div class="work-caption font-alt">
                  <h2 class="work-title">OUTER 신상</h2>
                  <div class="work-descr">${mainOuter.item_name }</div>
                </div>
                </a></li>
            <li class="work-item marketing photography"><a href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=top&sort=">
                <div class="work-image"><img src="/img/${mainTop.item_imgmain}" alt="Portfolio Item"/></div>
                <div class="work-caption font-alt">
                  <h2 class="work-title" >TOP 신상</h2>
                  <div class="work-descr">${mainTop.item_name}</div>
                </div></a></li>
            <li class="work-item illustration photography"><a href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=bottom&sort=">
                <div class="work-image"><img src="/img/${mainBotton.item_imgmain}" alt="Portfolio Item"/></div>
                <div class="work-caption font-alt">
                  <h3 class="work-title">Bottom 신상</h3>
                  <div class="work-descr" >${mainBotton.item_name}</div>
                </div></a></li>
            <li class="work-item marketing photography"><a href="/main/itemView?page=1&perPageNum=8&catemain=item&catesub=shoes&sort=">
                <div class="work-image"><img src="/img/${mainShoes.item_imgmain}" alt="Portfolio Item"/></div>
                <div class="work-caption font-alt">
                  <h3 class="work-title">Shoes 신상</h3>
                  <div class="work-descr">${mainShoes.item_imgmain}</div>
                </div></a></li>
            <li class="work-item illustration webdesign"><a href="portfolio_single_featured_video1.html">
                <div class="work-image"><img src="/resources/assets/images/shop/indexpic1.jpg" alt="Portfolio Item"/></div>
                <div class="work-caption font-alt">
                  <h2 class="work-title">bag 신상</h2>
                  <div class="work-descr">블랙 페블 그레인 레더 토널 하드웨어 MRS. THOM 백</div>
                </div></a></li>
            <li class="work-item marketing webdesign"><a href="portfolio_single_featured_video2.html">
                <div class="work-image"><img src="/resources/assets/images/shop/indexpic2.jpg" alt="Portfolio Item"/></div>
                <div class="work-caption font-alt">
                  <h3 class="work-title">acc 신상</h3>
                  <div class="work-descr">실크 자카드 얼터네이팅 스트라이프 니트 타이
</div>
                </div></a></li>
          </ul>
        </section>
	<section class="module-small">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">Latest in clothing</h2>
				</div>
			</div>
			<div class="row multi-columns-row">
						<c:forEach items="${mainLatest}" var="mainLatest">
			
				<div class="col-sm-6 col-md-3 col-lg-3">
					<div class="shop-item">
						<div class="shop-item-image">
							<img src="/img/${mainLatest.item_imgmain}"
								alt="Accessories Pack" />
							<div class="shop-item-detail">
								<a class="btn btn-round btn-b" href="/main/itemContent?item_no=${mainLatest.item_no}"><span class="icon-basket">
								IN ITEM
								</span></a>
							</div>
						</div>
						<h4 class="shop-item-title font-alt">
							<a href="">${mainLatest.item_name}</a>
						</h4>
						₩ <fmt:formatNumber pattern="###,###,###" value="${mainLatest.item_price}"/>
					</div>
				</div>
						</c:forEach>
			
			</div>
			<div class="row mt-30">
				<div class="col-sm-12 align-center">
					<a class="btn btn-b btn-round" href="#">See all products</a>
				</div>
			</div>
		</div>
	</section>
	<section class="module module-video bg-dark-30" data-background="">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt mb-0">Be inspired. Get ahead
						of trends.</h2>
				</div>
			</div>
		</div>
		<div class="video-player"
			data-property="{videoURL:'https://www.youtube.com/watch?v=EMy5krGcoOU', containment:'.module-video', startAt:0, mute:true, autoPlay:true, loop:true, opacity:1, showControls:false, showYTLogo:false, vol:25}"></div>
	</section>
	<section class="module">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">Latest Hot Items</h2>
					<div class="module-subtitle font-serif"> 10-Items Random</div>
				</div>
			</div>
			<div class="row">
				<div class="owl-carousel text-center" data-items="5"
					data-pagination="false" data-navigation="false">
					<c:forEach items="${mainRandom}" var="mainRandom">
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="ex-product">
								<a href="#"><img
									src="/img/${mainRandom.item_imgmain}"
									alt="Leather belt" /></a>
								<h4 class="shop-item-title font-alt">
									<a href="/main/itemContent?item_no=${mainRandom.item_no}">${mainRandom.item_name}</a>
								</h4>
								￦<fmt:formatNumber pattern="###,###,###" value="${mainRandom.item_price}"/>
								
							</div>
						</div>
					</div>
				
				</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<hr class="divider-w">
	<section class="module" id="news">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">Homme News</h2>
				</div>
			</div>
			
			<c:forEach items="${mainNews}" var="mainNews">
			<div class="row multi-columns-row post-columns wo-border">
				<div class="col-sm-6 col-md-4 col-lg-4">
					<div class="post mb-40">
						<div class="post-header font-alt">
							<h2 class="post-title">
								<a style="font-size:20px;" href="/board/boardview?b_no=${mainiNews.b_no}">${mainNews.b_title}</a>
							</h2>
						</div>
						<div class="post-entry">
							<p>${mainNews.b_content}</p>
						</div>
						<div class="post-more">
							<a class="more-link" href="/board/boardview?b_no=${mainiNews.b_no}">Read more</a>
						</div>
					</div>
				</div>
				</c:forEach>
			
			
			
			</div>
		</div>
	</section>
	

	<!-- footer 입니다 -->

	<%@include file="../include/footer.jsp"%>
	<!-- footer 입니다 -->