<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리관리>지역관리</title>
<link rel="stylesheet" type="text/css" href="../../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../../common/css/manager_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/manager_local_management.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<% 
// 세션만료시 로그인화면으로 복귀
	if(session.getAttribute("manager_id")==null) {
		response.sendRedirect("../../login/jsp/manager_login.jsp");
	}
%>
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
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi-filter-left" viewBox="0 0 16 16">
		<path d="M2 10.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/></svg>		
		<span class="text">카테고리 관리</span>
	</div>
<!-- 현재 메뉴 -->
		<div class="title">■ 지역관리</div>
		
<!-- 지역관리 -->
<div>
<!-- div1 -->
<div style="margin:50px;">
	<select name="country" id="country" class="selectBox">
    <option value="강남구">현재 지역 현황</option>
    <option value="강남구">강남구</option>
    <option value="강동구">강동구</option>
    <option value="강북구">강북구</option>
    <option value="강서구">강서구</option>
    <option value="관악구">관악구</option>
    <option value="광진구">광진구</option>
    <option value="구로구">구로구</option>
    <option value="금천구">금천구</option>
    <option value="노원구">노원구</option>
    <option value="도봉구">도봉구</option>
    <option value="동대문구">동대문구</option>
    <option value="동작구">동작구</option>
    <option value="마포구">마포구</option>
    <option value="서대문구">서대문구</option>
    <option value="서초구">서초구</option>
    <option value="성동구">성동구</option>
    <option value="성북구">성북구</option>
    <option value="송파구">송파구</option>
    <option value="양천구">양천구</option>
    <option value="영등포구">영등포구</option>
    <option value="용산구">용산구</option>
    <option value="은평구">은평구</option>
    <option value="종로구">종로구</option>
    <option value="중구">중구</option>
    <option value="중랑구">중랑구</option>
  </select>
</div>
<!-- 대시보드 -->
</div>

</div><!-- main -->
</div><!-- container end -->

<!-- footer -->
<%@ include file="../../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div><!-- wrap  -->

</body>
</html>