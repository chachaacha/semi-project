<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/report_profile_popup.css"/>
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
			<li><input type="radio" name="report" class="report-wc-radio">전문 판매업자 같아요.</li>
			<li><input type="radio" name="report" class="report-wc-radio">비매너 사용자에요.</li>
			<li><input type="radio" name="report" class="report-wc-radio">사기당했어요.</li>
			<li><input type="radio" name="report" class="report-wc-radio">성희롱을 해요.</li>
			<li><input type="radio" name="report" class="report-wc-radio">연애 목적의 대화를 시도해요.</li>
			<li><input type="radio" name="report" class="report-wc-radio">거래/환불 분쟁 신고</li>
			<li><input type="radio" name="report" class="report-wc-radio">다른 문제가 있어요.</li>
		</ul>
	</div>
	<button type="button" class="report-wc-btn">신고하기</button>
</div>
</body>
</html>