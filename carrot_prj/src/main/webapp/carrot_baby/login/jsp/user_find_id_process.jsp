<%@ page import="userDAO.FindIdDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
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
<jsp:useBean id="fVO" class="userVO.FindIdVO" scope="session"/>
<!-- 2. VO에 setter method(property) 호출 -->
<jsp:setProperty property="*" name="fVO"/>

<%
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String phone_num = request.getParameter("phone_num");
%>

<!-- DB연결 -->
<%
FindIdDAO fDAO=FindIdDAO.getInstance();
/* String id= fDAO.selectFindId(FindIdVO fVO); */
out.println ( fDAO );
%>
<br>
이름 : ${ param.name }<br/>
생년월일 : ${ param.birth }<br/>
전화번호 : ${ param.phone_num }<br/>
</body>
</html>