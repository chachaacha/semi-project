<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디</title>
<link rel="stylesheet" type="text/css" href="../css/find_id_popup.css"/>
<style type="text/css">
html {
	overflow: hidden;
}
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
<div class="wrap">
	<div class="text">
		<span>회원님의 아이디는</span><br>
		<span>babycarrot</span><br>
		<span>입니다.</span>
	</div>
	
	<div>
		<button type="button" class="window-btn">확인</button>
	</div>
</div>
</body>
</html>