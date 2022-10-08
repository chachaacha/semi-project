<%@page import="userDAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" info = "글쓰기 저장하기" isELIgnored="false" %>
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
<% 
//POST방식의 요청 한글 처리
request.setCharacterEncoding("UTF-8"); 
%>
<!-- 1. parameter 받을 VO 생성 -->
<%-- <jsp:useBean id="객체명" class="객체화할 클래스" scope=""/> --%>
<jsp:useBean id="pVO" class="userVO.PostVO"/>

<%
String product_idx = request.getParameter("product_idx");
String user_id=(String)session.getAttribute("user_id");
String category_loc=request.getParameter("category_loc");
int gu_idx = Integer.parseInt(category_loc);
String category_pd=request.getParameter("category_pd");
int category_idx = Integer.parseInt(category_pd);
String priceS = request.getParameter("price");
int price = Integer.parseInt(priceS);
String free = request.getParameter("free");
if(free == null){
	free = "N";
}
%>
<!-- 2. VO에 setter method(property) 호출 -->
<%-- <jsp:setProperty name="객체명" property="*"/> --%>
<jsp:setProperty property="id" name="pVO" value="<%= user_id %>"/>
<jsp:setProperty property="category_idx" name="pVO" value="<%= category_idx %>"/>
<jsp:setProperty property="gu_idx" name="pVO" value="<%= gu_idx %>"/>
<jsp:setProperty property="thumbnail" name="pVO" value="1234.png"/>
<jsp:setProperty property="price" name="pVO" value="<%= price %>"/>
<jsp:setProperty property="free" name="pVO" value="<%= free %>"/>
<jsp:setProperty property="title" name="pVO"/>
<jsp:setProperty property="contents" name="pVO"/>
<%
PostDAO pDAO = PostDAO.getInstance();
out.println(pVO);
pDAO.insertPost(pVO);
%>
</body>
</html>