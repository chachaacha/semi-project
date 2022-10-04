<%@page import="managerVO.ProductVO"%>
<%@page import="managerDAO.ProductDAO"%>
<%@page import="managerVO.CatVO"%>
<%@page import="java.util.List"%>
<%@page import="managerDAO.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	})
	
	//댓글 신고 팝업창 열기
	$(".rc_txt").click(function() {
		window.open("manager_pm_comments_popup.jsp","comments_popup",
				"width=1025,height=592,top=311,left=560");
	})
	
	//상품 팝업창 열기
	$(".title-link").click(function() {
		window.open("manager_pm_product_popup.jsp","product_popup",
				"width=780,height=930,top=0,left=560");
	})
	
	
})
</script>
</head>
<% 
// 세션만료시 로그인화면으로 복귀
	if(session.getAttribute("manager_id")==null) {
		response.sendRedirect("../../login/jsp/manager_login.jsp");
	}
%>
<jsp:useBean id="cVO" class="managerVO.CatVO"></jsp:useBean>
<jsp:useBean id="pVO" class="managerVO.ProductVO"></jsp:useBean>
<% 
  	// 상품카테고리 불러오기
	CatDAO cDAO = CatDAO.getInstance();  
	List<CatVO> catList = cDAO.selectCat();	
	
	// 상품목록
	ProductDAO pDAO = ProductDAO.getInstance();
	List<ProductVO> proList = pDAO.selectProduct();
%>
 
<body>
<form name="mpc">
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
				<button type="button" class="pm_btn">전체</button>
				<button type="button" class="pm_btn">판매중</button>
				<button type="button" class="pm_btn">거래완료</button>
			</div>
			
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
						<input type="text" class="search-txt" placeholder="제목을 입력하세요.">
						<button type="button" class="search-bar">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
						</button>
					</div>
				</div>
				<!-- 오른쪽 -->
				<div class="pm-bottom">
					<select name="category" class="category-select">
							<option value="">카테고리</option>
					<% for(int i = 0; i<catList.size(); i++){
							 cVO = catList.get(i);  %>
							<option value="<%= cVO.getCategory_idx()%>"><%= cVO.getCategory() %></option>
					<% } %>
			
					</select>
					
					
					<div class="table-wrap">
						 <table class="table">
						    <caption>표 제목</caption>
						    <tr><th><input type="checkbox" name="checkbox" class="table-check"></th><th class="table-title">제목</th><th>작성자</th><th>상품카테고리</th><th>상태</th><th>등록일</th><th>신고수</th></tr>
							<% for(int i = 0 ; i < proList.size() ; i++){ 
								pVO = proList.get(i); %>
						    	<tr><td><input type="checkbox" name="checkbox" class="table-check"></td><td class="table-title "><%= pVO.getTitle() %></td><td><%= pVO.getId() %></td><td><%= pVO.getCategory() %></td><td><%= pVO.getSold_check() %></td><td><%= pVO.getPosted_date() %></td><td><%= pVO.getReport_cnt() %></td></tr>
						    <% } %>
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
</form>
</body>
</html>