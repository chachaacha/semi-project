<%@page import="userDAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info = "" isELIgnored="false"%>
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
pDAO.updatePost(pVO);
%>
</body>
</html>