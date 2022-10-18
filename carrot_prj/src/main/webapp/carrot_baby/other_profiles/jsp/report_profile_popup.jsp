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
	//신고하기 버튼 클릭
	$(".report-wc-btn").click(function(){
		var idx=$("[name='rr_idx']:checked").val();
		if(idx==null){
			alert("신고사유를 선택하세요.");
		};
		$("#reportFrm").submit();
		
	});//click
});//ready
</script>
</head>
<body>
<form method="post" id="reportFrm">
<input type="hidden" name="id" value=${ param.id }/> <!-- 사용자페이지에서 post방식으로 넘겨받은 아이디를 다시 히든으로 submit한다. -->
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
			<li><input type="radio" name="rr_idx" class="report-wc-radio" value="${ rList.rr_idx }"><c:out value="${ rList.contents }"/> </li>
			</c:forEach>
		</ul>
	</div>
	<button type="button" class="report-wc-btn">신고하기</button>
</div>
</form>

<!-- 신고 프로세스 -->
<c:if test="${ not empty param.rr_idx }"> <!-- 처음에는 진입시에는 submit하지 않았기 때문에 웹파라메터가 없다. 웹 파마메터가 있을 때만 동작하게 한다. -->

<jsp:useBean id="rmVO" class="userVO.ReportMVO"/>
<jsp:setProperty property="id" name="rmVO" value="${ id }"/>
<jsp:setProperty property="reported_id" name="rmVO" value="${ param.id }"/>
<jsp:setProperty property="rr_idx" name="rmVO" value="${param.rr_idx }"/> <!-- form을 이 페이지로 보내고 있기 때문에 param으로 받는다. -->

<% 
//이전에 해당 아이디를 신고한 적이 있는지 조회
boolean flag=pDAO.selectReportedId(rmVO);

if(flag==false){//신고한 적이 없으면
pDAO.insertReportM(rmVO);

//신고 수 업데이트
String id=request.getParameter("id");
pDAO.updateRU(id);
%>
	<script type="text/javascript">
	alert("신고가 접수되었습니다.");
	//팝업창 닫으면서 사용자페이지 새로고침
	opener.window.location.reload();
	self.close();
	</script>

<%  } else{//신고한 적이 있으면
%>
	<script type="text/javascript">
	//이미 신고했을 시 경고창을 보여주고 팝업창 종료.
	alert("이미 신고된 아이디 입니다.");
	self.close();
	</script>
<%}%>

</c:if>
</body>
</html>