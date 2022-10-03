<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	//셀렉트 선택시 테이블 구성 바뀜
	$(".category-select").change(function() {
		var category=$(".category-select").val();
		
		if(category=="차단 회원 리스트") {
			$(".table2").show();
			$(".table1").hide();
		}else {
			$(".table1").show();
			$(".table2").hide();
		}
	})
	
	
})
</script>
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
				<select name="category" class="category-select">
							<option value="회원 리스트">회원 리스트</option>
							<option value="차단 회원 리스트">차단 회원 리스트</option>
				</select>
				<div class="search-wrap">
						<input type="text" class="search-txt" placeholder="아이디를 입력하세요.">
						<button type="button" class="search-bar">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
						</button>
				</div>
			</div>
			
			<div class="table-wrap table1">
						 <table class="table">
						    <caption>표 제목</caption>
						    <tr><th>아이디명</th><th >회원명</th><th>가입날짜</th><th>생년월일</th><th>차단</th></tr>
						    <tr><td>sist</td><td>쌍x용</td><td>2022-09-22</td><td>2010-01-01</td><td><button type="button" class="block-btn">차단</button></td></tr>
						    <tr><td></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td><td></td></tr>
						  </table>  
			</div>
			
			<div class="table-wrap table2">
						 <table class="table">
						    <caption>표 제목</caption>
						    <tr><th>아이디명</th><th >회원명</th><th>차단 사유</th><th>차단 해제</th></tr>
						    <tr><td>xxx</td><td>최xx</td><td>비매너 거래행위</td><td><button type="button" class="block-btn">해제</button></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
						    <tr><td></td><td></td><td></td><td></td></tr>
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