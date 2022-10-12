<%@page import="managerVO.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="managerDAO.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<% request.setCharacterEncoding("UTF-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/manager_pm_comments_popup.css"/>
<style type="text/css">

html {
	overflow: hidden;
}

</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	//상품 팝업창 열기

	
	//초기화 눌렀을 때
	$("#resetBtn").click(function(){
		$("#orderFlag").val(null);
		$("#keyword").val(null);
		$("#hidFrm").submit();
	});
	
	//신고순 눌렀을 때
	$("#reportBtn").click(function(){
		$("#orderFlag").val(1);
		$("#hidFrm").submit();
	});
	
	//날짜순 눌렀을 때
	$("#dateBtn").click(function(){
		$("#orderFlag").val(2);
		$("#hidFrm").submit();
	});
	
	//검색버튼 눌렀을 때
	$("#searchBtn").click(function(){
		$("#keyword").val($("#searchBox").val());
		$("#hidFrm").submit();
	});
});
$(".p-title-link").click(function() {
	
});

function openPopup(idx) {
	window.open("manager_pm_product_popup.jsp?product_idx="+idx,"product_popup","width=780,height=930,top=0,left=560");
}

</script>
</head>
<body>

<form id="hidFrm" method="post">
<input type="hidden" id="orderFlag" name="orderFlag" value="${ param.orderFlag }"/>
<input type="hidden" id= "keyword" name="keyword" value="${ param.keyword }">
</form>

<div class="product_management">
			
			<!-- 위 -->
				<div class="pm_top">
					<button type="button" class="all-delete-btn" id="resetBtn">초기화</button><button type="button" class="all-delete-btn" id="reportBtn">신고순</button><button type="button" class="all-delete-btn" id="dateBtn">최신순</button>
					<div class="search-wrap">
						<input type="text" class="search-txt" placeholder="내용을 입력하세요." id="searchBox" value="${ param.keyword }">
						<button type="button" class="search-bar" id="searchBtn">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
						</button>
					</div>
				</div>
			<!-- 아래 -->
				<div class="pm-bottom">
					<div class="table-wrap">
				         <jsp:useBean id="pVO" class="managerVO.PopupVO"></jsp:useBean>
				         <jsp:setProperty property="*" name="pVO"/>
						 <% 
						 CommentDAO cDAO = CommentDAO.getInstance();
						 List<CommentVO> comList = cDAO.selectComment(pVO);
						 pageContext.setAttribute("comList", comList);
						 %>
						 <table class="table">
						    <caption>표 제목</caption>
						    <tr><th class="table-title">내용</th><th>작성자</th><th>게시글</th><th>등록일</th><th>신고수</th></tr>
						    <c:if test="${ empty comList }">
						    <tr><td colspan="5">조회할 데이터가 없습니다.</td></tr>
						    </c:if>
						    <c:forEach var="comList" items="${ pageScope.comList }">
						    <tr><td class="table-title"><c:out value="${ comList.contents }"/></td><td><c:out value="${ comList.id }"/></td><td><a href="javascript:openPopup('${ comList.product_idx }')" style="color:black" ><c:out value="${ comList.title }"/></a></td><td><c:out value="${ comList.posted_date }"/></td><td><c:out value="${ comList.reported_cnt }"/></td></tr>
						    </c:forEach>
						  </table>  
					</div>
				</div>
</div>
</body>
</html>