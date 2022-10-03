<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/report_write_comments_popup.css"/>
<style type="text/css">
html {
	overflow: hidden;
}
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".report-wc-btn").click(function(){
		alert("신고가 접수되었습니다.")
		self.close();
	})
})
</script>
</head>
<body>
<div class="wrap">
	<h1 class="title">신고하기</h1>
	<div class="sub-title">사유선택</div>
	<div class="contents">
		<ul>
			<li><input type="radio" name="report" class="report-wc-radio">스팸홍보/도배글입니다.</li>
			<li><input type="radio" name="report" class="report-wc-radio">음란물입니다.</li>
			<li><input type="radio" name="report" class="report-wc-radio">불법정보를 포함하고 있습니다.</li>
			<li><input type="radio" name="report" class="report-wc-radio">청소년에게 유해한 내용입니다.</li>
			<li><input type="radio" name="report" class="report-wc-radio">욕설/생명경시/혐오/차별적 표현입니다.</li>
			<li><input type="radio" name="report" class="report-wc-radio">개인정보 노출 게시물입니다.</li>
			<li><input type="radio" name="report" class="report-wc-radio">불쾌한 표현이 있습니다.</li>
		</ul>
	</div>
	<button type="button" class="report-wc-btn">신고하기</button>
</div>
</body>
</html>