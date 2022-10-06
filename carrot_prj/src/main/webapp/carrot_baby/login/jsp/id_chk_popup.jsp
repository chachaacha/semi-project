<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<link rel="stylesheet" type="text/css" href="../css/id_chk_popup.css"/>
<style type="text/css">
html {
	overflow: hidden;
}
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".chkBtn").click(function(){
	 	alert("사용 가능한 아이디입니다.")
	});
	
	$(".idBtn").click(function(){
		self.close();
	});
});



</script>
</head>
<body>
<div class="wrap">
	<h1 class="title">아이디 중복확인</h1>
	<!-- 1 -->
	<div style="padding: 30px 20px; ">
	<div>
		<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		<path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></svg> 
		<span>아이디는 영문(소문자), 숫자로 4~16자 이내로 입력해주세요.</span><br>
	</div>
	</div>
	<!-- 2 -->
	<form method="post" action="id_chk_popup_process.jsp">  
	<div class="contents">
		<input type="text" size="30" class="idText"><input type="button" value="중복확인" class="chkBtn">
	</div>
	</form>
	<!-- 3 -->
	<div class="msg">
		<span>공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.</span><br>
		<span>숫자로 시작하거나, 숫자로만 이루어진 아이디는 사용할 수 없습니다.</span><br>
	</div>
	
	<!-- 끝 -->
	<button type="button" class="idBtn">사용하기</button>
</div>
</body>
</html>