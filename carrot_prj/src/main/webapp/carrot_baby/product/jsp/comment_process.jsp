<%@page import="userDAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.149/jsp_prj/common/css/main_v1_220901.css"/>
<jsp:useBean id="ucVO" class="userVO.UserCommentVO" scope="page"/>
<jsp:setProperty property="*" name="ucVO"/>
<style type="text/css">

</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap Css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Bootstrap Js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script type="text/javascript">
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String work = request.getParameter("work");
String product_idx = request.getParameter("product_idx");
String id = request.getParameter("user_id");
String contents = request.getParameter("contents");

//BoardDAO 생성
BoardDAO bDAO=BoardDAO.getInstance();

if(work.equals("comment")){ 	//댓글달기

	ucVO.setProduct_idx(product_idx);
	ucVO.setId(id);
	ucVO.setContents(contents);
	
	bDAO.insertComm(ucVO);
	
}else if(work.equals("recomment")) { //답글달기 */
	Integer comment_idx = Integer.parseInt(request.getParameter("comment_idx"));
	ucVO.setProduct_idx(product_idx);
	ucVO.setComment_idx(comment_idx);
	ucVO.setId(id);
	ucVO.setContents(contents);
	
	bDAO.insertReply(ucVO);
	
}
	response.sendRedirect("../../product/jsp/user_buyer_product_comments.jsp?product_idx="+product_idx);
%>
</body>
</html>