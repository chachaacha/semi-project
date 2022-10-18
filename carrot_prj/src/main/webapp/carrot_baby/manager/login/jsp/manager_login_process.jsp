<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="managerDAO.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="로그인 처리"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:useBean id="lVO" class="managerVO.LoginVO"></jsp:useBean>
<jsp:setProperty property="*" name="lVO"/><!-- manager_login에서 form submit을 통해 넘어옴 웹 파라메터의 이름과 같은 setter메소드 모두에 값 적용 -->
<% 
	lVO.setPassword(DataEncrypt.messageDigest("SHA-1", request.getParameter("password"))); 
	LoginDAO lDAO = LoginDAO.getInstance();
	if(lDAO.selectLogin(lVO)!=null) {
		session.setMaxInactiveInterval(60*30);
		session.setAttribute("manager_id", lVO.getManager_id());
		response.sendRedirect("../../home/jsp/manager_mainhome.jsp");
	} else {
		%>
		<script type="text/javascript">
			alert("아이디 혹은 비밀번호가 잘못되었습니다.");
			location.href="manager_login.jsp";
		</script>
<%  }   %>
	

</body>
</html>