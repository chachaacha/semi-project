<%@ page import="userDAO.FindPwDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
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
<% //POST요청방식의 한글 처리  
request.setCharacterEncoding("UTF-8"); %>
<!-- 1. parameter 받을 VO 생성 -->
<jsp:useBean id="fVO" class="userVO.FindPwVO" />
<!-- 2. VO에 setter method(property) 호출 -->
<jsp:setProperty property="*" name="fVO"/>

<%
/* String name = request.getParameter("name");
String birth = request.getParameter("birth");
String phone_num = request.getParameter("phone_num");  */
FindPwDAO fDAO=FindPwDAO.getInstance();
	out.println ( fVO );
if(fDAO.selectFindPw(fVO) !=null) {
%>
	<script type="text/javascript">
	alert("회원님의 임시비밀번호는"+<c:out value="${param.pass}"/>+"입니다.");
	</script>
<%
	}else{
%>
<!-- 입력된 정보를 확인하시오  -->
	<script type="text/javascript">
	alert("입력하신 정보를 다시 확인해주세요.");
	</script>
<% } %>
</body>
</html>