<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
 
 <!-- 1. prameter 받을 vo생성 -->
 <jsp:useBean id="msVo" class="userVO.MySalesVO" scope="page"/>
 <!-- 2. VO에 setter method(property)호출 -->
<jsp:setProperty property="*" name="msVo"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래완료</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/deal_complete.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
//...버튼 누르면 글 삭제할건지 물어보는 팝업창 열기
$(function() {
	$(".edit_del_btn").click(function() {
		confirm("게시글을 정말 삭제하시겠어요?")
	})
})
</script>

</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<!-- 1 -->
<div class="container">
	<%
	
			
	%>
	
<%@ include file="myinfo_navi.jsp" %>

<div class="deal_complete_title_wrap">
	<div class="deal_complete_title">거래완료</div>
	<!-- for each로 반복 -->
	 	<div class="deal_complete_item">
			<div class="deal_complete_item_img">
				<img alt="이미지 자리" src=""><!-- ${dealComplete.p.thumbnail} -->
					<div class="deal_complete_item_border">
						<div class="dci_title">
							<button class="edit_del_btn" type="button">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  							<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  							<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
						</button>
							<div class="dong_date">지역</div><!-- dong_date -->
								<div class="btn_price">
									<button class="complete_btn" type="button">거래완료</button>
								<div class="price">가격</div><!-- <c:out value="${dealComplete.p.price}"/>" -->
								</div><!-- "btn_price" -->
					</div><!-- dci_title -->
				</div><!-- on_sale_item_border-->
	</div><!-- on-sale_item_img -->
	</div><!-- deal_complete_item -->

	



</div> <!-- 컨테이너 div -->
<!-- container end -->
</div>
<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div>
</body>
</html>