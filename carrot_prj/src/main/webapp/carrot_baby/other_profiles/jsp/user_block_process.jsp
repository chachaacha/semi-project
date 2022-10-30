<%@page import="userDAO.ProfilDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.151/carrot_baby/common/css/main_v1_220901.css"/>
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
<jsp:useBean id="buVO" class="userVO.BlockUVO"></jsp:useBean>
<jsp:setProperty property="*" name="buVO"/>
<jsp:setProperty property="id" name="buVO" value="${id }"/>
<jsp:setProperty property="blocked_id" name="buVO" value="${param.id }"/>

<%
//post방식
request.setCharacterEncoding("UTF-8");

ProfilDAO pDAO = ProfilDAO.getInstance();

//이전에 해당 아이디를 차단한 적이 있는지 조회하기 위한 변수 설정
boolean blockFlag=pDAO.selectBlockedId(buVO);

if(blockFlag==false){ //차단한 적이 없으면
	//차단하기
	pDAO.insertBlock(buVO);
}
response.sendRedirect("../../mypages/jsp/block_user_management.jsp");
%>
</body>
</html>