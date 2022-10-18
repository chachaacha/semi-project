<%@page import="java.io.PrintWriter"%>
<%@page import="userDAO.MySalesDAO"%>
<%@page import="userVO.MySalesVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- parameter받은 VO생성 -->
<jsp:useBean id="msdcVO" class="userVO.MySalesVO" scope="session"/>
<!-- 2. VO에 setter method(property)호출 -->
<jsp:setProperty property="*" name="msdcVO"/>
<!-- 세션에 저장된 아이디 가져오기-->
<jsp:setProperty property="id" name="msdcVO" value="${id }"/>
 
<!DOCTYPE html>
<html>
<head>
<% request.setCharacterEncoding("UTF-8"); %>
<meta charset="UTF-8">
<title>거래완료</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/deal_complete.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
// x 버튼 누르면 글 삭제
$(function() {
	$(".edit_del_btn").click(function() {
		var conFlag =confirm("게시글을 정말 삭제하시겠어요?");
		
		if(conFlag==true){
		$("#deleteFrm").submit();
		}//end if
	});//click
}); //ready


</script>
</head>
<% 
// 세션 만료시 로그인화면으로 이동
	if(session.getAttribute("id")==null) {
		response.sendRedirect("../../login/jsp/user_login.jsp");
	}
%>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->

<div class="container">
	
<%@ include file="myinfo_navi.jsp" %>

<div class="deal_complete_title_wrap">
	<div class="deal_complete_title">거래완료</div>
	<%
	//세션 아이디 얻기
	String id = (String)session.getAttribute("id");
	
	//MySalesDAO를 생성하고 거래완료된 상품들 불러오기
	MySalesDAO msDAO=MySalesDAO.getInstance();
	List<MySalesVO> dealComplete=msDAO.selectDealComplete(id); 
	
	//스콥 객체에 할당하기
	pageContext.setAttribute("dealComplete", dealComplete);
	
	//조회되고 있는 거래완료 창의 상품 인덱스 얻기
	//String pldx=request.getParameter("product_idx");
	//스콥 객체에 할당
	//pageContext.setAttribute("pldx", pldx );
	
	%>
	
	<!-- for each로 반복 -->
	<c:forEach var="dc" items="${dealComplete}">
<form method="post" action="Mypage_delete_process.jsp?product_idx=${dc.product_idx}" id="deleteFrm">
	 	<div class="deal_complete_item">
			<div class="deal_complete_item_img">
				<a href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${dc.product_idx }">
				<img alt="이미지 자리" src="../../search/image/${dc.thumbnail }">
				</a>
					<div class="deal_complete_item_border">
						<div class="dci_title">
							<a href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${dc.product_idx }" style="text-decoration: none; color: black; ">
							<c:out value="${dc.title }"/>
							</a>
						<button class="edit_del_btn" type="button" onchange="deleteProduct(this, ${ dc.product_idx })">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  							<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  							<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
						</button>
					
							<div class="dong_date">
							<c:out value="${dc.gu }"/>
							ㆍ
							<c:out value="${dc.posted_date }" />
						</div><!-- dong_date --><!-- 구와 올린날짜. 디자인할 때랑 이름이 달라짐 ^~^ -->
							<div class="price_ch">
									<div class="btn_price">
										<fmt:formatNumber pattern="#,###,###원" value="${dc.price }"/>
									</div><!-- "btn_price" -->
									 	<div class="cmt_n_heart">
											<div class="heart">하트&nbsp;
													<span class="heart_cnt">
														<c:out value="${dc.liked_cnt}"/>
													</span><!-- 하트 카운트 -->
											</div><!-- 하트 -->
											<div class="cmt">댓글&nbsp;
													<span>
														<c:out value="${dc.comment_cnt }"/>
													</span><!-- 댓글 카운트 -->
											</div><!-- 댓글 -->
										</div><!-- price_ch -->
											</div><!-- cmt_n_heart -->
								
	</div><!-- dci_title -->
	</div><!-- on_sale_item_border-->
	</div><!-- on-sale_item_img -->
	</div><!-- deal_complete_item -->
	</form>	
</c:forEach>


<!-- 거래완료된 상품이 없을 경우 표시되는 메시지-->
<c:if test="${ empty dealComplete  }" >
	거래완료된 상품 내역이 없습니다.
</c:if>

</div> <!-- deal_complete_title_wrap -->
	
</div><!-- container -->

<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div><!-- wrap -->
</body>
</html>