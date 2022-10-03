<%@page import="managerDAO.HomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인화면</title>
<link rel="stylesheet" type="text/css" href="../../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../../common/css/manager_wrap_container.css"/>
<link rel="stylesheet" media="all" href="../css/manager_mainhome.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../../manager/m_common/manager_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">

<div class="main">

<!-- 현재 메뉴 -->
		<div style="display: flex;border-bottom: 1px solid grey;align-items: center;">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi-house-fill" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
				  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
				</svg>
			<span class="text">홈</span>
		</div>
<!-- 현재 메뉴 -->
<!-- 대시보드 -->
<%-- --------------------------------------------------------jsp코드 영역------------------------------------------------------------------- --%>
<jsp:useBean id="hdVO1" class="managerVO.HomeDealVO"></jsp:useBean>
<jsp:useBean id="hdVO2" class="managerVO.HomeDealVO"></jsp:useBean>
<jsp:useBean id="hdVO3" class="managerVO.HomeDealVO"></jsp:useBean>

<% 
	// 세션만료시 로그인화면으로 복귀
	if(session.getAttribute("manager_id")==null) {
		response.sendRedirect("../../login/jsp/manager_login.jsp");
	}
	
	HomeDAO hDAO = HomeDAO.getInstance();
	hdVO1= hDAO.selectDeal1();
	hdVO2= hDAO.selectDeal2();
	hdVO3= hDAO.selectDeal3();
	
	int newMem = hDAO.selectMember1();
	int quitMem = hDAO.selectMember2();
	int totalMem = hDAO.selectMember3();
%>
<%-- --------------------------------------------------------jsp코드 영역------------------------------------------------------------------- --%>

		<div class="title">■ 오늘의 거래 현황</div>

		<div>
		 <table class="table">
    <caption>오늘의 거래 현황</caption>
    <tr><th>No.</th><th>거래 종류</th><th>거래 수량(건)</th><th>거래 금액(원)</th></tr>
    <tr><td>1</td><td>판매</td><td>3</td><td>30,000</td></tr>
    <tr><td>2</td><td>구매</td><td>4</td><td>40,000</td></tr>
    <tr><td>3</td><td>무료나눔</td><td>1</td><td>0</td></tr>
  </table>  
			<hr>
		</div>

		<div class="title">■ 거래완료 현황</div>
		<div>
		 <table class="table">
    <caption>거래완료 현황</caption>
    <tr><th>No.</th><th>기간</th><th>거래완료 수량(건)</th><th>거래 금액(원)</th></tr>
    <tr><td>1</td><td>어제</td><td><%= hdVO2.getDoneDeal() %></td><td><%= hdVO2.getAmount() %></td></tr>
    <tr><td>2</td><td>오늘</td><td><%= hdVO1.getDoneDeal() %></td><td><%= hdVO1.getAmount() %></td></tr>
    <tr><td>3</td><td>1주간</td><td><%= hdVO3.getDoneDeal() %></td><td><%= hdVO3.getAmount() %></td></tr>
  </table>  
			<hr>
		</div>
		
		<div class="title">■ 오늘의 회원 현황</div>
		<div>
		 <table class="table">
    <caption>오늘의 회원 현황</caption>
    <tr><th>No.</th><th>회원관리</th><th>인원(명)</th>
    <tr><td>1</td><td>신규회원</td><td><%= newMem %></td></tr>
    <tr><td>2</td><td>탈퇴회원</td><td><%= quitMem %></td></tr>
    <tr><td>3</td><td>전체회원 수</td><td><%= totalMem %></td></tr>
  </table>  
			<hr>
		</div>
<!-- 대시보드 -->
		

</div><!-- wrap  -->
</div><!-- container end -->

<!-- footer -->
<%@ include file="../../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div>

</body>
</html>