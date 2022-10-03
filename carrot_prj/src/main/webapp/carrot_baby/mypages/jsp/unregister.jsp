<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel ="stylesheet" type="text/css" href="../css/unregister.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".ok-btn").click(function() {
		if(confirm("정말 탈퇴하시겠습니까?")) {
			alert("탈퇴가 완료되었습니다.");
		}
	})
})
</script>
</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_logout_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">
<%@ include file="myinfo_navi.jsp" %>
				
		<div class="unregister_title">회원 탈퇴</div>
	<div class="unregister_logo"><img src="../../images/unregister.png"> </div>
	<div class="unregister_msg">탈퇴를 하시면 회원의 개인정보가 삭제됩니다.</div>
	<div class="unregister_msg2">다시한번 비밀번호를 정확하게 기입하시고 탈퇴신청을 해주시기 바랍니다.<br><br>
										  <p>그동안 애기당근을 이용해주셔서 진심으로 감사합니다.</p></div>
	<div class="password_input"><img src="../../images/unregister_lock.png">
			<input type="password" placeholder="비밀번호 입력" style="width: 200px; height: 25px;"></div>
	<button type="button" class="ok-btn">회원탈퇴</button>
</div> <!-- container div -->
<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div>

</body>
</html>