<%@ page import="userDAO.LoginDAO" %>
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
<!-- 1. parameter 받을 VO 생성 -->
<jsp:useBean id="lVO" class="userVO.LoginVO" />
<!-- 2. VO에 setter method(property) 호출 -->
<jsp:setProperty property="*" name="lVO"/>
<%-- 입력 값 : <%= lVO %> --%>
아이디 : ${ param.id }<br/>
비번 : ${ param.pass }<br/>

</body>
</html>