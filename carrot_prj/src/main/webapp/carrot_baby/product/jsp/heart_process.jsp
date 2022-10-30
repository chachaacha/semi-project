<%@page import="userDAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.151/carrot_baby/common/css/main_v1_220901.css"/>
<jsp:useBean id="bVO" class="userVO.BoardVO" scope="page"/>
<jsp:useBean id="wVO" class="userVO.WishVO" scope="page"/>
<jsp:setProperty property="*" name="bVO"/>
<jsp:setProperty property="*" name="wVO"/>

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

String id=request.getParameter("userId"); //유저 아이디
String product_idx=request.getParameter("product_idx"); //하트 선택 유무
String heartFlag=request.getParameter("flag"); //하트 선택 유무

//BoardDAO 생성
BoardDAO bDAO=BoardDAO.getInstance();

wVO.setId(id);
wVO.setProduct_idx(product_idx);

if(id != null && !"".equals(id)) {
	if(heartFlag.equals("true")){ //하트 눌렀을 때
		bDAO.insertWish(wVO); //하트 수 증가
		bDAO.updateWishCnt(product_idx); //실시간 하트 수 집계
	}else { //하트 취소했을 때
		bDAO.deleteWish(wVO); //하트 수 감소
		bDAO.updateWishCnt(product_idx); //실시간 하트 수 집계
	}
		response.sendRedirect("../../product/jsp/user_buyer_product_comments.jsp?product_idx="+product_idx);
		/* rd.forward(request,response); */
} else {
	response.sendRedirect("../../product/jsp/user_buyer_product_comments.jsp?product_idx="+product_idx);
}

%>
</body>
</html>