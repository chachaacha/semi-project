<%@page import="javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar"%>
<%@page import="userVO.HomeVO"%>
<%@page import="userVO.MainFlagVO"%>
<%@page import="userVO.LocVO"%>
<%@page import="userVO.CatVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 형식 지정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 사이즈 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="sVO" class="userVO.SearchVO" scope="page"/>
<jsp:useBean id="mfVO" class="userVO.MainFlagVO" scope="page"/>
<jsp:useBean id="hVO" class="userVO.HomeVO" scope="page"/>
<jsp:setProperty property="*" name="sVO"/>
<jsp:setProperty property="*" name="mfVO"/>
<jsp:setProperty property="*" name="hVO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_search.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
/* 필터 접고 펴는 기능 */
	$(".category-button").click(function() {
		$(".category-list-wrap").toggle();
		$(".category-button .down-img").toggleClass("down-img-change");
	})
	
	$(".sort-button").click(function() {
		$(".sort-list-wrap").toggle();
		$(".sort-button .down-img").toggleClass("down-img-change");
	})
	
	$(".price-button").click(function() {
		$(".price-list-wrap").toggle();
		$(".price-button .down-img").toggleClass("down-img-change");
	})
	
	$(".price-list-input").click(function() {
		$(".ant-space-item").show();
	})
	
	$(".price-list").click(function() {
		$(".ant-space-item").hide();
	})
	
	//카테고리 flag 전달
	$(".category-list-text").click(function() {
		var catVal=$(this).attr("value");
		$("#pageFlag").val(1);
		$("#categoryFlag").val(catVal);
		$("#searchFrm").submit();
	})
	
	//지역 flag 전달
	$(".hot-articles-nav-select").change(function() {
		var locVal=$(this).val();
		$("#pageFlag").val(1);
		$("#guFlag").val(locVal);
		$("#searchFrm").submit();
	})
	
	//가격 직접입력시 최소 최고 가격 전달
	$(".input-btn").click(function() {
		var priceVal=$('input:radio[name="price-radio"]:checked').val();
		var min=$("#input-minPrice").val();
		var max=$("#input-maxPrice").val();
		
		$("#pageFlag").val(1);
		$("#priceFlag").val(priceVal);
		$("#minPrice").val(min);
		$("#maxPrice").val(max);
		$("#searchFrm").submit()
	})
	
	$(".resetBtn").click(function() {
		location.href="../../search/jsp/user_search.jsp";
	})
})

	//정렬 flag 전달
	function orderRadio() {
		var orderVal=$('input:radio[name="sort-radio"]:checked').val();
		$("#pageFlag").val(1);
		$("#orderByFlag").val(orderVal);
		$("#searchFrm").submit();
	}
	
	//가격 flag 전달
	function priceRadio() {
		var priceVal=$('input:radio[name="price-radio"]:checked').val();
		$("#pageFlag").val(1);
		$("#priceFlag").val(priceVal);
		$("#searchFrm").submit();
	}
	
	function pageMove(nowPage) { //페이지 이동
		$("#pageFlag").val(nowPage);
		$("#searchFrm").submit();
	}
	
	function enterWrite() { //글쓰기버튼
		var userID="<%=(String)session.getAttribute("id")%>";
		if(userID=="null" ) {
			alert("로그인을 해주세요.");
		}else {
			location.href="../../search/jsp/user_write.jsp";
		}
	}
	
</script>
</head>
<body>

<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<% 

//MainDAO 생성
MainDAO mDAO=MainDAO.getInstance();

//상품 카테고리 조회
List<CatVO> catList=mDAO.selectCat();
pageContext.setAttribute("catList", catList);

//검색어 db저장
String searchTxt=mfVO.getKeyword();
pageContext.setAttribute("searchTxt", searchTxt);

//검색어가 null이 아닐 경우에만 값 저장
//검색어 공백 제거
if(searchTxt != null && !"".equals(searchTxt)) {
mDAO.insetKeyword(searchTxt.trim());
}

//지역 카테고리 조회
List<LocVO> lVOList=mDAO.selectGu();
pageContext.setAttribute("lVOList", lVOList);

//상품의 총 개수 구함
int total=mDAO.selectTotal(mfVO);
//System.out.println("총 게시물 수 : "+ total);
pageContext.setAttribute("total", total);

//상품 리스트 조회
//처음 매물창에 들어왔을때 페이지 값이 0인지 확인하고 0일경우 1 설정
if(mfVO.getPageFlag()==0) {
mfVO.setPageFlag(1);
}

List<HomeVO> hVOList=mDAO.selectProduct(mfVO);
pageContext.setAttribute("hVOList", hVOList);
//System.out.println("필터 적용된 게시물의 수 : "+hVOList.size());

%>

<!-- container -->
<div class="container">
	<div class="test">
	<div class="content">
		<h1 class="content-head-title">
		 <c:out value="${lVOList[param.guFlag-1].gu}"/> 중고거래 매물
		</h1>
		<div class="content-wrap">
		
			<!-- 왼쪽 필터 영역  -->
			<div class="filter"> 
				<div class="filter-text">
					필터
					<c:if test="${not empty param.pageFlag  || not empty param.keyword  || not empty param.guFlag  || not empty param.categoryFlag  || not empty param.orderByFlag || not empty param.priceFlag || not empty param.minPrice || not empty param.maxPrice}">
						<span class="resetBtn">초기화
							<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi-arrow-clockwise" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
							  <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
							</svg>
						</span>
					</c:if>
				</div>
					
					<div class="category">
						<button type ="button" class="category-button">
							<div class="category-title">카테고리</div>
							<span role="img" aria-label="down" class="anticon anticon-down">
								<svg class="down-img" viewBox="64 64 896 896" focusable="false" data-icon="down" width="1em" height="1em" fill="currentColor" aria-hidden="true">
									<path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z">
									</path>
								</svg>
							</span>
						</button>
						<div class="category-list-wrap">
							<div>
								<div class="category-list">
									<a href="javascript:void(0);">
										<div class="category-list-text" value="0">전체</div>
									</a>
								</div>
								<!-- 상품 카테고리 목록 불러오기  -->
								<c:forEach var="cVO" items="${catList}">
									<div class="category-list">
										<a href="javascript:void(0);">
											<div class="category-list-text" value="${cVO.category_idx}"><c:out value="${cVO.category}"/></div>
										</a>
									</div>
								</c:forEach>
							</div>
						</div> 
					</div>
						
					<div class="sort">
						<button type ="button" class="sort-button">
							<div class="sort-title">정렬</div>
							<span role="img" aria-label="down" class="anticon anticon-down">
								<svg class="down-img" viewBox="64 64 896 896" focusable="false" data-icon="down" width="1em" height="1em" fill="currentColor" aria-hidden="true">
									<path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z">
									</path>
								</svg>
							</span>
						</button>
						<div class="sort-list-wrap">
							<div>
								<div class="sort-list">
									<label class="sort-radio-wrap">
										<span class="sort-radio">
											<input type="radio" name="sort-radio" id="sort-radio" <c:if test="${0 eq param.orderByFlag || empty param.orderByFlag  }"> checked="checked" </c:if> onchange="orderRadio(this)" class="input-radio"  value="0">
										</span>
										<span>최신순</span>
									</label>
								</div>
								<div class="sort-list">
									<label class="sort-radio-wrap">
										<span class="sort-radio">
											<input type="radio"  name="sort-radio" id="sort-radio" <c:if test="${1 eq param.orderByFlag }"> checked="checked" </c:if> onchange="orderRadio(this)" class="input-radio" value="1">
										</span>
										<span>과거순</span>
									</label>
								</div>
								<div class="sort-list">
									<label class="sort-radio-wrap">
										<span class="sort-radio">
											<input type="radio" name="sort-radio" id="sort-radio" <c:if test="${2 eq param.orderByFlag }"> checked="checked" </c:if> onchange="orderRadio(this)" class="input-radio" value="2">
										</span>
										<span>인기순</span>
									</label>
								</div>
								<div class="sort-list">
									<label class="sort-radio-wrap">
										<span class="sort-radio">
											<input type="radio" name="sort-radio" id="sort-radio" <c:if test="${3 eq param.orderByFlag }"> checked="checked" </c:if> onchange="orderRadio(this)" class="input-radio" value="3">
										</span>
										<span>댓글순</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					
					<div class="price">
						<button type ="button" class="price-button">
							<div class="price-title">가격</div>
							<span role="img" aria-label="down" class="anticon anticon-down">
								<svg class="down-img" viewBox="64 64 896 896" focusable="false" data-icon="down" width="1em" height="1em" fill="currentColor" aria-hidden="true">
									<path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z">
									</path>
								</svg>
							</span>
						</button>
						<div class="price-list-wrap">
							<div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" onchange="priceRadio()" <c:if test="${0 eq param.priceFlag || empty param.priceFlag  }"> checked="checked" </c:if> class="input-radio" value="0">
										</span>
										<span>전체가격</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" onchange="priceRadio()"  <c:if test="${1 eq param.priceFlag}"> checked="checked" </c:if> class="input-radio" value="1">
										</span>
										<span>나눔</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" onchange="priceRadio()" <c:if test="${2 eq param.priceFlag}"> checked="checked" </c:if> class="input-radio" value="2">
										</span>
										<span>5,000원 이하</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" onchange="priceRadio()" <c:if test="${3 eq param.priceFlag}"> checked="checked" </c:if> class="input-radio" value="3">
										</span>
										<span>5,000원 - 1만원 이하</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" onchange="priceRadio()" <c:if test="${4 eq param.priceFlag}"> checked="checked" </c:if> class="input-radio" value="4">
										</span>
										<span>1만원 - 5만원 이하</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" onchange="priceRadio()" <c:if test="${5 eq param.priceFlag}"> checked="checked" </c:if> class="input-radio" value="5">
										</span>
										<span>5만원 - 10만원 이하</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" onchange="priceRadio()" <c:if test="${6 eq param.priceFlag}"> checked="checked" </c:if> class="input-radio" value="6">
										</span>
										<span>10만원 이상</span>
									</label>
								</div>
								<div class="price-list-input">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" <c:if test="${7 eq param.priceFlag}"> checked="checked" </c:if> class="input-radio" value="7">
										</span>
										<span>직접입력</span>
									</label>
								</div>
								<div class="ant-space-item">
									<div class="ant-space-item-input">
											<input type="text" name="input-minPrice" id="input-minPrice" placeholder="최저가" class="ant-input" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
											<span>~</span>
											<input type="text" name="input-maxPrice" id="input-maxPrice" placeholder="최고가" class="ant-input" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									</div>
									<button type="button" class="input-btn">적용</button>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			
			<!-- 오른쪽 매물 리스트 영역 -->
			<div class="content-list-wrap">
			
				<%-- <c:set var="filterTotal" value="${fn:length(hVOList)}"/> --%>
				<!-- 오른쪽 매물 위 -->
				<div class="content-list-top">
					<div class="content-list-top-left">
					<c:choose>
						<c:when test="${not empty fn:trim(searchTxt)}">
							<c:out value="${searchTxt}"/> 검색 결과 (<c:out value="${total}"/>)
						</c:when>
						<c:when test="${param.categoryFlag eq 0}">
							전체 카테고리 (<c:out value="${total}"/>)
						</c:when>
						<c:when test="${not empty param.categoryFlag}">
							<c:out value="${catList[param.categoryFlag-1].category}"/> 검색 결과 (<c:out value="${total}"/>)
						</c:when>
						<c:otherwise>
							전체 카테고리 (<c:out value="${total}"/>)
						</c:otherwise>
					</c:choose>
					</div>
					
					<div class="content-list-top-right">
						<div class="content-list-top-right-text">서울특별시</div>
						<select name="guFlag" class="hot-articles-nav-select">
							<option value="0">동네를 선택하세요</option>
								<!-- 구 데이터 불러오기  -->
								<c:forEach var="lVO" items="${lVOList}">
									<option value="<c:out value="${lVO.gu_idx}"/>" <c:if test="${lVO.gu_idx eq param.guFlag }"> selected="selected" </c:if>><c:out value="${lVO.gu}"/></option>
								</c:forEach>
							</select>
					</div>
				</div>
				
				<!-- 오른쪽 매물 가운데 -->


				<div class="content-list-middle">
					<!-- 상품이 없을 시 -->
					<c:if test="${empty hVOList }">
						조회결과가 없습니다.
					</c:if>
					<!-- 상품 불러오기 -->
					<c:forEach var="hoVO" items="${hVOList}">
					<div class="card">
							<div class="card-photo">
							<a class="card-link" href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${hoVO.product_idx}">
								<img alt="이미지 자리" src="<c:out value="${hoVO.thumbnail}"/>">
							</a>
							</div>
							<div class="card-desc">
							<a class="card-link" href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${hoVO.product_idx}">
								<h2 class="card-title"> <c:out value="${hoVO.title}"/> </h2>
							</a>
								<div class="card-price">
									<!-- 가격이 0일때 나눔 -->
									<c:if test="${hoVO.price eq 0}">
										나눔
									</c:if>
									<!-- 가격이 0이 아닐때 #,### 형식으로 출력 -->
									<c:if test="${hoVO.price ne 0}">
										<fmt:formatNumber value="${hoVO.price}" pattern="#,###,###원"/>
									</c:if>
									</div>
								<div class="card-region-name"> <c:out value="${hoVO.gu}"/> </div>
							</div>
							<div class="card-counts">
								<span> 하트 <c:out value="${hoVO.liked_cnt}"/> </span>
								ㆍ
								<span> 댓글 <c:out value="${hoVO.comment_cnt}　"/> </span>
							</div>
						
					</div>
					</c:forEach>
				</div>
				
				<!-- 오른쪽 매물 하단 글쓰기 버튼 -->
				<div class="write-bottom">
					<div class="write-bottom-wrap">
                   	 <a href="javascript:enterWrite();" class="write-bottom-btn">
	                   	 <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(255, 255, 255)">
	                   	 <path d="M35.5 14L28 6.5l-20 20V34h7.5l20-20zm5.91-5.91c.78-.78.78-2.05 0-2.83L36.74.59c-.78-.78-2.05-.78-2.83 0L30 4.5l7.5 7.5 3.91-3.91z"></path>
	                   	 <path fill-opacity=".36" d="M0 40h48v8H0z">
	                   	 </path></svg>
                   	 글쓰기</a>
            		</div>
				</div>
				
				<c:set var="ceil"  value="${total/16}"/> <%-- //총 게시물 수/16(=한 페이지에 보이고 싶은 카드의 개수) --%>
				<fmt:parseNumber var="lastpage" integerOnly="true" value="${ceil+(1-(ceil%1))%1 }"/> <%-- // 총 페이지의 수 (올림처리. int형으로 소수점 버림) ex) 1.5일 경우 총 2페이지 2.3일 경우 총 3페이지 --%>
				<c:set var="curPage" value="${empty param.pageFlag ? 1 : param.pageFlag }"/> <%-- // 현재페이지  (pageFlag가 비어있을때는 1로 계산 : class 설정필요때문=처음 매물창 접속시 1페이지버튼이 주황색이어야해서) --%>
				<c:set var="startNum" value="${curPage - (curPage-1) % 4 }"/> <%-- // 현재 페이지가 속한 처음 페이지의 수 구하기 %4 (= 4는 한번에 노출시키고자하는 페이지블럭의 갯수를 설정해둔것) --%>
				<c:set var="isLast" value="3"/> <%-- // forEach 돌릴때 end의 기본값, 한번에 페이지 4개만 노출시키고 싶음 ex) 1,2,3,4 => begin이 0부터 시작하므로 end의 기본값은 3 --%>
				
				<!-- 오른쪽 매물 하단 페이지 버튼 -->
				<c:if test="${not empty hVOList }">	<%-- // 만약 게시글 수가 0일때 페이지생성을 못하도록 조건을 줌 (게시글이 있을 경우에만 페이지 생성) --%>
					<div class="page-bottom">
						
						<%-- // 이전 버튼 생성 (<<)(<) --%>
						<c:if test="${curPage >= 5}"> <%-- // 현재 페이지가 5이상일때부터 (<)버튼 생성 --%>
							<a href="javascript:pageMove(1);" class="page-bottom-next">&lt;&lt;</a> <%-- // 누르면 pageFlag 1로 이동시킴 --%>
							<a href="javascript:pageMove(${curPage-4});" class="page-bottom-next">&lt;</a> <%-- // (<) 누르면 pageFlag를 현재페이지에서-4로 이동시킴(이전 페이지 블럭) --%>
						</c:if>					
					
						<%-- // 페이지블럭 구하기 (4개씩만=4개씩만 출력하기원해서 조건값을 줬기 때문)  --%>
						<c:if test="${startNum + 4 >= lastpage }"> 
						<%-- // 만약 총페이지수보다 현재페이지가 속한 처음페이지 + 4가 더 크다면 총페이지수에서 - 처음페이지구함 = 마지막 페이지 블럭의 end값 구하기   --%>
						<%-- // 12 + 4 >= 13 (true) => 13 - 12 = 1 => begin=0 end=1 => 12, 13 까지만 페이지 생성 --%>
							<c:set var="isLast" value="${lastpage - startNum }"/>
						</c:if>
						
						<%-- // 페이지블럭의 기본값은 3이기 때문에 총 4씩 출력, 마지막페이지 수를 구할땐 위의 if를 타고 구해진 isLast값이 새로 들어가서 마지막페이지블럭 출력 --%>
						<c:forEach var="i" begin="0" end="${isLast }" step="1" >
							<a href="javascript:pageMove(${startNum + i});" ${curPage eq startNum + i ? "class='page-bottom-icon-click'" : "class='page-bottom-icon'"}><c:out value="&nbsp;${startNum+i}&nbsp;" escapeXml="false"/></a>
																					<%-- // 현재페이지와 버튼의 출력값이 같을때 주황색으로 보이도록 설정 : 아닐경우 흰색 --%>
						</c:forEach>
						
						<%-- // (>)(>>) 다음 버튼 생성  --%>
						<c:if test="${startNum + 4 < lastpage }"> <%-- // 마지막 페이지에는 생성이 안되도록 조건 --%>
							<a href="javascript:pageMove(${startNum+4});" class="page-bottom-next">&gt;</a> <%-- // (>)버튼을 누르면 pageFlag에서 + 4 로 이동시킴 --%>
							<a href="javascript:pageMove(${lastpage});" class="page-bottom-next">&gt;&gt;</a> <%-- // (>>)버튼을 누르면 마지막 페이지로 이동  --%>
						</c:if>
					
					</div>
				</c:if>
				
			</div>
			
		</div>
		
	</div>
	</div>
</div>
<!-- container end -->

<form id="searchFrm">
	<input type="hidden" name="pageFlag" id="pageFlag" value="${param.pageFlag }">
	<input type="hidden" name="keyword" id="keyword" value="${param.keyword }">
	<input type="hidden" name="guFlag" id="guFlag" value="${param.guFlag}">
	<input type="hidden" name="categoryFlag" id="categoryFlag" value="${param.categoryFlag}">
	<input type="hidden" name="orderByFlag" id="orderByFlag" value="${param.orderByFlag }">
	<input type="hidden" name="priceFlag" id="priceFlag" value="${param.priceFlag }">
	<input type="hidden" name="minPrice" id="minPrice" value="${param.minPrice }">
	<input type="hidden" name="maxPrice" id="maxPrice" value="${param.maxPrice }">
</form>

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>

</body>
</html>