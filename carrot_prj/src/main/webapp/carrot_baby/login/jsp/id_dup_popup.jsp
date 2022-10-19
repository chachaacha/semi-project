<%@page import="userDAO.JoinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<link rel="stylesheet" type="text/css" href="../css/id_dup_popup.css"/>
<style type="text/css">
html {
	overflow: hidden;
}
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
//공백입력 방지
function noSpaceForm(obj) {
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        alert("해당 항목에는 공백을 사용할수 없습니다.");
        obj.focus();
        obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
}

// 한글입력 방지 
function noKor() {
	$("#id").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z._0-9^-]/gi,''));		
		}
	});
}

//중복버튼클릭시에만 사용하기 버튼 활성화
var btn;
function btn_on() {
 btn = document.getElementById('idbtn');
 btn.disabled = false;
}

$(function() {
	//중복확인 버튼 클릭시
	$("#chkBtn").click(function(){
		chkNull();
	});
	
	$("#id").keydown(function( evt ){
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keydown
	
	//사용하기 버튼 클릭시 부모창으로 아이디 정보 전송
	$("#idbtn").click(function(id){
		opener.window.document.memberFrm.id.value=document.getElementById("id").value;
		self.close();
	});
});

function chkNull(){
	var idchk="";
	var id=$("#id").val();
	var jsonParam={"id":id};
	if(id == ""){
		alert("아이디를 입력해 주세요.");
		return;
	}
	if ($("#id").val().length <= 3) 	{
		alert("아이디를 정확히 입력해주세요");	
	return;
	}
	$.ajax({
		url:"id_dup_popup_process.jsp",
		type:"post",
		data: jsonParam,
		dataType:"json",
		error:function(xhr) {
			alert("죄송합니다 잠시후 다시 시도해주세요.");
			console.log("에러 : " + xhr.status);
		}, success: function( jsonObj ){
			idchk=jsonObj.idchk;
			if(idchk == "Y"){
			$("#id").val("");
			}
			$("#msgOutput").text(jsonObj.msg);
		}
	});//ajax
}//chkNull

function btnActive()  {
	  const target = document.getElementById("#chkBtn");
	  target.disabled = false;
	}

</script>
</head>
<body>
<div class="wrap">
	<h1 class="title">아이디 중복확인</h1>
	<div style="padding: 30px 20px; ">
	<div>
		<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		<path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></svg> 
		<span>아이디는 영문, 숫자로 4~16자 이내로 입력해주세요.</span><br>
	</div>
	</div>
	<!-- 1 -->
	<form method="get" id="frmDup">  
	<div class="contents">
		<input type="text" class="idText" id="id" name="id" size="30" autocomplete="off" maxlength="16" onkeydown="noKor();"style="ime-mode:disabled;"onkeyup="noSpaceForm(this);"/>
		<input type="text" style="display:none;"/>
		<input type="button" value="중복확인" class="chkBtn" id="chkBtn" onclick="btn_on();" />
	</div>
	</form>
	<div  class="msg">
		<span id="msgOutput" ></span><br>
	</div>
	<div class="msg2">	
		<span>숫자로 시작하거나, 숫자로만 이루어진 아이디는 사용할 수 없습니다.</span><br>
		<span>공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.</span><br>
	</div>
	<!-- 버튼 -->
	<button type="button" class="idBtn" id="idbtn" disabled="disabled" >사용하기</button>
</div>
</body>
</html>