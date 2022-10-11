<%@ page import="userDAO.FindPwDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호</title>
<link rel="stylesheet" type="text/css" href="../css/find_pass_popup.css"/>
<style type="text/css">
html { overflow: hidden; }
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".window-btn").click(function(){
		self.close();
	})
})
</script>
</head>
<body>
<%-- <jsp:useBean id="fVO" class="userVO.FindPwVO"></jsp:useBean>
<jsp:setProperty property="*" name="fVO"/> --%>

<div class="wrap">
	<div class="text">
		<span>회원님의 임시비밀번호는</span><br>
		<span><c:out value="${ tempPass }"/></span><br>
		<span>입니다.</span>
	</div>
	
	<div>
		<button type="button" class="window-btn">확인</button>
	</div>
</div>
</body>
</html>