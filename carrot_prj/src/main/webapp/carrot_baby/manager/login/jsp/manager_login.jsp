<%@page import="managerVO.LoginVO"%>
<%@page import="managerDAO.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자로그인</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../../common/css/manager_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/manager_login.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	//아이디 비번 입력 유효성 검증
	$("#btn").click(function() {
		if($(".id").val().trim()=="") {
			alert("아이디를 입력하세요");
			return;
		}
		if($(".pass").val().trim()=="") {
			alert("비밀번호를 입력하세요");
			return;
		}
		$("#loginFrm").submit();
	});
});
</script>
</head>
<% 
//로그인 홈으로 오면 세션만료
session.invalidate();
%>
<body>
	<div class="wrap" style="margin-top: 150px;">

		<!-- header -->
		<!-- header end-->

		<!-- container -->
		<div class="container">

			<!-- 상단 로고 -->
			<div>
				<a href="../../../mainhome/jsp/user_mainhome.jsp">
				<img 	src="../../../images/logo.png" width="160" height="50" class="img"></a>
			</div>

			<!-- 로그인 박스 -->
			<form method="post" id="loginFrm" action="manager_login_process.jsp">
			<div class="loginbox_wrap">

				<!-- 주황색박스 -->
				<div class="loginbox_top">MANAGER LOGIN</div>
				<!-- 흰색박스  -->
				<div class="loginbox_main">
					<input type="text" placeholder="  아이디" size=60 class="id" name="manager_id"> 
					<input type="password" placeholder="  비밀번호" size=60 class="pass" name="password">
					<input type="button" id="btn" value="로그인" class="loginBtn">
				</div>

			</div>
			</form>
			<!-- 로그인 박스 끝 -->
		</div>
		<!-- container end -->

		<!-- footer -->
		<!-- footer end -->
	</div>
</body>
</html>