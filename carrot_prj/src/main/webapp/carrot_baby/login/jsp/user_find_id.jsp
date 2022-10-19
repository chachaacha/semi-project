<%@ page import="userDAO.FindIdDAO" %>
<%@ page import="userVO.FindIdVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
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
//생년월일 하이픈입력
const birthHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-8]/g, '')
	   .replace(/^(\d{4})(\d{2})(\d{2})$/, `$1-$2-$3`);
}

//전화번호 하이픈입력
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

$(function () {
    $("#chkBtn").click(function () {

	//필수 입력에 대한 체크 수행
	if ($("#name").val().trim()=="") {
		  alert("이름을 입력해주세요");
		  $("#name").focus();
		  $("#name").val("");
		  return;
		 }
	if ($("#birth").val().trim()=="") {
		  alert("생년월일을 입력해주세요");
		  $("#birth").focus();
		  $("#birth").val("");
		  return;
		 }
	if ($("#phone_num").val().trim()=="") {
		  alert("전화번호를 입력해주세요");
		  $("#phone_num").focus();
		  $("#phone_num").val("");
		  return;
		 } 
		 
	$("#memberFrm").submit();
	
    });
});
</script>
</head>
<body>
<div class="wrap">
<c:if test="${ not empty param.id }">
	<script type="text/javascript">
	//본인 아이디확인 팝업창 열기
		window.open("find_id_popup.jsp?id="+'${ param.id }',"find_id_popup",
		"width=385,height=235,top=380,left=750");  
	</script>
</c:if>

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
			<form name="memberFrm" id="memberFrm" method="post" action="user_find_id_process.jsp" >
			<div class="infoBox">
				<img src="../../images/check.png" class="infoImg" style="vertical-align: middle;">
				<span class="infoText">이름 / 생년월일/ 휴대폰으로 찾기</span>
				<div style="margin: 30px">
					<input type="text" placeholder="이름 입력" size="18" class="textBox" name="name" id="name" >
					<input type="text" placeholder="생년월일 입력" size="18" class="textBox" name="birth" id="birth" oninput="birthHyphen(this)" ><br>
					<input type="text" placeholder="휴대번호 입력" size="46" class="textBox" name="phone_num" id="phone_num" style="margin: 5px" oninput="autoHyphen(this)" >
				</div>
			</div>

			<!-- 확인 취소 버튼  -->
			<div style="text-align: center; margin: 30px;">
				 <input type="button" value="확인" class="oBtn" id="chkBtn">
			</div>
			</form>
			
			<!-- 비번찾기 찾기창 이동 -->
			<div class="linkText">
				<p>비밀번호가 기억나지 않는다면?</p>
				<p><a href="user_find_pass.jsp" style="color:#FF9326">비밀번호 찾기 바로가기</a></p>
			</div>

		</div>
		<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>

</body>
</html>