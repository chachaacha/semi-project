<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user Main Home</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_mainhome.css"/>
<link rel="stylesheet" type="text/css" href="../../common/css/swiper-bundle.min.css"/>
<link rel="stylesheet" type="text/css" href="../css/homeparticle.css"/>

<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	 <!-- main top Swiper JS -->
	 <!-- Initialize Swiper -->
	   var swiper = new Swiper(".mySwiper", {
	
	     spaceBetween: 0,
	     loop: 1,
	     centeredSlides: true,
	     autoplay: {
	       delay: 4000,
	       disableOnInteraction: false,
	     },
	     pagination: {
	       el: ".swiper-pagination",
	       clickable: true,
	     },
	     navigation: {
	       nextEl: ".swiper-button-next ",
	       prevEl: ".swiper-button-prev ",
	     },
	     
	   });
})
</script>
</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="user_login_header.jsp" %><!-- 로그인부분은 나중에 하기 -->
<!-- header end-->

<!-- container -->
<div class="container">

<!-- main top -->
	<div class="swiper mySwiper">
     	<div class="swiper-wrapper">
       		<div class="swiper-slide slide1">
  				<div class="bg-animation">
					<div id='stars'></div>
					<div id='stars2'></div>
					<div id='stars3'></div>
					<div id='stars4'></div>
				</div><!-- / STAR ANIMATION -->
       			<div class="text-wrap">
       				<h2>잠들어 있던<br>
       					우리 아이 물건<br>
       					이웃들과 나누자</h2>
       				<p>빠르게 자라는 우리아이.<br>
       				   버리지도 못하고 계속 쌓여가는 물품.<br>
       				   이제는 동네 이웃들과 따뜻한 거래를 시작해봐요.</p>
       			</div>
       			<div class="main-top-img-wrap1">
	       			<img src="../../images/main_img1.png" >
       			</div>
       		</div>
       		<div class="swiper-slide slide2">
       			<div class="bg-animation">
					<div id='stars'></div>
					<div id='stars2'></div>
					<div id='stars3'></div>
					<div id='stars4'></div>
				</div><!-- / STAR ANIMATION -->
       			<div class="text-wrap">
       				<h2>동네 주민들과<br>
       					따뜻한 거래를<br>
       					지금 시작해 보세요</h2>
       				<p>택배비 없이 우리 동네 근처에서<br>
       				   쉽고 편하게 거래해봐요.</p>
       			</div>
       			<div class="main-top-img-wrap2">
	       			<img src="../../images/main_img2.png">
       			</div>
       		</div>
	       	<div class="swiper-slide slide3">
       		 	<div class="bg-animation">
					<div id='stars'></div>
					<div id='stars2'></div>
					<div id='stars3'></div>
					<div id='stars4'></div>
				</div><!-- / STAR ANIMATION -->
	       		<div class="text-wrap">
       				<h2>알뜰하고<br>
       					현명하게<br>
       					육아하기</h2>
       				<p>육아에는 필요하지만<br>
       				   고가라서 늘 망설이던 육아용품들.<br>
       				   새것같은 제품을 절반 가격에 얻어보세요.</p>
       			</div>
       			<div class="main-top-img-wrap3">
	       			<img src="../../images/main_img3.png">
       			</div>
	       	</div>
	       	<div class="swiper-slide slide4">
       			<div class="bg-animation">
					<div id='stars'></div>
					<div id='stars2'></div>
					<div id='stars3'></div>
					<div id='stars4'></div>
				</div><!-- / STAR ANIMATION -->
	       		<div class="text-wrap">
       				<h2>동네 주민들과<br>
       					따뜻한 거래를<br>
       					지금 시작해 보세요</h2>
       				<p>택배비 없이 우리 동네 근처에서<br>
       				   쉽고 편하게 거래해봐요.</p>
       			</div>
       			<div class="main-top-img-wrap4">
	       			<img src="../../images/main_img4.png">
       			</div>
	       	</div>
     	</div>
     <div class="swiper-button-next"></div>
     <div class="swiper-button-prev"></div>
     <div class="swiper-pagination"></div>
   </div>
<!-- main top end -->
   
<!-- main middle -->
	<div class="main-middle-wrap">
		<div class="main-middle-content">
			<h1 class="main-middle-title">중고거래</h1>
	   <!--  -->
			<jsp:useBean id="hVO" class="userVO.HomeVO" scope="page"></jsp:useBean><!-- 추가한 부분 덜덜 -->
				<div class="card-wrap">
					<!-- 매물 목록 --><!-- 매물은 공개되도 되기 때문에 get 방식 가능 !-->
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="http://localhost/html_prj/day0825/images/cimg.png">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 댓글 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 댓글 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 댓글 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 댓글 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 댓글 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 댓글 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 댓글 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 댓글 0 </span>
							</div>
						</a>
					</div>
				</div>
		</div>
	</div>
<!-- main middle end -->

<!-- main bottom -->

	<div class="main-bottom">
		<h3 class="main-bottom-title">중고거래 인기검색어</h3>
		<ul class="top-keywords-list">
			<li class="top-keywords-item">
				<a class="top-keywords-link" href="#void">검색어</a>
			</li>
			<li class="top-keywords-item">
				<a class="top-keywords-link" href="#void">검색어</a>
			</li>
			<li class="top-keywords-item">
				<a class="top-keywords-link" href="#void">검색어</a>
			</li>
			<li class="top-keywords-item">
				<a class="top-keywords-link" href="#void">검색어</a>
			</li>
			<li class="top-keywords-item">
				<a class="top-keywords-link" href="#void">검색어</a>
			</li>
			<li class="top-keywords-item">
				<a class="top-keywords-link" href="#void">검색어</a>
			</li>
			<li class="top-keywords-item">
				<a class="top-keywords-link" href="#void">검색어</a>
			</li>
			<li class="top-keywords-item">
				<a class="top-keywords-link" href="#void">검색어</a>
			</li>
			<li class="top-keywords-item">
				<a class="top-keywords-link" href="#void">검색어</a>
			</li>
			<li class="top-keywords-item">
				<a class="top-keywords-link" href="#void">검색어</a>
			</li>
		</ul>
	</div>

<!-- main bottom end -->

</div>
<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>
</body>
</html>