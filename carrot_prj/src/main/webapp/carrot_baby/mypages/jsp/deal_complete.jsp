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
// x 버튼 누르면 글 삭제할건지 물어보는 컨펌창
$(function() {
	$(".edit_del_btn").click(function() {
		if(confirm("게시글을 정말 삭제하시겠어요?")){
			$("pldx").val(${param.product_idx});
			$("#deleteFrm").submit();
		}//end if
	})
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
	String id = (String)session.getAttribute("id");
	MySalesDAO msDAO=MySalesDAO.getInstance();
	List<MySalesVO> dealComplete=msDAO.selectDealComplete(id); //id에서 product_idx로 바꿨는데 뭐가 맞는지..
	//System.out.println("-----"+dealComplete); //찍어보니 값이 안담김...--->계속 test1으로 테스트해봤었는데 test1에는 거래 완료가 없어서 
	//빈 화면이 출력되는 거였음! 값이 있는 test5로 하니까 판매중 버튼도 잘 걸림
	// 빈 화면이 출력될 경우 오류가 있는 것처럼 보일 수 있어서
	//거래완료된 상품이 없을 땐 "거래완료된 상품 내역이 없습니다"를 화면에 띄움
	
	//스콥 객체에 할당하기
	pageContext.setAttribute("dealComplete", dealComplete);
	%>
	
	<!-- for each로 반복 -->
	<c:forEach var="dc" items="${dealComplete}">
	 	<div class="deal_complete_item">
			<div class="deal_complete_item_img">
				<a href="">
				<img alt="이미지 자리" src="${dc.thumbnail }">
				</a>
					<div class="deal_complete_item_border">
						<div class="dci_title">
							<a href="" style="text-decoration: none; color: black; ">
							<c:out value="${dc.title }"/>
							</a>
						<button class="edit_del_btn" type="button">
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
</c:forEach>

<!-- 게시글 삭제를 위한 폼-->
<form method="post" id="deleteFrm">
	<input type="hidden" id="product_idx" name="product_idx" value="${param.product_idx }"/>
	<input type="hidden" id="pldx" name="pldx"/>
</form>

<!-- 게시글 삭제  -->
<c:if test="${not empty param.pldx }">
<c:catch var="ex"> <!-- 예외를 ex에 저장 / c:if와 함께 사용 -->
<% msDAO.deleteBoard(request.getParameter("pldx")); %>
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