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
request.setCharacterEncoding("UTF-8");
%>

<!-- 1.parameter 받을 VO 생성 -->
<jsp:useBean id="miVO" class="userVO.MyInfoVO"></jsp:useBean>
<!-- 2.VO에 setter method(property) 호출 -->
<jsp:setProperty property="*" name="miVO"/>

<jsp:getProperty property="img" name="miVO"/>
<jsp:getProperty property="name" name="miVO"/>
<jsp:getProperty property="nick" name="miVO"/>
<jsp:getProperty property="id" name="miVO"/>
<jsp:getProperty property="birth" name="miVO"/>
<jsp:getProperty property="phone_num" name="miVO"/>
<jsp:getProperty property="sms_chk" name="miVO"/>
<jsp:getProperty property="email" name="miVO"/>
<jsp:getProperty property="email_chk" name="miVO"/>
<jsp:getProperty property="zipcode" name="miVO"/>
<jsp:getProperty property="addr1" name="miVO"/>
<jsp:getProperty property="addr2" name="miVO"/>

</body>
</html>