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
		$("#selectFrm").submit();
	});
	 
	//검색버튼 눌렀을 시
	$("#searchBtn").click(function(){
		var word = $("#idSearch").val();
		if(word.trim().length<2) {
			alert("2자 이상 입력하세요!");
			return;
		}
		$("#searchFrm").submit();
	});
});
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
			<form id="selectFrm"> 
				<select id="memberCat" name="category" class="category-select">
							<option value="all"${ 'all' eq param.category?" selected='selected'":""  }>회원 리스트</option>
							<option value="block"${ 'block' eq param.category?" selected='selected'":""  }>차단 회원 리스트</option>
				</select>
				</form> 
				<div class="search-wrap">
						<form id="searchFrm">
						<input hidden="hidden"><input type="text" id="idSearch" name="idSearch" value="${ param.idSearch }" class="search-txt" placeholder="아이디를 입력하세요.">
						<button type="button" class="search-bar" id="searchBtn">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
						</button>
						</form>
				</div>
			</div>
			
			<form>
				
			</form>
			
			<div class="table-wrap table1">
						 <table class="table">
						 <caption>표 제목</caption>						 
						 <% MemberDAO mDAO = MemberDAO.getInstance();%>
						  <% 	
						 List<MemberVO> memList = mDAO.selectMember(request.getParameter("idSearch"));
						 pageContext.setAttribute("memList", memList);
						 %>
						 <c:choose>
						 <c:when test="${ param.category eq 'all' }">
						 <tr><th>아이디명</th><th >회원명</th><th>가입날짜</th><th>생년월일</th><th>차단</th></tr>
						 <c:forEach var="memList" items="${ pageScope.memList }">
						  	<tr><td><c:out value="${ memList.id }"/></td><td><c:out value="${ memList.name }"/></td><td><c:out value="${ memList.joined_date }"/></td><td><c:out value="${ memList.birth }"/></td><td><button type="button" class="block-btn">차단</button></td></tr>
						 </c:forEach>
						 </c:when>
						 <c:when test="${ param.category eq 'block' }">
						 <% 
						 List<ManagerBlockVO> bloList = mDAO.selectBlockedMember(request.getParameter("idSearch"));
						 pageContext.setAttribute("bloList", bloList);
						 %>	
						 <tr><th>아이디명</th><th >회원명</th><th>차단 사유</th><th>차단 해제</th></tr>
						 <c:forEach var="bloList" items="${ pageScope.bloList }">
						    <tr><td><c:out value="${ bloList.id }"/></td><td><c:out value="${ bloList.name }"/></td><td><c:out value="${ bloList.blocked_reason }"/></td><td><button type="button" class="block-btn">해제</button></td></tr>
						 </c:forEach>
						 </c:when>
						 <c:otherwise>
						 <%	
						 memList = mDAO.selectMember(request.getParameter("idSearch"));
						 pageContext.setAttribute("memList", memList);
						 %>
						 <tr><th>아이디명</th><th >회원명</th><th>가입날짜</th><th>생년월일</th><th>차단</th></tr>
						 <c:forEach var="memList" items="${ pageScope.memList }">
						  	<tr><td><c:out value="${ memList.id }"/></td><td><c:out value="${ memList.name }"/></td><td><c:out value="${ memList.joined_date }"/></td><td><c:out value="${ memList.birth }"/></td><td><button type="button" class="block-btn">차단</button></td></tr>
						 </c:forEach>
						 </c:otherwise>
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