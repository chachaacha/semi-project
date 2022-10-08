<%@page import="managerVO.ManagerBlockVO"%>
<%@page import="managerVO.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="managerDAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../../common/css/manager_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/manager_member_management.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	 
	//셀렉트 선택시 다른 테이블을 보여준다.
	$("#memberCat").change(function(){
		$("#selectStau").val($("#memberCat").val());
		$("#searchStau").val(null);//검색 값은 초기화 시켜준다.
		$("#hidFrm").submit();
	});
	 
	//검색버튼 눌렀을 시
	$("#searchBtn").click(function(){
		var word = $("#idSearch").val();
		if(word.trim().length<2) {
			alert("2자 이상 입력하세요!");
			return;
		}
		$("#searchStau").val(word.trim());
		$("#hidFrm").submit();
	});
	
	
});

//신고 누를 시 팝업창열기
//a 태그에 자바스크립트 영역을 열고 함수를 넣고 그 함수의 매개변수에 EL의 값을 받아온다. 
function openPopup(id) {
	window.open("manger_member_block_popup.jsp?id="+id,"manger_member_block_popup","width=520,height=620,top=203,left=1336");
}


</script>
<%-- 세션처리 --%>
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

	<div class="member_management-wrap">
	
		<!-- 상품관리 아이콘 -->
		<div class="member_management-icon">
			<svg class="person-lines-fill" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" viewBox="0 0 16 16">
			  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
			</svg>
			<span>회원관리</span>
		</div>
		
		<!-- 본문 -->
		<div class="member_management">
			<!-- 위 -->
			<div class="mm-top">
				<select id="memberCat" name="category" class="category-select">
							<option value="all"${ 'all' eq param.selectStau?" selected='selected'":""  }>회원 리스트</option>
							<option value="block"${ 'block' eq param.selectStau?" selected='selected'":""  }>차단 회원 리스트</option>
				</select>
				<div class="search-wrap">
						<input hidden="hidden"><input type="text" id="idSearch" name="idSearch" value="${ param.searchStau }" class="search-txt" placeholder="아이디를 입력하세요." autocomplete="off" >
						<button type="button" class="search-bar" id="searchBtn">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
						</button>
				</div>
			</div>
			<!-- form을 묶기위한 hidden -->
			<form id ="hidFrm">
				<input type="hidden" id="selectStau"name="selectStau" value="${ empty param.selectStau?'all':param.selectStau }"/>
				<input type="hidden" id="searchStau"name="searchStau" value="${ param.searchStau }"/>
			</form>
			
			<div class="table-wrap table1">
						 <table class="table">
						 <caption>표 제목</caption>						 
						 <% MemberDAO mDAO = MemberDAO.getInstance();%>
						  <% 	
						 List<MemberVO> memList = mDAO.selectMember(request.getParameter("searchStau"));
						 pageContext.setAttribute("memList", memList);
						 %>
						 <c:choose>
						 <c:when test="${ param.selectStau  eq 'all' or empty param.selectStau and empty param.searchStau }"><%-- 전체가 선택되었거나 초기진입이어서 웹파라메터가 없을 경우 보여줄 테이블 --%>
						 <tr><th>아이디명</th><th >회원명</th><th>가입날짜</th><th>생년월일</th><th>차단</th></tr>
						 <c:if test="${ empty pageScope.memList }">
						 <tr><td colspan="5">조회된결과가 없습니다.</td></tr>
						 </c:if> 	
						 <c:forEach var="memList" items="${ pageScope.memList }">
						    <%-- 신고하기를 눌렀을 때 이 부분을 form으로 처리하면 id가 중복되기 때문에 a 태그를 통해 javascript영역을 열고 EL을 넣어서 매개값으로 전달한다. --%>
						  	<tr><td><c:out value="${ memList.id }"/></td><td><c:out value="${ memList.name }"/></td><td><c:out value="${ memList.joined_date }"/></td><td><c:out value="${ memList.birth }"/></td><td><a href="javascript:openPopup('${ memList.id }')"><button type="button" class="block-btn">차단</button></a></td></tr>
						 </c:forEach>
						 </c:when>
						 <c:when test="${ param.selectStau  eq 'block' }">
						 <% 
						 List<ManagerBlockVO> bloList = mDAO.selectBlockedMember(request.getParameter("searchStau").trim());
						 pageContext.setAttribute("bloList", bloList);
						 %>	
						 <tr><th>아이디명</th><th >회원명</th><th>차단 사유</th><th>차단 해제</th></tr>
						 <c:if test="${ empty pageScope.bloList }">
						 <tr><td colspan="4">조회된결과가 없습니다.</td></tr>
						 </c:if> 
						 <c:forEach var="bloList" items="${ pageScope.bloList }">
						    <tr><td><c:out value="${ bloList.id }"/></td><td><c:out value="${ bloList.name }"/></td><td><c:out value="${ bloList.blocked_reason }"/></td><td><button type="button" class="block-btn">해제</button></td></tr>
						 </c:forEach>
						 </c:when>
						 </c:choose>	
						 </table>  
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