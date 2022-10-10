<%@page import="java.util.List"%>
<%@page import="userVO.BoardVO"%>
<%@page import="userDAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../common/css/swiper-bundle.min.css"/>
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_buyer_product_comments.css"/>
<jsp:useBean id="bVO" class="userVO.BoardVO" scope="page"/>
<jsp:useBean id="wVO" class="userVO.WishVO" scope="page"/>
<jsp:setProperty property="*" name="bVO"/>
<jsp:setProperty property="*" name="wVO"/>

<%
//세션 아이디 얻기
String sessionId=(String)session.getAttribute("id");
pageContext.setAttribute("sessionId", sessionId);

//조회하고 있는 거래창의 상품인덱스 얻기
String pIdx=request.getParameter("product_idx");
pageContext.setAttribute("pIdx", pIdx);

//BoardDAO 생성
BoardDAO bDAO=BoardDAO.getInstance();

//상품 조회
BoardVO pInfo=bDAO.selectB(pIdx); 
pageContext.setAttribute("pInfo", pInfo);

//이미지 조회
List<String> selImg=bDAO.selectImg(pIdx);
pageContext.setAttribute("selImg", selImg);

//하트 조회
wVO.setId(sessionId);
wVO.setProduct_idx(pIdx);
Integer test=bDAO.selectWish(wVO);
/* System.out.println(test); */

%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript">
$(function() {
	
	var test1=<%=test%>;
	if(test1==1) {
		$(".heart-icon svg").addClass("active");
	}
	
	//하트 아이콘 효과
	$(".heart-icon").click(function() {
		
		var sessionId="<%=(String)session.getAttribute("id") %>";
		
		if(sessionId=="null") { //비회원일 경우 작동금지
			alert("로그인이 필요한 동작입니다.")
		}else{
			
			var test=$(".heart-icon svg").attr("class");
			
			if(test=="active") {
				$(".heart-icon svg").removeClass("active");
				
				$("#product_idx").val(${pIdx});
				$("#userId").val(sessionId);
				$("#flag").val(false);
				$("#heartFrm").submit();
			}else {
				$(".heart-icon svg").addClass("active");
				
				$("#product_idx").val(${pIdx});
				$("#userId").val(sessionId);
				$("#flag").val(true);
				$("#heartFrm").submit();
			}
			
		}
		
	})
	
	
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
	     		<c:forEach var="pImg" items="${selImg }">
		       		<div class="swiper-slide">
		       			<div class="main-top-img-wrap">
			       			<img src="${pImg }" alt="판매상품이미지1">
		       			</div>
		       		</div>
	     		</c:forEach>
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
				<div class="article-profile-image-wrap">
		              <div class="article-profile-image">
						<a class="profile-link" href="../../other_profiles/jsp/other_user_profile.jsp">
		                	<img alt="프로필이미지" src="${pInfo.img }">
				    	</a>
		              </div>
		              <div class="article-profile-left">
		                <div class="nickname">
		                	${pInfo.nick }(${fn:substring(pInfo.id,0,4) }****)</div>
		          	 </div>
	    		</div>
		</div>
		<div class="profile-right">
		<form method="post" action="../../product/jsp/heart_process.jsp" id="heartFrm">
			 <div class="heart">
			    <button class="heart-icon">
			       <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="30" viewBox="0 0 32 32" fill="rgb(190, 190, 190)" data-svg-content="true">
			          <g><path d="M 31.984,13.834C 31.9,8.926, 27.918,4.552, 23,4.552c-2.844,0-5.35,1.488-7,3.672 C 14.35,6.040, 11.844,4.552, 9,4.552c-4.918,0-8.9,4.374-8.984,9.282L0,13.834 c0,0.030, 0.006,0.058, 0.006,0.088 C 0.006,13.944,0,13.966,0,13.99c0,0.138, 0.034,0.242, 0.040,0.374C 0.48,26.872, 15.874,32, 15.874,32s 15.62-5.122, 16.082-17.616 C 31.964,14.244, 32,14.134, 32,13.99c0-0.024-0.006-0.046-0.006-0.068C 31.994,13.89, 32,13.864, 32,13.834L 31.984,13.834 z"></path></g></svg>
			    </button>
			<div class="heart-cnt">
				 <div class="heart-cnt-txt" >${pInfo.liked_cnt }</div>
			 </div>
			</div>
			<input type="hidden" name="product_idx" id="product_idx" value="${param.product_idx }">
			<input type="hidden" name="userId" id="userId" value="${param.userId }">
			<input type="hidden" name="flag" id="flag" value="${param.flag }">
		</form>
		 <div class="state">
		 	<c:choose>
		 		<c:when test="${pInfo.reserved eq 'N' }">
		 			판매중
		 		</c:when>
		 		<c:when test="${pInfo.reserved eq 'Y' }">
		 			예약중
		 		</c:when>
		 		<c:when test="${pInfo.sold_check eq 'Y' }">
		 			판매완료
		 		</c:when>
		 	</c:choose>
		 </div>
		</div>

	</div>
<!-- profile end -->

<!-- description -->
	<div class="description-wrap">
		<div class="description-title-wrap">
			<h1 class="description-title">${pInfo.title }</h1>
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
		<h1 class="region-name">서울시 ${pInfo.gu }</h1>
		<p class="description-category">${pInfo.category } ㆍ
			<time>${pInfo.posted_date }</time>
		</p>
		<p class="description-price">
			<c:if test="${pInfo.price eq 0}">
				나눔
			</c:if>
			<c:if test="${pInfo.price ne 0}">
				<fmt:formatNumber value="${pInfo.price }" pattern="#,###,###원"/>
			</c:if>
		</p>
		<div class="description-detail">
			${pInfo.contents }
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
				 <div class="comments-profile-image-wrap">
			             <div class="comments-profile-image">
							<a class="profile-link" href="#void">
			               		<img alt="프로필이미지" src="../../images/profileImg.png">
						   </a>
			             </div>
			             <div class="comments-profile-left">
			               <div class="comments-nickname">사용자(user****)</div>
			               <time class="comments-date">YYYY.MM.DD.hh:mm</time>
			           </div>
		    	 </div>
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
				 <div class="comments-profile-image-wrap">
			         <div class="comments-profile-image">
						<a class="profile-link" href="#void">
			               <img alt="프로필이미지" src="../../images/profileImg.png">
						 </a>
			             </div>
			             <div class="comments-profile-left">
			               <div class="comments-nickname">차승주주(juju****)<div class="writer">작성자</div></div>
			               <time class="comments-date">YYYY.MM.DD.hh:mm</time>
			           </div>
		    	 </div>
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