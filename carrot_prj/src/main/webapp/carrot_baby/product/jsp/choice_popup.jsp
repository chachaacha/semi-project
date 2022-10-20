<%@page import="userVO.UserCommentVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매자 선택</title>
<link rel="stylesheet" type="text/css" href="../css/choice_popup.css"/>
<jsp:useBean id="ucVO" class="userVO.UserCommentVO" scope="page"/>
<jsp:useBean id="bVO" class="userVO.BuyVO" scope="page"/>
<jsp:setProperty property="*" name="ucVO"/>
<jsp:setProperty property="*" name="bVO"/>
<style type="text/css">
html {
	overflow: hidden;
}
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".choice-btn").click(function(){
		
		var buyerVal=$('input:radio[name="report"]:checked').val();
		
		if(buyerVal!=null) {
			$("#buyer_id").val(buyerVal);
			$("#buyerFrm").submit();
		}else {
			alert("선택하신 구매자가 없습니다");
			self.close();
		}
	})
})
</script>
<%
//세션 아이디 얻기
String sessionId=(String)session.getAttribute("id");
pageContext.setAttribute("sessionId", sessionId);

//BoardDAO 생성
BoardDAO bDAO=BoardDAO.getInstance();

String product_idx=request.getParameter("product_idx");

//거래완료 구매자 리스트 불러오기
List<UserCommentVO> selCom=bDAO.selectTrader(product_idx);
pageContext.setAttribute("selCom", selCom);

int cnt=selCom.size();
pageContext.setAttribute("cnt", cnt);

String buyer_id=request.getParameter("buyer_id");

if(buyer_id!=null){
	bDAO.updateTrader(bVO);
%>
	<script type="text/javascript">
	alert("구매자 선택이 완료되었습니다.");
	self.close();
</script>
<%
}
%>
</head>
<body>
<div class="wrap">
	<h1 class="title">구매자 선택</h1>
	<div style="padding: 20px 20px; "><!--  -->
<div style="text-align: center;"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
</svg></div>
<div class="text">
<span>거래가 완료됐어요.</span><br>
<span>구매자를 선택해주세요.</span>
</div>
</div><!--  -->
	<div class="contents">
		<ul>
			<c:if test="${cnt eq 0}">
			<li style="display: flex; justify-content: center;">불러올 구매자가 없습니다.</li>
			</c:if>
			<c:forEach var="comList" items="${selCom}">
			<%-- <c:set var="size" value="${fn:length(comList) }"/> --%>
			<c:choose>
				<c:when test="${comList.id ne  sessionId}">
					<li><input type="radio" value="${comList.id }" name="report" class="report-wc-radio">
					<img alt="프로필이미지"src="../../user_profile_upload/${comList.img }" class="profile-img"> <c:out value="${comList.nick}"/>(<c:out value="${fn:substring(comList.id,0,4) }****"/>)</li>
				</c:when>
				<c:when test="${fn:length(selCom)==0 } ">
					<li style="display: flex; justify-content: center;">불러올 구매자가 없습니다.</li>
				</c:when> 
			</c:choose>
			<%-- <c:if test="${fn:length(selCom)==0 } ">
					<li style="display: flex; justify-content: center;">불러올 구매자가 없습니다.</li>
				</c:if> --%>
			<%-- <c:if test="${comList.id ne  sessionId}">
			<li><input type="radio" value="${comList.id }" name="report" class="report-wc-radio">
			<img alt="프로필이미지"src="../../user_profile_upload/${comList.img }" class="profile-img"> <c:out value="${comList.nick}"/>(<c:out value="${fn:substring(comList.id,0,4) }****"/>)</li>
			</c:if>--%>
			</c:forEach> 
		</ul>
	</div>
	<button type="button" class="choice-btn">확인</button>
</div>
<form method="post" id="buyerFrm">
	<input type="hidden" name="buyer_id" id="buyer_id" value="${param.buyer_id }">
	<input type="hidden" name="product_idx" id="product_idx" value="${param.product_idx }">
</form>
</body>
</html>