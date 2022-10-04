<%@ page import="userDAO.JoinDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
<% //POST요청방식의 한글 처리  
request.setCharacterEncoding("UTF-8"); %>
<!-- 1. parameter 받을 VO 생성 -->
<jsp:useBean id="jVO" class="userVO.JoinVO" scope="session"/>
<!-- 2. VO에 setter method(property) 호출 -->
<jsp:setProperty property="*" name="jVO"/>
<!-- DB연결 -->
<%
JoinDAO jDAO=JoinDAO.getInstance();
jDAO.insertJoin(jVO);
%>

<%-- 입력 값 : <%= lVO %> --%>
이름 : ${ param.name }<br/>
별명 : ${ param.nick }<br/>
아이디 : ${ param.id }<br/>
비번 : ${ param.password }<br/>
비번확인 : ${ param.password }<br/>
생년월일 : ${ param.birth }<br/>
이메일 : ${ param.email } @ ${ param.email2 }<br/>

</body>
</html>