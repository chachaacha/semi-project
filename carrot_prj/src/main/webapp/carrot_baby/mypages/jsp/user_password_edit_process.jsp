<%@page import="userDAO.PwUpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.148/jsp_prj/common/css/main_v1_220901.css"/>
<style type="text/css">

</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap Css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Bootstrap Js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<script type="text/javascript">

</script>

</head>
<body>
<% request.setCharacterEncoding("UTF-8"); 
//세션에 있는 아이디
String id=(String)session.getAttribute("id");
//입력받은 기존 비밀번호
String pass = request.getParameter("password");
//입력받은 신규 비밀번호
String newPw = request.getParameter("password1");
//입력받은 신규 비밀번호 확인
String newPwChk = request.getParameter("password2"); 
%>

<!-- VO객체 생성 -->
<jsp:useBean id="puVO" class="userVO.PwUpVO"></jsp:useBean>
<!-- 아이디와 입력받은 비밀번호, 새비밀번호를 VO에 저장  -->
<jsp:setProperty property="id" name="puVO" value="<%= id %>"/>
<jsp:setProperty property="password" name="puVO" value="<%= pass %>"/>
<jsp:setProperty property="new_pw" name="puVO" value="<%= newPw %>"/>

<%
PwUpDAO puDAO = PwUpDAO.getInstance();
int result = puDAO.updatePw(puVO);

if(result==0){
	%>
	<script type="text/javascript">
		alert("비밀번호를 잘못 입력하셨습니다.")
		location.href="user_password_edit.jsp";
	</script>
<%} else{ //result == 1, 비밀번호가 변경되었을 때
	%>
	<script type="text/javascript">
		alert("비밀번호가 변경되었습니다.")
		location.href="user_password_edit.jsp";
	</script>
<%}%>
</body>
</html>