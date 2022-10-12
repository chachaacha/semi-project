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
	
	//사용하기 버튼 클릭시
	$("#idbtn").click(function(id){
		opener.window.document.memberFrm.id.value=document.getElementById("id").value;
		self.close();
	});
});

function chkNull(){
	var id=$("#id").val();
	if(id == ""){
		alert("아이디를 입력해 주세요.");
		return;
	}
	$("#frmDup").submit();
}//chkNull

</script>
</head>
<body>
<div class="wrap">
	<form method="get" id="frmDup" action="id_dup_popup.jsp">  
	<h1 class="title">아이디 중복확인</h1>
	<div style="padding: 30px 20px; ">
	<div>
		<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		<path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></svg> 
		<span>아이디는 영문(소문자), 숫자로 4~16자 이내로 입력해주세요.</span><br>
	</div>
	</div>
	<!-- 1 -->
	<div class="contents">
		<input type="text" class="idText" id="id" size="30" autocomplete="off" />
		<input type="text" style="display:none;"/>
		<input type="button" value="중복확인" class="chkBtn" id="chkBtn" />
	</div>
	<div class="msg">
		<span>공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.</span><br>
		<span>숫자로 시작하거나, 숫자로만 이루어진 아이디는 사용할 수 없습니다.</span><br>
	</div>
	<!--  -->
	<c:if test="${ not empty param.id }">
	<% //DBMS 연동
	JoinDAO jDAO=JoinDAO.getInstance();
	
	boolean flag=jDAO.selectId(request.getParameter("id"));
	pageContext.setAttribute("flag",flag);//true면 사용중, false면 미사용
	%>
	<div id="view">입력하신 <strong><c:out value="${param.id}"/></strong>는
	<c:choose>
	<c:when test="${flag }">
	<span style="color: #FF0000">사용중</span>입니다.
	</c:when>
	<c:otherwise>
	<span style="color: #FF0000">사용가능</span>합니다.<br/>
	</c:otherwise>
	</c:choose>
	</div>
	</c:if>
	<!-- 버튼 -->
	<button type="button" class="idBtn" id="idbtn" >사용하기</button>
	</form>
</div>
</body>
</html>