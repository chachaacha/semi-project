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
//공백사용못하게
function noSpaceForm(obj) { 
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        alert("해당 항목에는 공백을 사용할수 없습니다.");
        obj.focus();
        obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
}

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
	
	//8~20자의 영문,숫자, 특수문자를 혼합하여 입력
	var pw = $("#password1").val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	 if(pw.length < 8 || pw.length > 20){

	  alert("8자리 ~ 20자리 이내로 입력해주세요.");
	  return false;
	 }else if(pw.search(/\s/) != -1){
	  alert("비밀번호는 공백 없이 입력해주세요.");
	  return false;
	 }else if(num < 0 || eng < 0 || spe < 0 ){
	  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
	  return false;
	 }else {
		console.log("통과"); 
	 }
	
	//신규 비밀번호 확인 입력 유효성 검사
	if($("#password2").val().trim()==""){
		alert("신규 비밀번호를 입력해주세요.");
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
<% 
// 세션 만료시 로그인화면으로 이동
	if(session.getAttribute("id")==null) {
		response.sendRedirect("../../login/jsp/user_login.jsp");
	}
%>
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
						<input placeholder="비밀번호를 입력해주세요" name="password" id="password" class="textBox" type="password" />
					</td>
				</tr>
				<tr>
					<th><label for="password">신규 비밀번호</label></th>
					<td>
						<input placeholder="비밀번호를 입력해주세요" name="password1" id="password1" class="textBox" type="password" onkeyup="noSpaceForm(this);" />
						<span>*8~20자의 영문,숫자, 특수문자를 혼합하여 입력</span>
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