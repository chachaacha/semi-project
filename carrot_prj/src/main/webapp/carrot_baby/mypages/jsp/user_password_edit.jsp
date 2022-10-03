<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_password_edit.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
$("#btn").click(function(){
	alert("비밀번호가 변경되었습니다.")
});
});
</script>

</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_logout_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">

<!-- 상단바 만들기  -->
<%@ include file="myinfo_navi.jsp" %>
   
	<!-- 비밀번호수정  -->
	<div class="title">비밀번호 수정</div>
	
		<!-- 정보 작성 폼 -->
		<div class="writeForm">
			<table>
				<tr>
					<th><label for="password">현재 비밀번호</label></th>
					<td>
						<input placeholder="비밀번호를 입력해주세요" name="password" id="password" class="textBox" type="password"  />
					</td>
				</tr>
				<tr>
					<th><label for="password">신규 비밀번호</label></th>
					<td>
						<input placeholder="비밀번호를 입력해주세요" name="password1" id="password1" class="textBox" type="password"  />
						<span>*8~12자의 영문, 숫자, 특수문자 3가지를 조합하여 입력</span>
					</td>
				</tr>
				<tr>
					<th><label for="password">신규 비밀번호 확인</label></th>
					<td>
						<input placeholder="비밀번호를 입력해주세요" name="password2" id="password2" class="textBox" type="password"  />
					</td>
				</tr>
				</table>
		</div> 
<!-- 내정보수정 끝 -->
	<div class="writeForm_btn">
					<a href="javascript:;" class="oBtn" id="btn"
						onclick="goSave($('#wform'))">확인</a> <a href="#" class="gBtn"
						onClick="reset();">취소</a>
				</div>
</div> <!-- content  -->


<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>
</body>
</html>