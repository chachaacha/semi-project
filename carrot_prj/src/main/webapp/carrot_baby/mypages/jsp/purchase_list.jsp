<%@page import="userDAO.BuyListDAO"%>
<%@page import="userVO.BuyListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="userVO.BuyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/purchase_list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
//...버튼 누르면 글 삭제할건지 물어보는 팝업창 열기
$(function() {
	$(".edit_del_btn").click(function() {
		confirm("게시글을 정말 삭제하시겠어요?")
	})
})
</script>

</head>
<% 
// 세션 만료시 로그인화면으로 이동
	if(session.getAttribute("id")==null) {
		response.sendRedirect("../../login/jsp/user_login.jsp");
	}
%>
<body>
<!-- VO객체 생성 -->
<jsp:useBean id="blVO" class="userVO.BuyListVO"></jsp:useBean>
<!-- session에 저장된 아이디를 구매자 아이디로 설정 -->
<jsp:setProperty property="buyer_id" name="blVO" value="${ id }"/>
<jsp:setProperty property="product_idx" name="blVO"/>
<jsp:setProperty property="thumbnail" name="blVO"/>
<jsp:setProperty property="title" name="blVO"/>
<jsp:setProperty property="gu" name="blVO"/>
<jsp:setProperty property="sold_check" name="blVO"/>
<jsp:setProperty property="posted_date" name="blVO"/>
<jsp:setProperty property="comment_cnt" name="blVO"/>
<jsp:setProperty property="liked_cnt" name="blVO"/>
<jsp:setProperty property="price" name="blVO"/>

<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<!-- 1 -->
<div class="container">
<%@ include file="myinfo_navi.jsp" %>

<%
String id = (String)session.getAttribute("id");
BuyListDAO blDAO=BuyListDAO.getInstance();
List<BuyListVO> blList=blDAO.selectBL(id);

//스콥객체에 할당
pageContext.setAttribute("blList", blList);
%>

<div class="purchase_list_title_wrap">
<c:forEach var="bl" items="${ blList }">
	<div class="purchase_list_title">구매내역</div>
	<div class="purchase_list_item">
		<div class="purchase_list_img">
		<!-- 이미지 클릭시 해당 페이지로 이동 -->
		<a href="">
			<img alt="이미지 자리" src="${bl.thumbnail}">
		</a>
				<div class="purchase_list_border">
				<div class="pl_title"><c:out value="${ bl.title }"/>
					<button class="edit_del_btn" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  						<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  						<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
					</button>
					<div class="dong_date"><c:out value="${ bl.gu }"/> ㆍ <c:out value="${ bl.posted_date }"/> </div><!-- dong_date -->
							<div class="btn_price">
								<button class="complete_btn" type="button">
								<c:choose>
								<c:when test="${bl.sold_check eq 'Y' }">
										판매완료
								</c:when>
								<c:when test="${bl.sold_check eq 'N' }">
										판매중
								</c:when>
								</c:choose>
								</button>
								<div class="price"><fmt:formatNumber pattern="#,###,###" value="${ bl.price }"/>원</div>
						</div><!-- "btn_price" -->
	
	</div><!-- pl_title -->
	</div><!-- purchase_list_border-->
	</div><!-- purchase_list_img -->
	</div><!-- purchase_list_item -->
</c:forEach>
<c:if test="${ empty onSale  }" >
	구매하신 상품이 없습니다.
</c:if>
</div> <!-- 컨테이너 div -->
</div><!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div>
</body>
</html>