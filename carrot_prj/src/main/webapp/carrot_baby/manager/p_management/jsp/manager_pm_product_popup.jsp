<%@page import="managerVO.MangerCommentVO"%>
<%@page import="java.util.List"%>
<%@page import="managerDAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
});

function deleteComm(proIdx, commIdx, repIdx, del) {
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="manager_pm_product_popup.jsp?product_idx="+proIdx+"&comment_idx="+commIdx+"&reply_idx="+repIdx+"&deleted="+del;
	} else {
		location.href="manager_pm_product_popup.jsp?product_idx=${ param.product_idx }";
	}
		
};

</script>
</head>
<body>
<%-- 상품정보 불러오기 --%>
<jsp:useBean id="bVO" class="managerVO.BoardVO"></jsp:useBean>
<% 
BoardDAO bDAO = BoardDAO.getInstance(); 
bVO = bDAO.selectB(request.getParameter("product_idx"));
String idPlusNick = bVO.getNick() +"(" + bVO.getId().substring(0, 4)+"****"+")";
pageContext.setAttribute("bVO", bVO);
pageContext.setAttribute("idPlusNick", idPlusNick);
%>

<%-- 게시글 댓글정보 불러오기 --%>
<jsp:useBean id="mcVO" class="managerVO.MangerCommentVO"/>
<%
List<MangerCommentVO> commList = bDAO.selectComm(request.getParameter("product_idx"));
pageContext.setAttribute("commList", commList);
%>

<div class="wrap">
<!-- product-img -->
	<div class="product-img">
		<div class="swiper mySwiper">
	     	<div class="swiper-wrapper">
	       		<div class="swiper-slide">
	       			<div class="main-top-img-wrap">
	       				<!-- 추후 섬네일, 이미지 구현  -->
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
		                <img alt="프로필이미지" src="../../../images/${ bVO.img }">
		              </div>
		              <div class="article-profile-left">
		                <div class="nickname"><c:out value="${ idPlusNick }"/></div>
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
			 <div class="heart-cnt-txt"><c:out value="${ bVO.liked_cnt }"/></div>
		 </div>
		</div>
		 <div class="state">
		 <c:choose>
		 <c:when test="${ bVO.reserved eq 'Y' }">
		 예약중
		 </c:when>
		 <c:when test="${ bVO.sold_check eq 'Y' }">
		 판매완료
		 </c:when>
		 <c:otherwise>
		 판매중
		 </c:otherwise>
		 </c:choose>
		 </div>
		</div>

	</div>
<!-- profile end -->

<!-- description -->
	<div class="description-wrap">
		<h1 class="description-title"><c:out value="${ bVO.title }"/></h1>
		<h1 class="region-name"><c:out value="${ bVO.gu }"/></h1>
		<p class="description-category"><c:out value="${ bVO.category }"/>
			<time><fmt:formatDate pattern="yyyy-MM-dd" value="${ bVO.posted_date }"/></time>
		</p>
		<p class="description-price"><c:out value="${ bVO.price }"/>
		</p>
		<div class="description-detail">
			<p>
				<c:out value="${ bVO.contents }"/>
			</p>
		</div>
	</div>
<!-- description end -->

<!-- comments -->
	<div class="comments-wrap">
		<div class="comments-txt-wrap">
			<p class="comments-txt">댓글</p>
			<p class="comments-cnt"><c:out value="${ bVO.comment_cnt }"/></p>
		</div>
		
		<%-- 댓글, 대댓글 불러오기 --%>
		<c:forEach var="commList" items="${ pageScope.commList }">
		
		<c:choose>
		<%-- 댓글 불러오기 --%>
		<c:when test="${ commList.reply_idx eq 0 }">
		<div class="comments-sample-wrap">
			<div class="comments-profile-wrap">
				 <div class="comments-profile-image-wrap">
			             <div class="comments-profile-image">
			               <img alt="프로필이미지" src="../../../images/${ commList.img }">
			             </div>
			             <div class="comments-profile-left">
			               <div class="comments-nickname"><c:out value="${ commList.idPlusNick }"/><c:if test="${ bVO.id eq commList.id }"><div class="writer">작성자</div></c:if></div>
			               <time class="comments-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${ commList.posted_date }"/></time>
			           </div>
		    	 </div>
		       <%-- <a href="manager_pm_product_popup.jsp?product_idx=${ param.product_idx }&comment_idx=${ commList.comment_idx }&reply_idx=${ commList.reply_idx }"> --%>
		       <a href="javascript:deleteComm('${ param.product_idx }','${ commList.comment_idx }','${ commList.reply_idx  }','${ commList.deleted }')">
			   <button type="button" class="delete-icon-btn">
				   <svg  class="delete-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
						<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
					</svg>
				</button>
				</a>
		   	</div>
		   	<div class="comments-contents-wrap">
			    <p class="comments-content"><c:out value="${ commList.contents }"/></p>
		   	</div>
		</div>
		</c:when>
		
		<c:otherwise>
		<%-- 대댓글 불러오기 --%>
		<div class="re-comments-sample-wrap">
			<div class="comments-profile-wrap">
				 <div class="comments-profile-image-wrap">
			             <div class="comments-profile-image">
			               <img alt="프로필이미지" src="../../../images/${ commList.img }">
			             </div>
			             <div class="comments-profile-left">
			               <div class="comments-nickname"><c:out value="${ commList.idPlusNick }"/><c:if test="${ bVO.id eq commList.id }"><div class="writer">작성자</div></c:if></div>
			               <time class="comments-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${ commList.posted_date }"/></time>
			           </div>
		    	 </div>
		       <a href="javascript:deleteComm('${ param.product_idx }','${ commList.comment_idx }','${ commList.reply_idx  }','${ commList.deleted }')">
			   <button type="button" class="delete-icon-btn">
				   <svg  class="delete-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
						<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
					</svg>
				</button>
				</a>
		   	</div>
		   	<div class="comments-contents-wrap">
			    <p class="comments-content"><c:out value="${ commList.contents }"/></p>
		   	</div>
		</div>
		</c:otherwise>
		</c:choose>
		</c:forEach>
		
		<%-- 댓글삭제처리 --%>
		<%-- 삭제여부도 가져와서 삭제누르면 삭제된 것은 삭제하지 못하게 처리해주는 것 추가하기 --%>
		<c:choose>
		<c:when test="${ not empty param.comment_idx and not empty param.reply_idx and param.deleted eq 'Y' }">
		<script type="text/javascript">
		alert("이미 삭제된 댓글입니다.");
		location.href="manager_pm_product_popup.jsp?product_idx=${ param.product_idx }";
		</script>
		</c:when>
		<c:when test="${ not empty param.comment_idx and not empty param.reply_idx }">
		<jsp:useBean id="mcdVO" class="managerVO.MangerCommentVO"></jsp:useBean>
		<jsp:setProperty property="product_idx" name="mcdVO" value="${ param.product_idx }"/>
		<jsp:setProperty property="comment_idx" name="mcdVO" value="${ param.comment_idx }"/>
		<jsp:setProperty property="reply_idx" name="mcdVO" value="${ param.reply_idx }"/>
		<% bDAO.updateDropC(mcdVO); %>
		<script type="text/javascript">
		location.href="manager_pm_product_popup.jsp?product_idx=${ param.product_idx }";
		alert("삭제되었습니다.");
		</script>
		</c:when>
		</c:choose>
	</div>
<!-- comments end -->

<!-- product-bottom -->
	<div class="product-bottom-wrap">
		<div class="product-bottom-btn">
			<button type="button" class="modify-btn">
				<span>글 삭제</span>
			</button>
			<button type="button" class="delete-btn">
				<span>이전</span>
			</button>
		</div>
	</div>
<!-- product-bottom end-->
</div>

</div>
</body>
</html>