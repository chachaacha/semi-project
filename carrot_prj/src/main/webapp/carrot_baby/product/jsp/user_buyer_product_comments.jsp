<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../common/css/swiper-bundle.min.css"/>
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_buyer_product_comments.css"/>

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
	   
	 //댓글 신고 팝업창 열기
		$(".report-btn").click(function() {
			window.open("report_write_comments_popup.jsp","report_comments_popup",
					"width=520,height=620,top=203,left=1336");
		})
		
	//댓글 신고 팝업창 열기
		$(".report-comments-btn").click(function() {
			window.open("report_write_comments_popup.jsp","report_comments_popup",
					"width=520,height=620,top=203,left=1336");
		})
		
		//하트 아이콘 효과
		$(".heart-icon").click(function() {
			$(".heart-icon svg").toggleClass("active");
		})
})
</script>
</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">
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
		       			<img src="" alt="판매상품이미지2">
	       			</div>
	       		</div>
	     	</div>
	     <div class="swiper-button-next"></div>
	     <div class="swiper-button-prev"></div>
	     <div class="swiper-pagination"></div>
	   </div>
	  </div>
<!-- product-img end -->

<!-- profile -->
	<div class="profile-wrap">
		<div class="profile">
			<a class="profile-link" href="../../other_profiles/jsp/other_user_profile.jsp">
				<div class="article-profile-image-wrap">
		              <div class="article-profile-image">
		                <img alt="프로필이미지" src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-0443429487fdc2277fc8f9dd1eca6fb8b678862f593e21222ba9f6592b99ad14.png">
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
		<div class="description-title-wrap">
			<h1 class="description-title">라멘 지식을 전수합니다</h1>
			<div class="report-wrap">
				 	<button type="button" class="report-btn">
					 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-slash-circle" viewBox="0 0 16 16">
						  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
						  <path d="M11.354 4.646a.5.5 0 0 0-.708 0l-6 6a.5.5 0 0 0 .708.708l6-6a.5.5 0 0 0 0-.708z"/>
						</svg>
				 	신고하기
				 	</button>
		 </div>
		</div>
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
			<div class="comments-align-wrap">
				<ul class="comments-align">
					<li>
						<a class="comments-new" href="#void">최신순</a>
					</li>
					<li>
						<a class="comments-old" href="#void">과거순</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="comments-input-wrap">
			<div class="comments-input">
				<textarea rows="3" class="comments-txtarea" placeholder="댓글을 남겨보세요."></textarea>
			</div>
			<button type="button"type="button" class="comments-btn">
				<span>클릭</span>
			</button>
		</div>
		<div class="comments-sample-wrap">
			<div class="comments-profile-wrap">
				<a class="profile-link" href="#void">
				 <div class="comments-profile-image-wrap">
			             <div class="comments-profile-image">
			               <img alt="프로필이미지" src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-0443429487fdc2277fc8f9dd1eca6fb8b678862f593e21222ba9f6592b99ad14.png">
			             </div>
			             <div class="comments-profile-left">
			               <div class="comments-nickname">사용자(user****)</div>
			               <time class="comments-date">YYYY.MM.DD.hh:mm</time>
			           </div>
		    	 </div>
			   </a>
		   	</div>
		   	<div class="comments-contents-wrap">
			    <p class="comments-content">라멘맛집 알려주세요</p>
			    <div class="comments-bottom">
			    	<a class="add-comments" href="#void">
			    		<button type="button"class="add-comments-btn">답글쓰기</button>
			    	</a>
			    	<a class="modify-comments" href="#void">
			    		<button type="button" class="modify-comments-btn">수정하기</button>
			    	</a>
			    	<a class="delete-comments" href="#void">
			    		<button type="button"class="delete-comments-btn">삭제하기</button>
			    	</a>
			    </div>
		   	</div>
		</div>
		<div class="re-comments-sample-wrap">
			<div class="comments-profile-wrap">
				<a class="profile-link" href="#void">
				 <div class="comments-profile-image-wrap">
			             <div class="comments-profile-image">
			               <img alt="프로필이미지" src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-0443429487fdc2277fc8f9dd1eca6fb8b678862f593e21222ba9f6592b99ad14.png">
			             </div>
			             <div class="comments-profile-left">
			               <div class="comments-nickname">차승주주(juju****)<div class="writer">작성자</div></div>
			               <time class="comments-date">YYYY.MM.DD.hh:mm</time>
			           </div>
		    	 </div>
			   </a>
		   	</div>
		   	<div class="comments-contents-wrap">
			    <p class="comments-content">강남역 왓쇼이켄</p>
			    <div class="comments-bottom">
			    		<button type="button"class="report-comments-btn">신고하기</button>
			    </div>
		   	</div>
		</div>
		<div class="re-comments-input-wrap">
			<div class="comments-input">
				<textarea rows="3" class="comments-txtarea" placeholder="답글을 남겨보세요."></textarea>
			</div>
			<button type="button"type="button" class="comments-btn">
				<span>클릭</span>
			</button>
		</div>
	</div>
<!-- comments end -->

</div>
<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>
</body>
</html>