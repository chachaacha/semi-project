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
<!-- 이메일 추출 -->
<%
//방법 2.
String email1=request.getParameter("email1");
String email2=request.getParameter("email2");
String email=email1+"@"+email2;
%>
<jsp:setProperty property="email" name="jVO" value="<%= email %>"/> 
<!-- 주소 추출 -->
<%
String str=request.getParameter("addr1");
String addr1=str.substring(0,str.lastIndexOf("구")+1);
%>
<jsp:setProperty property="addr1" name="jVO" value="<%= addr1 %>"/> 

<!-- DB연결 -->
<%
JoinDAO jDAO=JoinDAO.getInstance();
out.println ( jVO );
jDAO.insertJoin(jVO);%>

<script type="text/javascript">
	alert("정보작성이 완료되었습니다.");
	location.href="user_join_comp.jsp";
</script>

<%-- 입력 값 : <%= lVO %> --%>
<%-- 이름 : ${ param.name }<br/>
별명 : ${ param.nick }<br/>
아이디 : ${ param.id }<br/>
비번 : ${ param.password }<br/>
비번확인 : ${ param.password }<br/>
생년월일 : ${ param.birth }<br/>
전화번호 : ${ param.phone_num }<br/>
이메일 : ${ param.email1 }@${ param.email2 }<br/>
 --%>
</body>
</html>