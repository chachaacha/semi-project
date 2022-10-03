<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차단 사용자 관리</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/block_user_management.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
//차단하기 버튼을 눌렀을 때 confirm창
$(function() {
	$(".block").click(function() { //차단버튼
		confirm("이 사용자를 차단하시겠습니까?")
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
<div class="title_wrap">
	<div class="title">차단 사용자 관리</div>
	<div class="profile">
			<div class="profile-wrap">
				<div class="profile_img_wrap">
					<img alt="프로필이미지" src="../../images/profile.png" class="profile-img">
				</div><!-- profile_img -->
				<div class="profile-txt-wrap">
						<div class="nick_name">라멘조아(rame***)</div><!-- 별명 -->
						<div class="region">서울 어디어디</div>
				</div>
			</div><!-- profile-wrap -->
		<div><button class="block" type="button">차단하기</button> </div>
	</div><!-- profile -->
	
	<div class="profile">
			<div class="profile-wrap">
				<div class="profile_img_wrap">
					<img alt="프로필이미지" src="../../images/profile.png" class="profile-img">
				</div><!-- profile_img -->
				<div class="profile-txt-wrap">
						<div class="nick_name">아메리카노(cofe***)</div><!-- 별명 -->
						<div class="region">서울시 강남구 역삼동</div>
				</div>
			</div>
		<div><button class="block" type="button">차단하기</button></div>
	</div><!-- profile -->
	
	

</div> <!-- container div -->
</div><!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>

</body>
</html>