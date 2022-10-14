<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="마이페이지 내에서 게시물 삭제하기"%>
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

<!-- 게시글 삭제를 위한 폼-->
<form method="post" id="deleteFrm">
	<input type="hidden" id="product_idx" name="product_idx" value="${param.product_idx }"/>
	<input type="hidden" id="pldx" name="pldx"/>
</form>

<!-- 게시글 삭제  -->
<c:if test="${not empty param.pldx }">
<c:catch var="ex"> <!-- 예외를 ex에 저장 / c:if와 함께 사용 -->
<%-- <% msDAO.deleteBoard(request.getParameter("pldx")); %> --%>
</c:catch>
<c:if test="${not empty ex }">
	<script type="text/javascript">
	alert("무결성 예외 발생! 자식키 존재함")
	</script>
</c:if><!-- not empty ex  -->
<script type="text/javascript">/* 삭제 성공 시  */
alert("게시글을 삭제하였습니다.");
self.close();
</script>
</c:if><!-- not empty param.product_idx  -->


</body>
</html>