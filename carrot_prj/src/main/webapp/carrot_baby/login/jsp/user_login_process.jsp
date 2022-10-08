<%@ page import="userDAO.LoginDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
<!-- 1. parameter 받을 VO 생성 -->
<jsp:useBean id="lVO" class="userVO.LoginVO" />
<!-- 2. VO에 전송 받은 값 저장 -->
<jsp:setProperty property="*" name="lVO"/>
<%
/* String id=request.getParameter("id");
String password=request.getParameter("password"); */
	/* id password 받자 */
	LoginDAO lDAO = LoginDAO.getInstance();
	/* DBMS 세션 조건 검색하자 */
	if(lDAO.selectLogin(lVO)!=null) {
		session.setMaxInactiveInterval(60*1);
		/* 세션에 아이디 넣자 */
		session.setAttribute("id", lVO.getId());
		response.sendRedirect("../../mainhome/jsp/user_mainhome.jsp");
	}else{
%>
<!-- 아이디 비번 확인하시오  -->
	<script type="text/javascript">
	alert("아이디 혹은 비밀번호가 잘못되었습니다.");
	location.href="user_login.jsp";
	</script>
<% } %>
</body>
</html>