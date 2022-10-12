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
	//신고하기 버튼 클릭 시 서브밋
	$(".report-wc-btn").click(function(){
		var idx=$("[name='rr_idx']:checked").val();
		if(idx==null){
			alert("신고사유를 선택하세요.");
		};
		$("#reportFrm").submit();
	})
})
</script>
</head>
<body>
<form method="post" id="reportFrm">
<input type="hidden" name="id" value=${ id }/> <!-- 게시글에서 post방식으로 넘겨받은 아이디를 다시 히든으로 submit한다. -->
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
</form>

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
	//이미 신고했을 시 경고창을 보여주고 팝업창 종료.
	alert("이미 신고된 아이디 입니다.");
	self.close();
	</script> 
</c:if>
	<script type="text/javascript">
	//예외가 발생하지 않은 경우 신고되지 않은 회원이기 때문에 신고한다.
	alert("신고가 접수되었습니다.");
	self.close();
	</script>
</c:if>
</body>
</html>