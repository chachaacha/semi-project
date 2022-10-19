<%@ page import="userVO.LoginVO" %>
<%@ page import="userDAO.LoginDAO" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자로그인</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_login.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	//로그인버튼을 클릭했을 때
    $("#btn").click(function () {
		//null 검사
    	chkNull(); 
    });
});
//필수 입력에 대한 체크 수행
	function chkNull(){
		//아이디에 입력한 값을 얻는다.
		var id=$("#id").val();
		if( id.trim() == ""){
			alert("아이디 필수 입력");
			$("#id").val("");
			$("#id").focus();
			return;
		}//end if
		
		//비밀번호에 입력한 값을 얻는다.
		if($("#password").val().trim() == ""){
			alert("비밀번호 필수 입력");
			$("#password").val("");
			$("#password").focus();
			return;
		}//end if
		
		$("#loginFrm").submit();
	} 
</script>
</head>
<!-- 세션무효화 -->
<% session.invalidate(); %>
<body>
 	<div class="wrap" style="margin-top: 150px;">
	<!-- header -->
	<!-- header end-->
	
	<!-- container -->
	<div class="container">

		<!-- 상단 로고 -->
		<div>
			<a href="../../mainhome/jsp/user_mainhome.jsp"><img src="../../images/logo.png" width="160" height="50" class="img"></a>
		</div>

		<form name="loginFrm" id="loginFrm" method="post" action="user_login_process.jsp">
		<!-- 로그인 박스 -->
		<div class="loginbox_wrap">
				<!-- 주황색박스 -->
				<div class="loginbox_top">LOGIN</div>
				<!-- 흰색박스  -->
				<div class="loginbox_main">
					<input type="text" placeholder="  아이디" size=60 class="id" name="id" id="id"> 
					<input type="password" placeholder="  비밀번호" size=60 class="pass" name="password" id="password">
					<input type="button" id="btn" value="로그인" class="loginBtn">
				<div>
					<div class="logpass">
						<img src="../../images/locklogin.png" style="height: 20px">
						<a href="user_find_id.jsp" style="text-decoration-line: none; color: #000;">아이디 
						</a> ㆍ <a href="user_find_pass.jsp" style="text-decoration-line: none; color: #000;">비밀번호찾기</a>
					</div>
					<div class="signup">
						<img src="../../images/userlogin.png" style="height: 20px;">
						<a href="user_join.jsp" style="text-decoration-line: none; color: #000;">회원가입</a>
					</div>
				</div>
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