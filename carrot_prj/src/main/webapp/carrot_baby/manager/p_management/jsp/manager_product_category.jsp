<%@page import="javax.print.attribute.standard.PagesPerMinuteColor"%>
<%@page import="managerVO.ProductVO"%>
<%@page import="managerVO.ProductSearchVO"%>
<%@page import="managerDAO.ProductDAO"%>
<%@page import="managerVO.CatVO"%>
<%@page import="java.util.List"%>
<%@page import="managerDAO.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../../common/css/manager_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/manager_product_category.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".align-btn").click(function() {
		$(".align-subbtn").toggle();
		$(".align-icon").toggleClass("align-icon-change");
	});
	
	//댓글 신고 팝업창 열기
	$(".rc_txt").click(function() {
		window.open("manager_pm_comments_popup.jsp","comments_popup",
				"width=1025,height=592,top=311,left=560");
	});
	
	//상품 팝업창 열기
	$(".title-link").click(function() {
		window.open("manager_pm_product_popup.jsp","product_popup",
				"width=780,height=930,top=0,left=560");
	});
	
	//카테고리가 선택되었을 시
	$("#category").change(function(){
		$("#categoryFlag").val($("#category").val());
		$("#hidFrm").submit();
	});
	
	//전체 상품이 눌렸을 시 혹은 초기 집입 시
	$("#allBtn").click(function(){
		$("#selStatus").val(0);
		$("#categoryFlag").val($("#category").val());
		$("#hidFrm").submit();
	});
	
	//판매중 눌렀을 시
	$("#onSaleBtn").click(function(){
		$("#selStatus").val(1);
		$("#categoryFlag").val($("#category").val());
		$("#hidFrm").submit();
	});
	
	//거래완료 눌렀을 시
	$("#soldoutBtn").click(function(){
		$("#selStatus").val(2);
		$("#categoryFlag").val($("#category").val());
		$("#hidFrm").submit();
	});
	
	//검색버튼 눌렀을 시
	$("#searchBtn").click(function(){
		var keyword = $("#titleSearch").val();
		if(keyword.trim().length<2) {
			alert("두 글자 이상 입력하세요!");
			return;
		}
		$("#searchFrm").submit();
	})
	
});

function check() {
	if($("[name='chkFlag']").is(":checked")) {
		$("[name='productChk']").prop("checked",true);
	} else {
		$("[name='productChk']").prop("checked",false);
	}
};
</script>
<%-- 세션만료시 로그인 창 --%>
<c:if test="${ empty manager_id }"> 
<% response.sendRedirect("../../login/jsp/manager_login.jsp");%>
</c:if>

</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../../manager/m_common/manager_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">
	<div class="product_management-wrap">
	
		<!-- 상품관리 아이콘 -->
		<div class="product_management-icon">
			<svg class="clipboard-check" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
			  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
			  <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
			</svg>
			<span>상품관리</span>
		</div>
		
		<!-- 본문 -->
		<div class="product_management">
		
			<!-- 상단 필터 -->
			<div class="pm_btn-wrap">
				<button type="button" class="pm_btn" id="allBtn">전체</button>
				<button type="button" class="pm_btn" id="onSaleBtn">판매중</button>
				<button type="button" class="pm_btn" id="soldoutBtn">거래완료</button>
			</div>
			<!-- 파라메터를 묶기 위한 폼 -->
			<form id="hidFrm" method="get">
			<input type="hidden" id="selStatus" name="selStatus" value="${ empty param.selStatus?'0':param.selStatus }"/>
			<input type="hidden" id="categoryFlag" name="categoryFlag" value="${ param.categoryFlag }"/>
			</form>
			
			
			<div class="pm">
				<!-- 왼쪽 -->
				<div class="pm_top">
					<a class="report_comments_btn" href="">
						<div class="rc_txt">신고받은 댓글</div>
					</a>
					<div class="pm-btn-search">
						<button type="button" class="all-delete-btn">일괄삭제</button>
						<div class="align-btn-wrap">
							<button type="button" class="align-btn">정렬
								<svg class="align-icon" xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
								  <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
								</svg>
							</button>
							<button type="button" class="align-subbtn">등록일순↑↓</button>
							<button type="button" class="align-subbtn">신고수순↑↓</button>
						</div>
					</div>
					<div class="search-wrap">
					<!-- 검색을 위한 폼 -->
					<form id="searchFrm">
						<input hidden="hidden"><input autocomplete="off" type="text" class="search-txt" id="titleSearch" name="titleSearch" value="${ param.titleSearch }" placeholder="제목을 입력하세요.">
						<button type="button" class="search-bar" id="searchBtn">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
						</button>
					</form>	
					</div>
				</div>
				<!-- 오른쪽 -->
				<div class="pm-bottom">
					<%
					//카테고리 리스트 불러오기
					CatDAO cDAO = CatDAO.getInstance();  
					List<CatVO> catList = cDAO.selectCat();
					pageContext.setAttribute("catList", catList);
					%>
					<select id="category" name="category" class="category-select">
							<option value="0">전체</option>
							<c:forEach var="catList" items="${ catList }">
							<option value="${ catList.category_idx }"${ catList.category_idx eq param.categoryFlag?" selected='selected'":""}><c:out value="${ catList.category }"/></option>
							</c:forEach>
					</select>
					<div class="table-wrap">
							<%-- 메서드 매개변수VO 값설정 --%>
							<jsp:useBean id="psVO" class="managerVO.ProductSearchVO"></jsp:useBean><%-- VO생성 --%>
							<jsp:setProperty property="*" name="psVO"/><%-- hidFrm 서브밋시 form name과 변수명이 같은 같 자동 setter --%>
							<%
							//상품불러오기
							ProductDAO dDAO = ProductDAO.getInstance(); 
				    		List<ProductVO> proList = dDAO.selectProduct(psVO);
							%>
							<c:if test="${ not empty param.titleSearch }">
							<% proList=dDAO.selectKeywordProduct(request.getParameter("titleSearch").trim()); %>
							</c:if>
							<% pageContext.setAttribute("proList", proList); %>
						 	<table class="table">
						    <caption>표 제목</caption>
						    <tr><th><input type="checkbox" name="chkFlag" class="table-check" onclick="check()"></th><th class="table-title">제목</th><th>작성자</th><th>상품카테고리</th><th>상태</th><th>등록일</th><th>신고수</th></tr>
						    <c:if test="${ empty pageScope.proList }">
						  	<tr><td colspan="7">조회된결과가 없습니다.</td></tr>
						  	</c:if>
						  	<c:forEach var="proList" items="${ pageScope.proList }">
						    <tr><td><input type="checkbox" name="productChk" class="table-check" value="${ proList.product_idx }"></td><td class="table-title title-link"><c:out value="${ proList.title }"/></td><td><c:out value="${ proList.id }"/></td><td><c:out value="${ proList.category }"/></td><td><c:out value="${ proList.sold_check }"/></td><td><c:out value="${ proList.posted_date }"/></td><td><c:out value="${ proList.report_cnt }"/></td></tr>
						  	</c:forEach>
						 </table>  
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- container end -->

<!-- footer -->
<%@ include file="../../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>
</body>
</html>