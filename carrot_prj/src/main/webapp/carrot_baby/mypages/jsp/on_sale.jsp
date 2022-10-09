<%@page import="userVO.MySalesVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.MySalesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!-- 안에 걸려있는 로그인 헤더에 taglib~ 이거 있으면 또 안써도 되는건지? -->

<!-- parameter받은 VO생성 -->
<jsp:useBean id="msVO" class="userVO.MySalesVO" scope="session"/>
<!-- 2. VO에 setter method(property)호출 -->
<jsp:setProperty property="*" name="msVO"/>
<!-- 세션에 저장된 아이디를 판매중인 사용자 아이디로 설정하기 -->
<jsp:setProperty property="seller_id" name="${id }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매중</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel ="stylesheet" href="../css/on_sale.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
//...버튼 누르면 글 삭제할건지 물어보는 팝업창 열기
$(function() {
	$(".edit_del_btn").click(function() {
		confirm("게시글을 정말 삭제하시겠어요?")
	})
})
</script>
<body>


<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<!-- 1 -->
<div class="container">
<%@ include file="myinfo_navi.jsp" %>
	
<div class="on_sale_wrap">
	<div class="on_sale_title">판매중</div>
	<%
	String id = (String)session.getAttribute("id");
	 MySalesDAO msDao=MySalesDAO.getInstance();
	List<MySalesVO> onsale=msDao.selectSale(id);
	//스콥 객체에 할당
	pageContext.setAttribute("onsale", onsale);
	%>
<c:forEach var="onsale" items="${onSaleItm}">
	<div class="on_sale_item">
		<div class="on_sale_item_img">
			<img alt="이미지 자리" src="${onsale. thumbnail}">
			<div class="on_sale_item_border">
				<div class="olcl_title">
					<c:out value="${onsale.title }"/>
					<button class="edit_del_btn" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  						<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  						<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
					</button>
						<span class="dong_date">
							<c:out value="${onsale.gu }"/>
							ㆍ
							<c:out value="${onsale.post_date }" />
						</span><!-- dong_date --><!-- 구와 올린날짜. 디자인할 때랑 이름이 달라짐 ^~^ -->
							<div class="price_ch">
									<span class="price">
										<fmt:formatNumber pattern="#,###,###원" value="${onsale.price }"></fmt:formatNumber>
									</span>
									 	<div class="cmt_n_heart">
											<div class="heart">하트
												<span class="heart_cnt">6</span><!-- 하트 카운트 -->
													</div><!-- 하트 -->
											<div class="cmt">댓글
													<span>12</span><!-- 댓글 카운트 -->
											</div><!-- 댓글 -->
										</div><!-- cmt_n_heart -->
									</div><!-- price_ch -->
	
	</div><!-- olcl_title"-->
	</div><!-- on_sale_item_border-->
	</div><!-- on-sale_item_img -->
	</div><!-- on_sale_item-->
</c:forEach>	
	</div><!-- on_sale_wrap -->

</div> <!-- 컨테이너 div -->
<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div><!-- class="wrap"> -->

</body>
</html>