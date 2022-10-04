<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리관리>상품 카테고리 관리</title>
<link rel="stylesheet" type="text/css" href="../../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../../common/css/manager_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/manager_product_management.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
</script>

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
<!-- 현재 메뉴 2 -->
	<div class="title">■ 상품 카테고리 관리</div>
	
<!-- 카테고리관리 -->
<div>
<!-- div1 -->
	<div style="margin:50px;">
	  	<select name="country" id="country" class="selectBox">
	    <option value="강남구" selected>현재 카테고리 현황</option>
	    <option value="강남구">출산/육아용품</option>
	    <option value="강동구">유아동 안전/실내용</option>
	    <option value="강북구">유아동 유아동의류</option>
	    <option value="강서구">유아동 유아동잡화</option>
	    <option value="관악구">유아동 유아동가구</option>
	    <option value="관악구">유아동 유아동교구/완구</option>
	    <option value="관악구">기타 유아동용품</option>
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