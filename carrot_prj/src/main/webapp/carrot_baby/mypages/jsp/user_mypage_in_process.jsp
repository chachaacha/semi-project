<%@page import="userDAO.LoginDAO"%>
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
<% 
//POST 방식
request.setCharacterEncoding("UTF-8"); 
//세션에 있는 아이디
String sessionId=(String)session.getAttribute("id");
//입력받은 비밀번호
String inputPass = request.getParameter("password");
%>
<!-- VO 객체 생성 -->
<jsp:useBean id="lVO" class="userVO.LoginVO"></jsp:useBean>
<!-- 전송 받은 아이디와 비번을 VO에 저장 -->
<jsp:setProperty property="id" name="lVO" value="<%=sessionId %>"/>
<jsp:setProperty property="password" name="lVO" value="<%=inputPass %>"/>
<!-- VO에 저장된 값 불러오기 -->
아이디 : <jsp:getProperty property="id" name="lVO"/>
비밀번호 : <jsp:getProperty property="password" name="lVO"/>

<%
LoginDAO lDAO = LoginDAO.getInstance();
if(lDAO.selectLogin(lVO).equals("")){ //비밀번호를 잘못 입력했을 때
	%>
	<script type="text/javascript">
		alert("비밀번호를 잘못입력하셨습니다.")
		location.href="user_mypage_in.jsp";
	</script>
<%} else{ //비밀번호를 제대로 입력했을 때
	response.sendRedirect("user_myinfo_edit_process.jsp");
}%>
</body>
</html>