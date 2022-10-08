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
	//비밀번호 입력 유효성 검사
	if($("#password").val().trim()==""){
		alert("비밀번호를 입력해주세요.");
		return;
	}
	
	//신규 비밀번호 입력 유효성 검사
	if($("#password1").val().trim()==""){
		alert("신규 비밀번호를 입력해주세요.");
		return;
	}
	
	//신규 비밀번호 확인 입력 유효성 검사 
	if($("#password2").val().trim()==""){
		alert("신규 비밀번호 확인을 다시 입력해주세요");
		return
	}
	
	//8~25자의 영문, 숫자, 특수문자 3가지를 조합하여 입력
	var passChk= /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,25}$/;
	
	if(!passChk.test($("#password1").val().trim())){
		alert("8~25자의 영문, 숫자, 특수문자 3가지를 조합하여 입력해야 합니다.");
		$("#password1").focus();
		return;
	}  
	
	//신규 비밀번호와 신규 비밀번호 확인이 일치하지 않을 때
	if($("#password1").val()!=$("#password2").val()){
		alert("신규 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		$("#password2").val("");
		$("#password2").focus();
		return;
	}
	
	$("#passEditFrm").submit();
});
});//ready
</script>

</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">

<!-- 상단바 만들기  -->
<%@ include file="myinfo_navi.jsp" %>
   
	<!-- 비밀번호수정  -->
	<div class="title">비밀번호 수정</div>
	
		<!-- 정보 작성 폼 -->
		<form action="user_password_edit_process.jsp" method="post" id="passEditFrm">
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
		</form>
<!-- 내정보수정 끝 -->
	<div class="writeForm_btn">
	<input type="button" value="확인" id ="btn" class="oBtn">
	</div>
</div> <!-- content  -->


<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>
</body>
</html>