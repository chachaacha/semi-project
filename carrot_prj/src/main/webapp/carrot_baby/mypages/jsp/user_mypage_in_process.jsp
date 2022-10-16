<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="userDAO.LoginDAO"%>
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
<% 
//POST 방식
request.setCharacterEncoding("UTF-8"); 

//입력받은 비밀번호 일방향 해쉬로 암호화 
String pass=request.getParameter("password");
MessageDigest md=MessageDigest.getInstance("SHA-1");
md.update(pass.getBytes());
String sha=DataEncrypt.messageDigest("SHA-1", pass);
System.out.println(sha);

%>
<!-- VO 객체 생성 -->
<jsp:useBean id="lVO" class="userVO.LoginVO"></jsp:useBean>
<!-- 전송 받은 아이디와 비번을 VO에 저장 -->
<jsp:setProperty property="id" name="lVO" value="${ id }"/>
<jsp:setProperty property="password" name="lVO" value="<%= sha%>"/> <!-- DB에 암호화해서 저장한 비밀번호와 비교 -->
<%
LoginDAO lDAO = LoginDAO.getInstance();
System.out.println(lVO);

if(lDAO.selectLogin(lVO)==null){ //비밀번호를 잘못 입력했을 때
   %>
   <script type="text/javascript">
      alert("비밀번호를 잘못입력하셨습니다.")
      location.href="user_mypage_in.jsp";
   </script>
<%} else{ //비밀번호를 제대로 입력했을 때
   
   response.sendRedirect("user_myinfo_edit.jsp");
}%>
</body>
</html>