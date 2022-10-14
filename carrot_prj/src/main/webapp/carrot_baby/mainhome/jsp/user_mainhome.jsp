<%@page import="userVO.HomeVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.HomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!-- 1. parameter 받을 VO 생성-->
<jsp:useBean id="hVO" class="userVO.HomeVO" scope="page"/>
<!-- 2. VO에 setter method(property)호출 -->
<jsp:setProperty property="*" name="hVO"/>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user main home</title>
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
   </div><!-- swiper mySwiper -->
<!-- main top end -->
   
<!-- main middle -->
	<div class="main-middle-wrap">
		<div class="main-middle-content">
			<h1 class="main-middle-title">중고거래</h1>
			<%
			HomeDAO hDao=HomeDAO.getInstance(); //연결을 한번 했기 때문에 밑에서 또 연결할 필요x
			List<HomeVO> mainList=hDao.selectProduct();
			//스콥 객체에 할당
			pageContext.setAttribute("mainList", mainList );
			%>
				<div class="card-wrap">
					<!-- 매물 목록 -->
					<c:forEach var="main"  items="${mainList}"><!-- forEach를 사용하여 반복 -->
				
					<div class="card">
							<div class="card-photo">
								<a class="card-link" 
									href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${main.product_idx }">
									<img alt="이미지 위치" src="../../search/image/${main.thumbnail }"><!-- 이미지는 src에 걸기! -->
								</a>
							</div><!-- card-photo -->
							<div class="card-desc">
								<a class="card-link" href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${main.product_idx }">
									<h2 class="card-title"><c:out value="${main.title }"/></h2>
								</a>
								<div class="card-price">
								<!-- 가격이 0원이라면 나눔으로 표시됨 -->
								<c:if test="${main.price eq 0}">나눔</c:if>
								<!-- 가격이 0원이 아니라면 가격이 #,###,###의 형식으로 표시됨 -->
								<fmt:formatNumber pattern="#,###,###원" value="${main.price }"></fmt:formatNumber>
								</div>
								<div class="card-region-name" ><c:out value="${main.gu }"/></div>
							</div><!-- card-desc -->
							<div class="card-counts">
								<span>하트&nbsp; <c:out value="${main.liked_cnt }"/>
								</span>
								ㆍ
								<span> 댓글&nbsp;<c:out value="${main.comment_cnt }"/></span>
							</div><!-- card-counts -->
						
					</div><!-- card -->
			</c:forEach>

	</div><!-- card-wrap -->
	</div><!-- main-middle-content -->
	</div><!-- main-middle-wrap -->
<!-- main middle end -->

<!-- main bottom -->

	<div class="main-bottom">
		<h3 class="main-bottom-title">중고거래 인기검색어</h3>
		<%
			List<String> topKeyWord=hDao.selectSearch();
			pageContext.setAttribute("topKeyWord", topKeyWord);
			%>
			
		<ul class="top-keywords-list"><!-- ul이 바깥에 있어야함 -->
			<c:forEach var="top"  items="${topKeyWord}"> <!-- for:Each로 반복돌리기 -->
				<li class="top-keywords-item">
					<a class="top-keywords-link" href="../../search/jsp/user_search.jsp?keyword=${top}">
						<c:out value=" ${top}"/>
					</a>
				</li>
			</c:forEach>
		</ul>
	</div><!-- main-bottom -->

<!-- main bottom end -->

</div>
<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>
</body>
</html>