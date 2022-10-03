<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_signup_comp.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<body>
	<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->


		<!-- container -->
		<div class="container" style="background-color: #E9EDC9;">

			<!-- 상단 로고 -->
			<div>
				<a href="../../mainhome/jsp/user_mainhome.jsp"><img
					src="../../images/logo.png" class="logoImg"></a>
			</div>

			<!-- 아이콘이미지 -->
			<div style="margin: 0px auto; text-align: center;">
				<img src="../../images/task.png"
					class="icon">
			</div>

			<!-- 메세지 -->
			<div class="msg">
				<p class="msg1">회원가입이 완료되었습니다.</p>
				<p>애기당근 홈페이지에 가입해주셔서 감사합니다.</p>
				<p>로그인 후 다양한 서비스를 이용하실 수 있습니다.</p>
			</div>

			<!-- 확인 취소 버튼  -->
			<div style="text-align: center; margin: 50px;">
				<a href="user_login.jsp"> <input
					type="button" value="로그인" class="oBtn"></a> <a
					href="../../mainhome/jsp/user_mainhome.jsp"> <input
					type="button" value="처음으로" class="gBtn"></a>
			</div>

		</div>
		<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

	</div>

</body>
</html>