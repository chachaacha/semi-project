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
<%

/* int totalRecord=Integer.parseInt(request.getParameter("totalRecord")); */
int totalRecord=19;
int numPerPage=3;
int pagePerBlock=1;
int totalPage=0;
int totalBlock=0;
int nowPage=1;
int nowBlock=1;

int start=0;
int end=3;

int listSize=0;

if(request.getParameter("nowPage") !=null ) {
	nowPage=Integer.parseInt(request.getParameter("nowPage"));
}

start=(nowPage*numPerPage)-numPerPage;
end=numPerPage;

totalPage=(int)Math.ceil((double)totalRecord/numPerPage);
nowPage=(int)Math.ceil((double)nowPage/pagePerBlock);

totalBlock=(int)Math.ceil((double)totalPage/pagePerBlock);

%>
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
		$("#categoryFlag").val(catVal);
		$("#searchFrm").submit();
	})
	
	//지역 flag 전달
	$(".hot-articles-nav-select").change(function() {
		var locVal=$(this).val();
		$("#guFlag").val(locVal);
		$("#searchFrm").submit();
	})
	
	//가격 직접입력시 최소 최고 가격 전달
	$(".input-btn").click(function() {
		var priceVal=$('input:radio[name="price-radio"]:checked').val();
		var min=$("#input-minPrice").val();
		var max=$("#input-maxPrice").val();

		$("#priceFlag").val(priceVal);
		$("#minPrice").val(min);
		$("#maxPrice").val(max);
		$("#searchFrm").submit()
	})
	
});

	//정렬 flag 전달
	function orderRadio() {
		var orderVal=$('input:radio[name="sort-radio"]:checked').val();
		$("#orderByFlag").val(orderVal);
		$("#searchFrm").submit();
	}
	
	//가격 flag 전달
	function priceRadio() {
		var priceVal=$('input:radio[name="price-radio"]:checked').val();
		$("#priceFlag").val(priceVal);
		$("#searchFrm").submit();
	}
	
	function pageing(page) {
		$("#nowPage").val(page);
		$("#searchFrm").submit();
	}
	
	function block(value) {
		$("#nowPage").val(${param.pagePerBlock}+1);
		$("#searchFrm").submit();
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

//상품 리스트 조회
List<HomeVO> hVOList=mDAO.selectProduct(mfVO);
pageContext.setAttribute("hVOList", hVOList);
%>



<!-- container -->
<div class="container">
	<div class="test">
	<div class="content">
		<h1 class="content-head-title">
		 ${lVOList[param.guFlag-1].gu} 중고거래 매물
		</h1>
		<div class="content-wrap">
		
			<!-- 왼쪽 필터 영역  -->
			<div class="filter"> 
				<div class="filter-text">필터</div>
					
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
											<div class="category-list-text" value="${cVO.category_idx}">${cVO.category}</div>
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
			
				<!-- 오른쪽 매물 위 -->
				<div class="content-list-top">
					<div class="content-list-top-left">
					<c:choose>
						<c:when test="${not empty fn:trim(searchTxt)}">
							${searchTxt} 검색 결과
						</c:when>
						<c:when test="${not empty param.categoryFlag}">
							${catList[param.categoryFlag].category} 검색 결과
						</c:when>
						<c:otherwise>
							전체 카테고리
						</c:otherwise>
					</c:choose>
					(${fn:length(hVOList)})</div>
					
					<div class="content-list-top-right">
						<div class="content-list-top-right-text">서울특별시</div>
						<select name="guFlag" class="hot-articles-nav-select">
							<option value="0">동네를 선택하세요</option>
								<!-- 구 데이터 불러오기  -->
								<c:forEach var="lVO" items="${lVOList}">
									<option value="${lVO.gu_idx}" <c:if test="${lVO.gu_idx eq param.guFlag }"> selected="selected" </c:if>>${lVO.gu}</option>
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
						<a class="card-link" href="../../product/jsp/user_buyer_product.jsp"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="${hoVO.thumbnail}">
							</div>
							<div class="card-desc">
								<h2 class="card-title">${hoVO.title}</h2>
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
								<div class="card-region-name">${hoVO.gu}</div>
							</div>
							<div class="card-counts">
								<span> 하트 ${hoVO.liked_cnt} </span>
								ㆍ
								<span> 댓글 ${hoVO.comment_cnt} </span>
							</div>
						</a>
					</div>
					</c:forEach>
				</div>
				
				<!-- 오른쪽 매물 하단 글쓰기 버튼 -->
				<div class="write-bottom">
					<div class="write-bottom-wrap">
                   	 <a href="user_write.jsp" class="write-bottom-btn">
                   	 <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(255, 255, 255)">
                   	 <path d="M35.5 14L28 6.5l-20 20V34h7.5l20-20zm5.91-5.91c.78-.78.78-2.05 0-2.83L36.74.59c-.78-.78-2.05-.78-2.83 0L30 4.5l7.5 7.5 3.91-3.91z"></path>
                   	 <path fill-opacity=".36" d="M0 40h48v8H0z">
                   	 </path></svg>
                   	 글쓰기</a>
            		</div>
				</div>
				
				<!-- 오른쪽 매물 하단 페이지 버튼 -->
				<div class="page-bottom">
<!-- 					<div class="page-bottom-icon-click">
						<a href="user_search.jsp">1</a>
					</div>
					<div class="page-bottom-icon">
						<a href="#void">2</a>
					</div>
					<div class="page-bottom-icon">
						<a href="#void">3</a>
					</div>
					<div class="page-bottom-icon">
						<a href="#void">4</a>
					</div>
						<div class="page-bottom-next">&gt;</div> -->
					<table>
					<tr>
					<td>
					<%
					int pageStart=(nowBlock-1)*pagePerBlock+1;
					int pageEnd=((pageStart+pagePerBlock)<=totalPage) ? (pageStart+pagePerBlock): totalPage+1;
					
					if(totalPage !=0) {
						if(nowBlock >1) { %>
						
					<a href="javascript:block('<%=nowBlock-1%>')"> prev ... </a> <%  } %> &nbsp;
					
					<%for(;pageStart<pageEnd;pageStart++) {%>
					<a href="javascript:pageing('<%=pageStart%>)">
					<%if(pageStart==nowPage) {%> <font color="blue"> <%} %>
					[<%=pageStart %>]
					<% if(pageStart==nowPage) { %> </font> <% } %> </a>
					<% } %> &nbsp;
					
					<%if (totalBlock > nowBlock) {%>
					<a href="javascript:block('<%=nowBlock+1%>')"> ... next </a> <%  } %> &nbsp;
					<% } %>
					</td>
					</tr>
					</table>	
				</div>
				
			</div>
			
		</div>
		
	</div>
	</div>
</div>
<!-- container end -->

<form id="searchFrm">
	<input type="hidden" name="keyword" id="keyword" value="${param.keyword }">
	<input type="hidden" name="guFlag" id="guFlag" value="${param.guFlag}">
	<input type="hidden" name="categoryFlag" id="categoryFlag" value="${param.categoryFlag}">
	<input type="hidden" name="orderByFlag" id="orderByFlag" value="${param.orderByFlag }">
	<input type="hidden" name="priceFlag" id="priceFlag" value="${param.priceFlag }">
	<input type="hidden" name="minPrice" id="minPrice" value="${param.minPrice }">
	<input type="hidden" name="maxPrice" id="maxPrice" value="${param.maxPrice }">
	<input type="hidden" name="totalRecord" id="totalRecord" value="<%=totalRecord%>">
	<input type="hidden" name="nowPage" id="nowPage" value="<%=nowPage%>">
	
</form>

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>

</body>
</html>