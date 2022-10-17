<%@page import="java.io.PrintWriter"%>
<%@page import="userDAO.MySalesDAO"%>
<%@page import="userVO.MySalesVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="마이페이지 내에서 게시물 삭제하기"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.130/jsp_prj/common/css/main_v1_220901.css"/>

</head>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap Css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Bootstrap Js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
<body>
<%
//POST방식의 요청 한글 처리
request.setCharacterEncoding("UTF-8");

//MysalesDaO생성
MySalesDAO msDAO=MySalesDAO.getInstance();
//게시글 삭제를 위해 상품인덱스 설정하기
String product_idx=request.getParameter("product_idx");
//세션에 있는 아이디 불러오기
//String id=(String)session.getAttribute("id");
msDAO.deleteBoard(product_idx);

//이후에 다시 거래완료 목록이 조회된 페이지로 돌아감.
response.sendRedirect("deal_complete.jsp");
%>


</body>
</html>