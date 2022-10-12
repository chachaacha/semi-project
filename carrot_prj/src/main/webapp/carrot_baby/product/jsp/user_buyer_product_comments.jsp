<%@page import="userVO.UserCommentVO"%>
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
<jsp:useBean id="ucVO" class="userVO.UserCommentVO" scope="page"/>
<jsp:setProperty property="*" name="bVO"/>
<jsp:setProperty property="*" name="wVO"/>
<jsp:setProperty property="*" name="ucVO"/>

<%
//세션 아이디 얻기
String sessionId=(String)session.getAttribute("id");
pageContext.setAttribute("sessionId", sessionId);

//조회하고 있는 거래창의 상품인덱스 얻기
String pIdx=request.getParameter("product_idx");
pageContext.setAttribute("pIdx", pIdx);

//BoardDAO 생성
BoardDAO bDAO=BoardDAO.getInstance();

//게시글 작성자 판단
bVO.setId(sessionId);
bVO.setProduct_idx(pIdx);
Integer wriCheck=bDAO.selectP(bVO);
pageContext.setAttribute("wriCheck", wriCheck);
/* System.out.println("게시글:"+wriCheck); */

//상품 조회
BoardVO pInfo=bDAO.selectB(pIdx); 
pageContext.setAttribute("pInfo", pInfo);

//이미지 조회
List<String> selImg=bDAO.selectImg(pIdx);
pageContext.setAttribute("selImg", selImg);

//하트 조회
wVO.setId(sessionId);
wVO.setProduct_idx(pIdx);
Integer heartTotal=bDAO.selectWish(wVO);

//댓글 수 조회
Integer commCnt=bDAO.selCountComm(pIdx);
pageContext.setAttribute("commCnt", commCnt);

//댓글 정렬
List<UserCommentVO> setCom=bDAO.selectComm(ucVO);
pageContext.setAttribute("setCom", setCom);

/* 유저 닉네임가져오기
String nick=bDAO.selectN(sessionId);
pageContext.setAttribute("nick", nick); */

%>
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
	
	//상품 조회 처음 들어왔을 때 하트 체크 판단
	var heartCnt=<%=heartTotal%>;
	if(heartCnt==1) {
		$(".heart-icon svg").addClass("active");
	}
	
	//하트 아이콘 효과
	$(".heart-icon").click(function() {
		
		var sessionId="<%=(String)session.getAttribute("id") %>";
		
		if(sessionId=="null") { //비회원일 경우 작동금지
			alert("로그인이 필요한 동작입니다.")
		}else{
			
			var test=$(".heart-icon svg").attr("class");
			
			if(test=="active") { //하트 취소
				$(".heart-icon svg").removeClass("active");
				
				$("#product_idx").val(${pIdx});
				$("#userId").val(sessionId);
				$("#flag").val(false);
				$("#heartFrm").submit();
			}else { //하트 등록
				$(".heart-icon svg").addClass("active");
				
				$("#product_idx").val(${pIdx});
				$("#userId").val(sessionId);
				$("#flag").val(true);
				$("#heartFrm").submit();
			}
			
		}
		
	})
	   
	 //게시글 신고 팝업창 열기
		$(".report-btn").click(function() {
			window.open("report_write_comments_popup.jsp","report_comments_popup",
					"width=520,height=620,top=203,left=1336");
		})
		
	//댓글 신고 팝업창 열기
		$(".report-comments-btn").click(function() {
			window.open("report_write_comments_popup.jsp","report_comments_popup",
					"width=520,height=620,top=203,left=1336");
		})
		
	//구매자 선택 팝업창 열기
		$(".state-select").change(function() {
			var buyer=$(".state-select").val();
			if(buyer=="판매완료"){
				window.open("choice_popup.jsp","popup_select",
						"width=520,height=490,top=203,left=1336");
			}
		})
		
	// 댓글 조회 필터
		$(".comments-old").click(function() {
			var comFlag=$(this).attr("value");
			
			$("#product_idx").val(${pIdx});
			$("#comment_flag").val(comFlag);
			$("#commFrm").submit();
		})
		
	// 댓글 조회 필터
		$(".comments-new").click(function() {
			var comFlag=$(this).attr("value");
			
			$("#product_idx").val(${pIdx});
			$("#comment_flag").val(comFlag);
			$("#commFrm").submit();
		})
		
	//답글 쓰기 버튼 생성	
		$(".add-comments-btn").click(function() {
			$(this).parent().parent().parent().next().toggle();
		})
		
	//댓글 작성
		$("#comments-btn").click(function() {
			var sessionId="<%=(String)session.getAttribute("id") %>";
			var comTxt=$("#comments-txtarea").val().replace(/(?:\r\n|\r|\n)/g, "<br>");
			
			if(comTxt.length!=0) {
				if(sessionId=="null") { //비회원일 경우 작동금지
					alert("로그인이 필요한 동작입니다.")
				}else{
					$("#work").val("comment");
					$("#product_idx").val(${pIdx});
					$("#user_id").val(sessionId);
					$("#contents").val(comTxt);
					$("#comProFrm").submit();
				}
			}else {
				alert("내용을 입력해주세요.");
			}
			
		})
		
	<%-- //댓글 삭제
		$("#del-com-btn").click(function() {
			var sessionId="<%=(String)session.getAttribute("id") %>";
			var replIdx=$(this).val();
			var conFlag=confirm("댓글을 삭제하시겠습니까?");
			
			if(conFlag==true) {
				alert("댓글을 삭제했습니다.");
				alert(replIdx);
				
				/* $("#work").val("deletedCom");
				$("#product_idx").val(${pIdx});
				$("#comment_idx").val(comIdx);
				$("#user_id").val(sessionId);
				$("#contents").val(comTxt);
				$("#comProFrm").submit(); */
				
			}else {
				alert("취소하셨습니다.");
			}
		}) --%>
	
		
})
	//답댓글달기
	$(document).on("click", "#re-com-btn", function() {
		var sessionId="<%=(String)session.getAttribute("id") %>";
		var comIdx=$(this).val();
		var comTxt=$(this).prev().children().val().replace(/(?:\r\n|\r|\n)/g, "<br>");
		
		if(comTxt.length!=0) {
			if(sessionId=="null") { //비회원일 경우 작동금지
				alert("로그인이 필요한 동작입니다.")
			}else{
				$("#work").val("recomment");
				$("#product_idx").val(${pIdx});
				$("#comment_idx").val(comIdx);
				$("#user_id").val(sessionId);
				$("#contents").val(comTxt);
				$("#comProFrm").submit();
			}		
		}else {
			alert("내용을 입력해주세요");
		}
	})
	
	//댓글 삭제
	$(document).on("click", "#del-com-btn", function() {
		var sessionId="<%=(String)session.getAttribute("id") %>";
		var delconIdx=$(this).prev().prev().val();
		var replIdx=$(this).val();
		
		var conFlag=confirm("댓글을 삭제하시겠습니까?");
		
		if(conFlag==true) {
			alert("댓글을 삭제했습니다.");
			
			$("#work").val("deletedCom");
			$("#comment_idx").val(delconIdx);
			$("#reply_idx").val(replIdx);
			$("#product_idx").val(${pIdx});
			$("#comProFrm").submit();
			
		}else {
			alert("취소하셨습니다.");
		}
		
	})
	
	//답글 삭제	
	$(document).on("click", "#del-recom-btn", function() {
		var sessionId="<%=(String)session.getAttribute("id") %>";
		var delconIdx=$(this).prev().val();
		var replIdx=$(this).val();
		
		var conFlag=confirm("댓글을 삭제하시겠습니까?");
		
		if(conFlag==true) {
			alert("댓글을 삭제했습니다.");
			
			$("#work").val("deletedCom");
			$("#comment_idx").val(delconIdx);
			$("#reply_idx").val(replIdx);
			$("#product_idx").val(${pIdx});
			$("#comProFrm").submit();
			
		}else {
			alert("취소하셨습니다.");
		}
		
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
						<a class="profile-link" href="javascript:profileMove('${pInfo.id }');">
		                	<img alt="프로필이미지" src="${pInfo.img }">
				    	</a>
		              </div>
		              <div class="article-profile-left">
		                <div class="nickname">
		                	<c:out value="${pInfo.nick }"/>(<c:out value="${fn:substring(pInfo.id,0,4) }****"/>)</div>
		          	 </div>
	    		</div>
		</div>
		<div class="profile-right">
		
			 <div class="heart">
			    <button class="heart-icon">
			       <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="30" viewBox="0 0 32 32" fill="rgb(190, 190, 190)" data-svg-content="true">
			          <g><path d="M 31.984,13.834C 31.9,8.926, 27.918,4.552, 23,4.552c-2.844,0-5.35,1.488-7,3.672 C 14.35,6.040, 11.844,4.552, 9,4.552c-4.918,0-8.9,4.374-8.984,9.282L0,13.834 c0,0.030, 0.006,0.058, 0.006,0.088 C 0.006,13.944,0,13.966,0,13.99c0,0.138, 0.034,0.242, 0.040,0.374C 0.48,26.872, 15.874,32, 15.874,32s 15.62-5.122, 16.082-17.616 C 31.964,14.244, 32,14.134, 32,13.99c0-0.024-0.006-0.046-0.006-0.068C 31.994,13.89, 32,13.864, 32,13.834L 31.984,13.834 z"></path></g></svg>
			    </button>
			<div class="heart-cnt">
				 <div class="heart-cnt-txt" ><c:out value="${pInfo.liked_cnt }"/></div>
			 </div>
			</div>
		 	<c:if test="${wriCheck eq 0 }">
		 		<c:choose>
				 	<c:when test="${pInfo.reserved eq 'N' }">
				 		<div class="state">판매중</div>
				 	</c:when>
				 	<c:when test="${pInfo.reserved eq 'Y' }">
				 		<div class="state">예약중</div>
				 	</c:when>
				 	<c:when test="${pInfo.sold_check eq 'Y' }">
				 		<div class="state">판매완료</div>
				 	</c:when>
		 		</c:choose>
			</c:if>
		 	
		 	<c:if test="${wriCheck eq 1 }">
			 	<select name="state" class="state-select">
					<option value="판매중">판매중</option>
					<option value="예약중">예약중</option>
					<option value="판매완료" class="soldout">판매완료</option>
				</select>
			</c:if>
		</div>

	</div>
<!-- profile end -->

<!-- description -->
	<div class="description-wrap">
		<div class="description-title-wrap">
			<h1 class="description-title"><c:out value="${pInfo.title }"/></h1>
			<div class="report-wrap">
				<c:if test="${wriCheck eq 1 }">
				 	<button type="button" class="report-btn">
					 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-slash-circle" viewBox="0 0 16 16">
						  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
						  <path d="M11.354 4.646a.5.5 0 0 0-.708 0l-6 6a.5.5 0 0 0 .708.708l6-6a.5.5 0 0 0 0-.708z"/>
						</svg>
				 	신고하기
				 	</button>
				 </c:if>
		 	</div>
		</div>
		<h1 class="region-name">서울시 <c:out value="${pInfo.gu }"/></h1>
		<p class="description-category"><c:out value="${pInfo.category }"/> ㆍ
			<time><c:out value="${pInfo.posted_date }"/></time>
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
			<c:out value="${pInfo.contents }"/>
		</div>
	</div>
<!-- description end -->

<!-- comments -->
	<div class="comments-wrap">
		<div class="comments-txt-wrap">
			<p class="comments-txt">댓글</p>
			<p class="comments-cnt">${commCnt }개</p>
			<c:if test="${commCnt ne 0}">
				<div class="comments-align-wrap">
					<c:set var="comIndx" value="${empty param.comment_flag ? 0 : param.comment_flag }"/> 
					<ul class="comments-align">
						<li>
							<a ${comIndx eq 0 ? "class='comments-old'" : "class='comments-new'"} href="javascript:void(0);" value="0">등록순</a>
						</li>
						<li>
							<a ${comIndx eq 1 ? "class='comments-old'" : "class='comments-new'"} href="javascript:void(0);" value="1">최신순</a>
						</li>
					</ul>
				</div>
			</c:if>
		</div>
		<div class="comments-input-wrap">
			<div class="comments-input">
				<textarea rows="3" id="comments-txtarea" class="comments-txtarea" placeholder="댓글을 남겨보세요."></textarea>
			</div>
			
				<button type="button" id="comments-btn" type="button" class="comments-btn">
					<span>클릭</span>
				</button>
				
		</div>

		<c:if test="${commCnt eq 0}">
			<div class="comments-basic">
				<svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
					 <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
				</svg>
			</div>
		</c:if>

		<c:forEach var="setCom" items="${setCom }" varStatus="i">
		<c:choose>
			<c:when test="${setCom.reply_idx eq 0 && setCom.deleted eq 'Y'}">
				<div class="comments-sample-wrap">
					<p class="comments-content"><c:out value="${setCom.contents }" escapeXml="false"/></p>
				</div>
			</c:when>
			<c:when test="${setCom.reply_idx eq 0 }">
				<div class="comments-sample-wrap">
					<div class="comments-profile-wrap">
						 <div class="comments-profile-image-wrap">
					             <div class="comments-profile-image">
									<a class="profile-link" href="#void">
					               		<img alt="프로필이미지" src="${setCom.img }">
								   </a>
					             </div>
					             <div class="comments-profile-left">
					               <div class="comments-nickname"><c:out value="${setCom.nick }(${fn:substring(setCom.id,0,4) }****)"/>
					               <c:if test="${pInfo.id eq setCom.id }"><div class="writer">작성자</div></c:if></div>
					               <time class="comments-date"><c:out value="${setCom.posted_date }"/></time>
					           </div>
				    	 </div>
				   	</div>
		  
		   	
				   	<div class="comments-contents-wrap">
					    <p class="comments-content"><c:out value="${setCom.contents }" escapeXml="false"/></p>
					    <div class="comments-bottom">
					    	
					    	<c:choose>
						    	<c:when test="${sessionId eq setCom.id }"> <%-- 본인이 쓴 댓글 일 경우 --%>
							    		<button type="button" class="add-comments-btn" value="${setCom.comment_idx }">답글쓰기</button>
							    		<button type="button" class="modify-comments-btn">수정하기</button>
							    		<button type="button" id="del-com-btn" class="delete-comments-btn" value="${setCom.reply_idx }">삭제하기</button>
						    	</c:when>
						    	<c:when test="${sessionId ne setCom.id }"> <%-- 타인이 쓴 댓글 일 경우 --%>
							    		<button type="button" class="add-comments-btn" value="${setCom.comment_idx }">답글쓰기</button>
							    		<button type="button"class="report-comments-btn">신고하기</button>
						    	</c:when>
					   		</c:choose>
					   		
					    </div>
				   	</div>
				</div>
				
				<div class="re-comments-input-wrap" style="display: none">
					<div class="comments-input">
						<textarea rows="3" id="re-com-text" class="comments-txtarea" placeholder="답글을 남겨보세요."></textarea>
					</div>
					<button type="button"type="button" id="re-com-btn" class="comments-btn" value="${setCom.comment_idx }">
						<span>클릭</span>
					</button>
				</div>
		 	</c:when>
		 	
		<c:when test="${setCom.reply_idx ne 0 && setCom.deleted eq 'Y'}">
			<div class="re-comments-sample-wrap">
				<p class="comments-content"><c:out value="${setCom.contents }" escapeXml="false"/></p>
			</div>
		</c:when>
		
		<c:otherwise>
			<div class="re-comments-sample-wrap">
				<div class="comments-profile-wrap">
					 <div class="comments-profile-image-wrap">
				         <div class="comments-profile-image">
							<a class="profile-link" href="#void">
				               <img alt="프로필이미지" src="${setCom.img }">
							 </a>
				             </div>
				             <div class="comments-profile-left">
				               <div class="comments-nickname"><c:out value="${setCom.nick }"/>(<c:out value="${fn:substring(setCom.id,0,4) }****)"/>
				               <c:if test="${pInfo.id eq setCom.id }"><div class="writer">작성자</div></c:if></div>
				               <time class="comments-date">${setCom.posted_date }</time>
				           </div>
			    	 </div>
			   	</div>
			   	<div class="comments-contents-wrap">
				    <p class="comments-content"><c:out value="${setCom.contents }" escapeXml="false"/></p>
				    <div class="comments-bottom">
				    
					    <c:choose>
						    <c:when test="${sessionId eq setCom.id }"> <%-- 본인이 쓴 댓글 일 경우 --%>
							    	<button type="button" id="" class="modify-comments-btn">수정하기</button>
							    	<input type="hidden" id="hid-comidx" value="${setCom.comment_idx }">
							    	<button type="button" id="del-recom-btn" class="delete-comments-btn" value="${setCom.reply_idx }">삭제하기</button>
						    </c:when>
						    <c:when test="${sessionId ne setCom.id }"> <%-- 타인이 쓴 댓글 일 경우 --%>
							    	<button type="button"class="report-comments-btn">신고하기</button>
						   	</c:when>
					   	</c:choose>
					   	
				    </div>
			   	</div>
			</div>
		</c:otherwise>
		</c:choose>
		</c:forEach>
		
		
	</div>
<!-- comments end -->

<c:if test="${wriCheck eq 1 }">
<!-- product-bottom -->
	<div class="product-bottom-wrap">
		<div class="product-bottom-btn">
			<button type="button" class="modify-btn">
				<span>수정</span>
			</button>
			<button type="button" class="delete-btn">
				<span>삭제</span>
			</button>
		</div>
	</div>
<!-- product-bottom end-->
</c:if>

</div>
<!-- container end -->
<!-- 타사용자 프로필 -->
<form action="../../other_profiles/jsp/other_user_profile.jsp" id="otherFrm" method="post">
	<input type="hidden" name="id2" id="id2" value="${param.id2 }">
</form>
<%-- 하트기능 --%>
<form method="post" action="../../product/jsp/heart_process.jsp" id="heartFrm">
	<input type="hidden" name="product_idx" id="product_idx" value="${param.product_idx }">
	<input type="hidden" name="userId" id="userId" value="${param.userId }">
	<input type="hidden" name="flag" id="flag" value="${param.flag }">
</form>
<%-- 댓글 정렬 --%>
<form id="commFrm" method="get">
	<input type="hidden" name="comment_flag" id="comment_flag" value="${param.comment_flag }">
	<input type="hidden" name="product_idx" id="product_idx" value="${param.product_idx }">
</form>
<%-- 댓글 입력 기타 기능 --%>
<form method="get" action="../../product/jsp/comment_process.jsp" id="comProFrm">
	<input type="hidden" name="work" id="work" value="${param.work }">
	<input type="hidden" name="product_idx" id="product_idx" value="${param.product_idx }">
	<input type="hidden" name="comment_idx" id="comment_idx" value="${param.comment_idx }">
	<input type="hidden" name="reply_idx" id="reply_idx" value="${param.reply_idx }">
	<input type="hidden" name="user_id" id="user_id" value="${param.user_id }">
	<input type="hidden" name="contents" id="contents" value="${param.contents }">
</form>

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>
</body>
</html>