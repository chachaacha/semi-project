<%@page import="userVO.ReportVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.ProfilDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/report_profile_popup.css"/>
<style type="text/css">
html {
	overflow: hidden;
}
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".report-wc-btn").click(function(){
		alert("신고가 접수되었습니다.")
		self.close();
	})
})
</script>
</head>
<body>
<div class="wrap">
	<h1 class="title">신고하기</h1>
	<div class="sub-title">사유선택</div>
	<div class="contents">
		<%
		//신고사유 조회
		ProfilDAO pDAO = ProfilDAO.getInstance();
		List<ReportVO> rList = pDAO.selectReport();
		pageContext.setAttribute("rList", rList);
		%>
		<ul>
			<c:forEach var="rList" items="${ rList }">
			<li><input type="radio" name="report" class="report-wc-radio" value="${ rList.rr_idx }"><c:out value="${ rList.contents }"/> </li>
			</c:forEach>
		</ul>
	</div>
	<button type="button" class="report-wc-btn">신고하기</button>
</div>

<!-- 신고 프로세스 -->
<c:if test="${ not empty param.rr_idx }">
<jsp:useBean id="buVO" class="userVO.BlockUVO"></jsp:useBean>
<jsp:setProperty property="id" name="buVO" value="${ id }"/>
<jsp:setProperty property="block_id" name="buVO"/>
<jsp:setProperty property="block_date" name="buVO"/>
<!-- 이미 신고된 회원은 무결성조건에 대한 예외가 발생하기 때문에 이를 잡아준다. -->
<c:catch var="integrityChk">
<% pDAO.insertBlock(buVO); %>
</c:catch>
<c:if test="${ not empty integrityChk }">
<script type="text/javascript">
	alert("이미 신고된 아이디 입니다.");
	self.close();
	</script> 
</c:if>
	<script type="text/javascript">
	alert("신고처리 했습니다.");
	self.close();
	</script>
</c:if>
</body>
</html>