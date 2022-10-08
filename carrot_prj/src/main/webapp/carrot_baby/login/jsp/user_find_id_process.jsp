<%@ page import="userDAO.FindIdDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
//본인 아이디확인 팝업창 열기
window.open("find_id_popup.jsp","find_id_popup",
"width=385,height=235,top=380,left=750"); 
</script> -->
</head>
<body>
<% //POST요청방식의 한글 처리  
request.setCharacterEncoding("UTF-8"); %>
<!-- 1. parameter 받을 VO 생성 -->
<jsp:useBean id="fVO" class="userVO.FindIdVO" ></jsp:useBean>
<!-- 2. VO에 setter method(property) 호출 -->
<jsp:setProperty property="*" name="fVO"/>

<%
FindIdDAO fDAO=FindIdDAO.getInstance();
String id = fDAO.selectFindId(fVO);
pageContext.setAttribute("id", id);
	if(fDAO.selectFindId(fVO) !=null) {
	%>
	<c:redirect url="user_find_id.jsp?id=${ id }"/>
	<% 
	}else{
%>
<!-- 입력된 정보를 확인하시오  -->
	<script type="text/javascript">
	alert("입력하신 정보를 다시 확인해주세요.");
	location.href="user_find_id.jsp";
	</script>
	
<% } %>
</body>
</html>