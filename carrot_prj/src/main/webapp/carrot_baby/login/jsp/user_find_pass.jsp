<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_find_pass.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- alert 디자인 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
$(function () {
    $("#chkBtn").click(function () {
	/* 	//null 검사 
    	chkNull(); */
    	
    	$("#memberFrm").submit();
    	
		//본인 아이디확인 팝업창 열기
		window.open("find_pass_popup.jsp","find_pass_popup",
					"width=385,height=235,top=380,left=750");
    });
});
</script>

</head>-
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

			<!-- 비밀번호 찾기 안내문 -->
			<div class="iconBox">
				<img src="../..//images/id.png"
					class="idImg" style="vertical-align: middle;"> <span
					class="idText">비밀번호 찾기</span>
			</div>
			<div
				style="display: block; width: 270px; margin: 0px auto; padding-top: 10px">
				<p>비밀번호를 잊으셨나요?</p>
				<p>찾고자하는 아이디와 정보를 입력해주세요.</p>
			</div>

			<!--정보 입력 -->
			<form id="memberFrm" action="user_find_pass_process.jsp" method="post">
			<div class="infoBox">
				<img src="../../images/check.png"
					class="infoImg" style="vertical-align: middle;"> <span
					class="infoText">이름 / 아이디 / 휴대폰으로 찾기</span>
				<div style="margin: 30px">
					<input type="text" placeholder="이름 입력" size="18" class="textBox" id="name">
					<input type="text" placeholder="아이디 입력" size="18" class="textBox" id="id"><br>
					<input type="text" placeholder="예) 010-1234-5678" size="46" class="textBox" id="phone_num" style="margin: 5px">
				</div>
			</div>
			</form>
			<!-- 확인 취소 버튼  -->
			<div style="text-align: center; margin: 30px;">
				<input type="button" value="확인" class="oBtn" id="chkBtn">
				 <a href="../../mainhome/jsp/user_mainhome.jsp"><input 	type="button" value="취소" class="gBtn"></a>
			</div>

			<!-- 아이디 찾기창 이동 -->
			<div class="linkText">
				<p>아이디가 기억나지 않는다면?</p>
				<p>
					<a href="user_find_id.jsp">아이디
						찾기 바로가기</a>
				</p>
			</div>
		</div>
	<!-- container end -->
	
<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

	</div>

	<script>
 
 /* 스크롤시 헤더 그림자 */
 var header = $('.header');

 $(window).scroll(function(e){
     if(header.offset().top !== 0){
         if(!header.hasClass('shadow')){
             header.addClass('shadow');
         }
     }else{
         header.removeClass('shadow');
     }
 });
 
 <!-- main top Swiper JS -->
 <!-- Initialize Swiper -->
   var swiper = new Swiper(".mySwiper", {
     spaceBetween: 0,
     centeredSlides: true,
     autoplay: {
       delay: 4000,
       disableOnInteraction: false,
     },
     pagination: {
       el: ".swiper-pagination",
       clickable: true,
     },
     navigation: {
       nextEl: ".swiper-button-next",
       prevEl: ".swiper-button-prev",
     },
   });
</script>
</body>
</html>