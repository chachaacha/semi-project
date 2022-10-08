<%@ page import="userDAO.FindIdDAO" %>
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
<jsp:useBean id="fVO" class="userVO.FindIdVO" ></jsp:useBean>
<!-- 2. VO에 setter method(property) 호출 -->
<jsp:setProperty property="*" name="fVO"/>

이름 : ${param.name }<br>
생년월일 : ${param.birth }<br>
번호 : ${param.phone_num }<br>

<%
/* String name = request.getParameter("name");
String birth = request.getParameter("birth");
String phone_num = request.getParameter("phone_num"); */
FindIdDAO fDAO=FindIdDAO.getInstance();
	out.println ( fVO );
	if(fDAO.selectFindId(fVO) !=null) {
%>
	<script type="text/javascript">
	alert("회원님의 아이디는"+<c:out value="${param.id}"/>+"입니다.");
	</script>
<%
		response.sendRedirect("../../mainhome/jsp/user_find_id_popup.jsp");
	}else{
%>
<!-- 입력된 정보를 확인하시오  -->
	<script type="text/javascript">
	alert("입력하신 정보를 다시 확인해주세요.");
	</script>
<% } %>
</body>
</html>