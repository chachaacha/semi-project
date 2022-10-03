<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_find_id.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
    $("#chkBtn").click(function () {
	/* 	//null 검사
    	chkNull(); */
		//본인 아이디확인 팝업창 열기
		window.open("find_id_popup.jsp","",
		"width=385,height=235,top=380,left=750");
    });
});

</script>
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
				<a href="../../mainhome/jsp/user_mainhome.jsp"><img src="../../images/logo.png" class="logoImg"></a>
			</div>

			<!-- 아이디찾기 안내문 -->
			<div class="iconBox">
				<img src="../../images/id.png" class="idImg" style="vertical-align: middle;">
				<span class="idText">아이디찾기</span>
			</div>
			<div
				style="display: block; width: 270px; margin: 0px auto; padding-top: 10px">
				<p>아이디를 모르시나요?</p>
				<p>아래의 정보를 입력해주세요.</p>
			</div>

			<!--정보 입력 -->
			<div class="infoBox">
				<img src="../../images/check.png" class="infoImg" style="vertical-align: middle;">
				<span class="infoText">이름 / 생년월일/ 휴대폰으로 찾기</span>
				<div style="margin: 30px">
					<input type="text" placeholder="이름 입력" size="18" class="textBox" id="name">
					<input type="text" placeholder="생년월일 입력" size="18" class="textBox" id="birth"><br>
					<input type="text" placeholder="휴대폰번호 입력" size="46" class="textBox" id="tel" style="margin: 5px">
				</div>
			</div>

			<!-- 확인 취소 버튼  -->
			<div style="text-align: center; margin: 30px;">
				 <input type="button" value="확인" class="oBtn" id="chkBtn">
				 <a href="../../mainhome/jsp/user_mainhome.jsp"><input type="button" value="취소" class="gBtn"></a>
			</div>

		</div>
		<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>

</body>
</html>