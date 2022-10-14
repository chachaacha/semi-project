<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 신원확인</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_mypage_in.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#chkBtn").click(function(){
		//비밀번호 유효성 검사
		if($("#password").val().trim() == ""){
			alert("비밀번호를 입력해주세요.");
			return;
		}
	
		$("#passChkFrm").submit();
	});//click
});//ready

</script>
</head>
<% 
// 세션 만료시 로그인화면으로 이동
	if(session.getAttribute("id")==null) {
		response.sendRedirect("../../login/jsp/user_login.jsp");
	}
%>
<body>
	<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->


		<!-- container -->
		<div class="container" style="background-color: #E9EDC9;">

			<!-- 아이콘이미지 -->
			<div style="margin: 0px auto; text-align: center;">
				<img src="../../images/lock.png"
					class="iconImg">
			</div>

			<!-- 안내 내용 -->
			<div class="msgBox">
				<p class="msg" style="padding-top: 30px">비공개 페이지입니다.</p>
				<p class="msg">비밀번호를 입력해주세요.</p>
			</div>

			<!-- 비밀번호 입력  -->
			<form action="user_mypage_in_process.jsp" method="post" id="passChkFrm">
			<div style="text-align: center; margin: 50px; display: flex; align-items: center; justify-content: center;">
				<input type="password" name="password" id="password" placeholder="비밀번호 입력" size="30" class="textBox">
					<input type="button" value="확인" class="gBtn" id="chkBtn"/>
			</div>
			</form>

			<!-- 메인으로 돌아가기 이동 -->
			<div style="display: block; margin: 0px auto; width: 150px">
				<p>
					<a href="../../mainhome/jsp/user_mainhome.jsp"
						class="linkText">메인으로 돌아가기</a>
				</p>
			</div>


		</div>
		<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

	</div>
</body>
</html>