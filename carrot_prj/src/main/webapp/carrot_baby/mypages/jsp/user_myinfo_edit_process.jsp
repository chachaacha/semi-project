<%@page import="userDAO.MyInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.148/jsp_prj/common/css/main_v1_220901.css"/>
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
<% //POST 방식 요청 한글 처리
request.setCharacterEncoding("UTF-8");
%>

<!-- 1.parameter 받을 VO 생성 -->
<jsp:useBean id="miVO" class="userVO.MyInfoVO"></jsp:useBean>
<!-- 2.VO에 setter method(property) 호출 -->
<jsp:setProperty property="img" name="miVO" value="${param.img }"/>
<jsp:setProperty property="nick" name="miVO" value="${param.nick }"/>
<jsp:setProperty property="phone_num" name="miVO" value="${param.phone_num }"/>
<jsp:setProperty property="sms_chk" name="miVO" value="${param.sms_chk }"/>
<jsp:setProperty property="email" name="miVO" value="${param.email }"/>
<jsp:setProperty property="email_chk" name="miVO" value="${param.email_chk }"/>
<jsp:setProperty property="zipcode" name="miVO" value="${param.zipcode }"/>
<jsp:setProperty property="addr1" name="miVO" value="${param.addr1 }"/>
<jsp:setProperty property="addr2" name="miVO" value="${param.addr2 }"/>
<jsp:setProperty property="id" name="miVO" value="${id }"/>

<%
MyInfoDAO miDAO = MyInfoDAO.getInstance();
int result = miDAO.updateInfo(miVO);

if(result>-1){
	%>
	<script type="text/javascript">
		alert("정보가 수정되었습니다.")
		location.href="user_myinfo_edit.jsp";
	</script>
<% } %>
</body>
</html>