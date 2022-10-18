<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page import="userDAO.LoginDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
lVO.setPassword(DataEncrypt.messageDigest("SHA-1", request.getParameter("password")));
String id = request.getParameter("id");// 웹 파라메터로 넘어온 아이디
LoginDAO lDAO = LoginDAO.getInstance();
pageContext.setAttribute("returnId", lDAO.selectLogin(lVO)); //입력한 아이디와 비번을 통해 아이디 리턴
pageContext.setAttribute("quitId", lDAO.selectChkQuit(id));// 입력한 아이디가 탈퇴 했는지를 확인
pageContext.setAttribute("blockId", lDAO.selectChkBlocked(id));// 입력한 아이디가 차단당했는지 확인, 차단당했다면 사유를 리턴
%>
<c:choose>
<c:when test="${ not empty pageScope.returnId }">
	<c:choose>
	<c:when test="${ not empty quitId }">
		<script type="text/javascript">
		alert("탈퇴한 아이디 입니다.");
		location.href="user_login.jsp";
		</script>
	</c:when>
	<c:when test="${ not empty blockId }">
		<script type="text/javascript">
		var msg = "차단당한 아이디입니다.\n사유 : "+"${ blockId }";
		alert(msg);
		location.href="user_login.jsp";
		</script>
	</c:when>
	<c:otherwise>
	<%
	session.setMaxInactiveInterval(60*60);
	session.setAttribute("id", lVO.getId());
	%>
	<script type="text/javascript">
	location.href="../../mainhome/jsp/user_mainhome.jsp";
	</script>
	</c:otherwise>
	</c:choose>
</c:when>
<c:otherwise>
	<script type="text/javascript">
	alert("아이디 혹은 비밀번호가 잘못되었습니다.");
	location.href="user_login.jsp";
	</script>
</c:otherwise>
</c:choose>

</body>
</html>