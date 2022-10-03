<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../../common/css/swiper-bundle.min.css"/>
<link rel="stylesheet" type="text/css" href="../css/manager_pm_product_popup.css"/>
<style type="text/css">
html {
	overflow-x: hidden; 
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript">
$(function() {
	 <!-- main top Swiper JS -->
	 <!-- Initialize Swiper -->
	   var swiper = new Swiper(".mySwiper", {
	     spaceBetween: 0,
	     loop: 1,
	     centeredSlides: true,
	     pagination: {
	       el: ".swiper-pagination",
	       clickable: true,
	     },
	     navigation: {
	       nextEl: ".swiper-button-next ",
	       prevEl: ".swiper-button-prev ",
	     },
	   });
	   
		// 취소버튼 클릭시 창 닫기
	   $(".delete-btn").click(function() {
			self.close();
	   })
})
</script>
</head>
<body>
<div class="wrap">
<!-- product-img -->
	<div class="product-img">
		<div class="swiper mySwiper">
	     	<div class="swiper-wrapper">
	       		<div class="swiper-slide">
	       			<div class="main-top-img-wrap">
		       			<img src="http://localhost/html_prj/day0825/images/cimg.png" alt="판매상품이미지1">
	       			</div>
	       		</div>
	       		<div class="swiper-slide">
	       			<div class="main-top-img-wrap">
		       			<img src="http://localhost/html_prj/day0825/images/cimg.png" alt="판매상품이미지2">
	       			</div>
	       		</div>
	     	</div>
	     <div class="swiper-button-next"></div>
	     <div class="swiper-button-prev"></div>
	     <div class="swiper-pagination"></div>
	   </div>
	  </div>
<!-- product-img end -->

<div class="contants-wrap">
<!-- profile -->
	<div class="profile-wrap">
		<div class="profile">
			<a class="profile-link" href="#void">
				<div class="article-profile-image-wrap">
		              <div class="article-profile-image">
		                <img alt="프로필이미지" src="../../images/profileImg.png">
		              </div>
		              <div class="article-profile-left">
		                <div class="nickname">차승주주(juju****)</div>
		          	 </div>
	    		</div>
	    	</a>
		</div>
		<div class="profile-right">
		 <div class="heart">
		    <button class="heart-icon">
		       <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="30" viewBox="0 0 32 32" fill="rgb(190, 190, 190)" data-svg-content="true">
		          <g><path d="M 31.984,13.834C 31.9,8.926, 27.918,4.552, 23,4.552c-2.844,0-5.35,1.488-7,3.672 C 14.35,6.040, 11.844,4.552, 9,4.552c-4.918,0-8.9,4.374-8.984,9.282L0,13.834 c0,0.030, 0.006,0.058, 0.006,0.088 C 0.006,13.944,0,13.966,0,13.99c0,0.138, 0.034,0.242, 0.040,0.374C 0.48,26.872, 15.874,32, 15.874,32s 15.62-5.122, 16.082-17.616 C 31.964,14.244, 32,14.134, 32,13.99c0-0.024-0.006-0.046-0.006-0.068C 31.994,13.89, 32,13.864, 32,13.834L 31.984,13.834 z"></path></g></svg>
		    </button>
		<div class="heart-cnt">
			 <div class="heart-cnt-txt">0</div>
		 </div>
		</div>
		 <div class="state">
		 판매중
		 </div>
		</div>

	</div>
<!-- profile end -->

<!-- description -->
	<div class="description-wrap">
		<h1 class="description-title">라멘 지식을 전수합니다</h1>
		<h1 class="region-name">서울시 강남구</h1>
		<p class="description-category">출산/육아용품 ㆍ
			<time>시간계산코드필요(ex며칠전)</time>
		</p>
		<p class="description-price">150,000원
		</p>
		<div class="description-detail">
			<p>
				라멘을 사랑하는 이들이라면 연락주세요
				<br>
				모든 라멘 지식을 전수해드리겠습니다.
			</p>
		</div>
	</div>
<!-- description end -->

<!-- comments -->
	<div class="comments-wrap">
		<div class="comments-txt-wrap">
			<p class="comments-txt">댓글</p>
			<p class="comments-cnt">2개</p>
		</div>
		<div class="comments-sample-wrap">
			<div class="comments-profile-wrap">
				<a class="profile-link" href="#void">
				 <div class="comments-profile-image-wrap">
			             <div class="comments-profile-image">
			               <img alt="프로필이미지" src="../../images/profileImg.png">
			             </div>
			             <div class="comments-profile-left">
			               <div class="comments-nickname">사용자(user****)</div>
			               <time class="comments-date">YYYY.MM.DD.hh:mm</time>
			           </div>
		    	 </div>
			   </a>
			   <button type="button" class="delete-icon-btn">
				   <svg  class="delete-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
						<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
					</svg>
				</button>
		   	</div>
		   	<div class="comments-contents-wrap">
			    <p class="comments-content">라멘맛집 알려주세요</p>
		   	</div>
		</div>
		<div class="re-comments-sample-wrap">
			<div class="comments-profile-wrap">
				<a class="profile-link" href="#void">
				 <div class="comments-profile-image-wrap">
			             <div class="comments-profile-image">
			               <img alt="프로필이미지" src="../../images/profileImg.png">
			             </div>
			             <div class="comments-profile-left">
			               <div class="comments-nickname">차승주주(juju****)<div class="writer">작성자</div></div>
			               <time class="comments-date">YYYY.MM.DD.hh:mm</time>
			           </div>
		    	 </div>
			   </a>
			   <button type="button" class="delete-icon-btn">
				   <svg  class="delete-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
						<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
					</svg>
				</button>
		   	</div>
		   	<div class="comments-contents-wrap">
			    <p class="comments-content">강남역 왓쇼이켄</p>
		   	</div>
		</div>
	</div>
<!-- comments end -->

<!-- product-bottom -->
	<div class="product-bottom-wrap">
		<div class="product-bottom-btn">
			<button type="button" class="modify-btn">
				<span>삭제</span>
			</button>
			<button type="button" class="delete-btn">
				<span>취소</span>
			</button>
		</div>
	</div>
<!-- product-bottom end-->
</div>

</div>
</body>
</html>