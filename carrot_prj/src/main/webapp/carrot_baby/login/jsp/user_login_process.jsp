<%@ page import="userVO.LoginVO" %>
<%@ page import="userDAO.LoginDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
<%
//인코딩처리
request.setCharacterEncoding("UTF-8");
//세션에 존재하는(폼에 입력된) 아이디/비번 가져오기 
String id=request.getParameter("id");
String pass=request.getParameter("password");
//DB에서 아이디/비번 확인
/* LoginDAO lDAO=LoginDAO.getInstance(); */
//msg
String msg = "";

if(id == null){//세션에 값이 없음
	//로그인 페이지로 이동
	response.sendRedirect("user_login.jsp");
	return;
}
%>
<!-- 1. parameter 받을 VO 생성 -->
<jsp:useBean id="lVO" class="userVO.LoginVO" />
<!-- 2. VO에 전송 받은 값 저장 -->
<jsp:setProperty property="*" name="lVO"/>
<!-- 3. VO에 저장된 값 출력(불러오기) -->
아이디 : ${ param.id }<br/>
비번 : ${ param.pass }<br/>

<!-- 1. id password 받자
2. DBMS 조회하자
3. 조회결과 사용
 3.1 세션에 아이디 넣기
 3.2 아이디 비번 확인하시오 -->

</body>
</html>