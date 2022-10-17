<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
	
	////////////////////////////////////  정렬버튼시작  ////////////////////////////////////////
	//정렬 버튼 클릭시 숨은 버튼 생성
 	$(".align-btn").click(function() {
		$(".align-subbtn").toggle();
		/* $("#date-asc").hide(); */
	    /* $("#report-asc").hide(); */
		$(".align-icon").toggleClass("align-icon-change");
		
		/* var alignClass=$(".align-icon").attr("class");
		if(alignClass=="align-icon") {
		 	$("#date-desc").hide();
			$("#date-asc").hide();
			$("#report-desc").hide();
			$("#report-asc").hide();  
		} */
	}); 
	
	//등록일순 버튼 정렬변경
	//등록일순 내림차순 누를 시
	$("#date-desc").click(function() {
		$("#dateOrderFlag").val(1);
		$("#reportOrderFlag").val(null);
	/* 	$("#date-asc").show();
		$("#date-desc").hide(); */
		$("#hidFrm").submit();
		
	});
	
	//등록일순 오름차순 누를 시
	$("#date-asc").click(function() {
		$("#dateOrderFlag").val(2);
		$("#reportOrderFlag").val(null);
	/* 	$("#date-desc").show();
		$("#date-asc").hide(); */
		$("#hidFrm").submit();
		
	});
	
	//신고순 버튼 정렬변경
	//신고순 내림차순 누를 시
	$("#report-desc").click(function() {
		$("#reportOrderFlag").val(1);
		$("#dateOrderFlag").val(null);
		/* $("#report-asc").show();
		$("#report-desc").hide(); */
		$("#hidFrm").submit();
	
	});
	
	//신고순 오름차순 누를 시
	$("#report-asc").click(function() {
		$("#reportOrderFlag").val(2);
		$("#dateOrderFlag").val(null);
	/* 	$("#report-desc").show();
		$("#report-asc").hide(); */
		$("#hidFrm").submit();
		
	});
	/////////////////////////////////////////// 정렬버튼 끝///////////////////////////////////////////////////
	
	
	
	////////////////////////////////////// 검색옵션 시작/////////////////////////////////////////////////////
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
	});
   /////////////////////////////////// 검색옵션 끝//////////////////////////////////////
   
   
   	////////////////////////////////////////// 팝업창 시작 ////////////////////////////////////////////////////
	//댓글 신고 팝업창 열기
	$(".rc_txt").click(function() {
		window.open("manager_pm_comments_popup.jsp","comments_popup",
				"width=1025,height=592,top=311,left=560");
	});
	
	///////////////////////////////////////  팝업창 끝  //////////////////////////////////////////////////
   
	//일괄삭제
	$("#deleteBtn").click(function(){
		if($("[name='productChk']:checked").val()==null){
			alert("삭제할 상품을 선택하세요.");
		} else {
			if(confirm("정말로 삭제하시겠습니까?")){
				$("#deleteFrm").submit();
			}
		}
	});
	
});// end document ready

//일괄선택
function check() {
	if($("#chkFlag").is(":checked")) {
		$("[name='productChk']").prop("checked",true);
	} else {
		$("[name='productChk']").prop("checked",false);
	}
};

//게시글 팝업
function openPopup(pIdx) {
	open("","product_popup","width=780,height=930,top=0,left=560");
	$("#pIdx").val(pIdx);
	$("#popupFrm").submit();
};

//페이지 이동
function pageMove(page) {
	$("#pageFlag").val(page);
	$("#hidFrm").submit();
}

</script>

<%-- 세션만료시 로그인 창 복귀 --%>
<c:if test="${ empty manager_id }">
<c:redirect url="../../login/jsp/manager_login.jsp"/> 
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
			<%-- selline변수를 주고 값에 상품상태에 대한 값을 담는다. --%>
			<c:set var="selLine" value="${empty param.selStatus ? 0: param.selStatus}"/>
			<!-- 상단 필터 -->
			<div class="pm_btn-wrap">
				<%-- selline 변수가 설정되면 = 상품상태값이 선택되면, 클래스를 선택되게 바꾸고 아니면 기본 클래스 --%>
				<button type="button" ${selLine eq 0 ? "class='pm_btn-check'" : " class='pm_btn' "} id="allBtn">전체</button>
				<button type="button" ${selLine eq 1 ? "class='pm_btn-check'" : " class='pm_btn' "} id="onSaleBtn">판매중</button>
				<button type="button" ${selLine eq 2 ? "class='pm_btn-check'" : " class='pm_btn' "} id="soldoutBtn">거래완료</button>
			</div>
			<!-- 파라메터를 묶기 위한 폼 -->
			<form id="hidFrm" method="get">
			<input type="hidden" id="selStatus" name="selStatus" value="${ param.selStatus }"/>
			<input type="hidden" id="categoryFlag" name="categoryFlag" value="${ param.categoryFlag }"/>
			<input type="hidden" id="dateOrderFlag" name="dateOrderFlag" value="${ param.dateOrderFlag }"/>
			<input type="hidden" id="reportOrderFlag" name="reportOrderFlag" value="${ param.reportOrderFlag }"/>
			<input type="hidden" id="pageFlag" name="pageFlag" value="${ param.pageFlag }"/>
			</form>
			
			<!-- 팝업을 post방식으로 열기위한 폼 --> 
			<form method="post" action="manager_pm_product_popup.jsp" target="product_popup" id="popupFrm">
				<input type="hidden" id="pIdx" name="product_idx"/>
			</form>
			
			<div class="pm">
				<!-- 왼쪽 -->
				<div class="pm_top">
					<a class="report_comments_btn" href="">
						<div class="rc_txt">신고받은 댓글</div>
					</a>
					<div class="pm-btn-search">
						<button type="button" class="all-delete-btn" id="deleteBtn">일괄삭제</button>
						<div class="align-btn-wrap">
							<c:if test="${ empty param.titleSearch }"> 
							<button type="button" class="align-btn">정렬
								<svg class="align-icon" xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
								  <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
								</svg>
							</button>
						    </c:if> 
							<c:choose>
							<c:when test="${ param.dateOrderFlag eq 2  }">
							<button type="button" class="align-subbtn" id="date-desc">
								<span>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi-check" viewBox="0 0 16 16">
									  <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
									</svg>
								<span${ not empty param.dateOrderFlag?" style='color:black;font-weight:bold'":"" }>등록일</span>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi-arrow-down" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
									</svg>
								</span>
							</button>
							</c:when>
							<c:when test="${ param.dateOrderFlag eq 1 or empty  param.dateOrderFlag  }">
							<button type="button" class="align-subbtn" id="date-asc">
								<span>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi-check" viewBox="0 0 16 16">
									  <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
									</svg>
								<span${ not empty param.dateOrderFlag or empty param.reportOrderFlag?" style='color:black;font-weight:bold'":"" }>등록일</span>
								 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi-arrow-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
									</svg>
							 	</span>
							</button>
							</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${ param.reportOrderFlag eq 2 or empty param.reportOrderFlag }">
							<button type="button" class="align-subbtn" id="report-desc">
								<span>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi-check" viewBox="0 0 16 16">
									  <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
									</svg>
								 <span${ not empty  param.reportOrderFlag?" style='color:black;font-weight:bold'":"" }>신고수</span>
								 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi-arrow-down" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
									</svg>								 
								</span>
							</button>
							</c:when>
							<c:when test="${ param.reportOrderFlag eq 1 }">
							<button type="button" class="align-subbtn" id="report-asc">
								<span>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi-check" viewBox="0 0 16 16">
									  <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
									</svg>
								 <span${ not empty  param.reportOrderFlag?" style='color:black;font-weight:bold'":"" }>신고수</span>
								 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi-arrow-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
									</svg>
							 	</span>
							</button>
							</c:when>
							</c:choose>
						</div>
					</div>
					<!-- 검색을 위한 폼 -->
					<form id="searchFrm" method="post">
					<div class="search-wrap">
						<input hidden="hidden"><input autocomplete="off" type="text" class="search-txt" id="titleSearch" name="titleSearch" value="${ param.titleSearch }" placeholder="제목을 입력하세요.">
						<button type="button" class="search-bar" id="searchBtn">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
						</button>
					</div>
					</form>	
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
					<div>
					<div class="table-wrap">
							<%-- 메서드 매개변수VO 값설정 --%>
							<jsp:useBean id="psVO" class="managerVO.ProductSearchVO"></jsp:useBean><%-- VO생성 --%>
							<jsp:setProperty property="*" name="psVO"/><%-- hidFrm 서브밋시 form name과 변수명이 같은 같 자동 setter --%>
							<%-- 기본적으로는 날짜 내림차순정렬로 보여준다. --%>
							<jsp:setProperty property="dateOrderFlag" name="psVO" value="${ empty param.dateOrderFlag and empty param.reportOrderFlag ?1:param.dateOrderFlag }"/>
							<jsp:setProperty property="pageFlag" name="psVO" value="${ empty param.pageFlag  ?1: param.pageFlag }"/>
							<%
							//상품불러오기
							ProductDAO pDAO = ProductDAO.getInstance(); 
				    		List<ProductVO> proList = pDAO.selectProduct(psVO);
				    		int total = pDAO.selectTotal(psVO);
				    		pageContext.setAttribute("total", total);
							%>
							<c:if test="${ not empty param.titleSearch }">
							<% proList=pDAO.selectKeywordProduct(request.getParameter("titleSearch").trim()); %>
							</c:if>
							<% pageContext.setAttribute("proList", proList); %>
						 <form id="deleteFrm" method="post" >
						 <table class="table">
						    <caption>표 제목</caption>
						    <tr><th><input type="checkbox" id="chkFlag" class="table-check" onclick="check()"></th><th class="table-title">제목</th><th>작성자</th><th>상품카테고리</th><th>상태</th><th>등록일</th><th>신고수</th></tr>
						    <c:if test="${ empty pageScope.proList }">
						  	<tr><td colspan="7">조회된결과가 없습니다.</td></tr>
						  	</c:if>
						  	<c:forEach var="proList" items="${ pageScope.proList }">
						    <tr><td><input type="checkbox" name="productChk" class="table-check" value="${ proList.product_idx }"></td><td><a href="javascript:openPopup('${ proList.product_idx }')" style="color:black"><c:out value="${ proList.title }"/></a></td><td><c:out value="${ proList.id }"/></td><td><c:out value="${ proList.category }"/></td><td><c:out value="${ proList.sold_check }"/></td><td><c:out value="${ proList.posted_date }"/></td><td><c:out value="${ proList.report_cnt }"/></td></tr>
						  	</c:forEach>
						 </table>  
						 </form>
				
						 <%-- 일괄삭제 처리 --%>
						 <c:if test="${ not empty paramValues.productChk or not empty param.productChk }">
						 <c:catch var="ex">
						 <% 
						 	String[] proArr = request.getParameterValues("productChk");
						 	List<String> list = new ArrayList<String>(Arrays.asList(proArr));
						 	int resultCnt = pDAO.deleteProduct(list);
						 	pageContext.setAttribute("resultCnt", resultCnt);
						 %>
						 </c:catch>
						 <c:if test="${ not empty ex }">
						 <%-- 향휴 테이블에 on cascade 설정하기 --%>
						 <script type="text/javascript">
						 alert("자식테이블에서 참조중! 예외발생!!");
						 location.href="manager_product_category.jsp";
						 </script>
						 </c:if>
						 <script type="text/javascript">
						 alert("${ pageScope.resultCnt }개의 게시물이 삭제되었습니다.");
						 location.href="manager_product_category.jsp";
						 </script>
						 </c:if>
					</div>
										<!-- 페이징 -->
				<c:if test="${ total gt 0 and empty param.titleSearch }">
				<c:set var="ceil" value="${ total/10 }"/>
				<fmt:parseNumber var="lastPage" integerOnly="true" value="${ ceil+(1-(ceil%1))%1  }"/>
				<c:set var="curPage" value="${ empty param.pageFlag? 1: param.pageFlag }"/>
				<c:set var="startNum" value="${ curPage-(curPage-1)%5 }"/>
				<c:set var="isLast" value="4"/>	
				
				<div class="page-bottom">
					<a href="javascript:pageMove(1)"  class="page-bottom-next">&lt;&lt;</a>
					<a href="javascript:pageMove('${ startNum eq 1 ? 1 :startNum-1 }')"  class="page-bottom-next">&lt;</a>
					<c:if test="${ startNum +5 > lastPage }">
						<c:set var="isLast" value="${lastPage - startNum }"/>
					</c:if>
					<c:forEach var="i" begin="0" end="${ isLast }" step="1">
						<a href="javascript:pageMove(${ startNum+i })" ${curPage eq startNum + i  ? "class='page-bottom-icon-click'" : "class='page-bottom-icon'"}><c:out value="&nbsp;${ startNum+i }&nbsp;" escapeXml="false"/></a>
					</c:forEach>
					
					<c:if test="${ startNum + 5 <= lastPage }">
						<a href="javascript:pageMove('${ startNum+5 }')"  class="page-bottom-next">&gt;</a>
						<a href="javascript:pageMove('${ lastPage }')"  class="page-bottom-next">&gt;&gt;</a>
					</c:if>
				</div>
				</c:if>
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