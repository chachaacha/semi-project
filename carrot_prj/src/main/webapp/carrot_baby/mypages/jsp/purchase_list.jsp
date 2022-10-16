<%@page import="userDAO.BuyListDAO"%>
<%@page import="userVO.BuyListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="userVO.BuyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/purchase_list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
//...버튼 누르면 글 삭제할건지 물어보는 팝업창 열기
function delPro(pIdx){
	if(confirm("정말로 해당 구매내역을 삭제하시겠어요?")){
		location.href="purchase_list.jsp?product_idx="+pIdx;
	}
};

</script>

</head>
<%-- 세션만료시 로그인 페이지로 이동 --%>
<c:if test="${ empty id }">
<c:redirect url="../../login/jsp/user_login.jsp"/>
</c:if>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<!-- 1 -->
<div class="container">
<%@ include file="myinfo_navi.jsp" %>

<%
String id = (String)session.getAttribute("id");
BuyListDAO blDAO=BuyListDAO.getInstance();
List<BuyListVO> blList=blDAO.selectBL(id);

//스콥객체에 할당
pageContext.setAttribute("blList", blList);
%>

<div class="purchase_list_title_wrap">

	<div class="purchase_list_title">구매내역</div>
	<c:forEach var="bl" items="${ blList }">
	<div class="purchase_list_item">
		<div class="purchase_list_img">
		<!-- 이미지 클릭시 해당 페이지로 이동 -->
		<a href="">
			<img alt="이미지 자리" src="../../search/image/${bl.thumbnail}">
		</a>
				<div class="purchase_list_border">
				<div class="pl_title"><c:out value="${ bl.title }"/>
					<a href="javascript:delPro('${ bl.product_idx }')"><button class="edit_del_btn" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  						<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  						<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
					</button>
					</a>
					<div class="dong_date"><c:out value="${ bl.gu }"/> ㆍ <c:out value="${ bl.posted_date }"/> </div><!-- dong_date -->
							<div class="btn_price">
								<button class="complete_btn" type="button" style="cursor:none">구매완료</button>
								<div class="price"><fmt:formatNumber pattern="#,###,###" value="${ bl.price }"/>원</div>
						</div><!-- "btn_price" -->
	</div><!-- pl_title -->
	</div><!-- purchase_list_border-->
	</div><!-- purchase_list_img -->
	</div><!-- purchase_list_item -->
</c:forEach>
<c:if test="${ empty blList }" >
	구매하신 상품이 없습니다.
</c:if>
</div> <!-- 컨테이너 div -->
</div><!-- container end -->

<%-- 구매내역에서 삭제처리(업데이트) --%>
<c:if test="${ not empty param.product_idx }">
<% blDAO.updateDropBL(request.getParameter("product_idx")); %>
<script type="text/javascript">
alert("구매내역에서 삭제되었습니다.");
location.href="purchase_list.jsp";
</script>
</c:if>


<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div>
</body>
</html>