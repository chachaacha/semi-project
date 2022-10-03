<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$(".p-title-link").click(function() {
		window.open("manager_pm_product_popup.jsp","product_popup",
				"width=780,height=930,top=0,left=560");
	})
})
</script>
</head>
<body>
<div class="product_management">
			
			<!-- 위 -->
				<div class="pm_top">
					<button type="button" class="all-delete-btn">신고순↑↓</button>
					<div class="search-wrap">
						<input type="text" class="search-txt" placeholder="제목을 입력하세요.">
						<button type="button" class="search-bar">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
						</button>
					</div>
				</div>
			<!-- 아래 -->
				<div class="pm-bottom">
					<div class="table-wrap">
						 <table class="table">
						    <caption>표 제목</caption>
						    <tr><th class="table-title">내용</th><th>작성자</th><th>게시글</th><th>등록일</th><th>신고수</th></tr>
						    <tr><td class="table-title">라멘맛집 알려주세요</td><td>user1234</td><td class="p-title-link">라멘 지식을 전수합니다</td><td>2022-09-22</td><td>1</td></tr>
						    <tr><td class="table-title">2.. 아니 .. 1조화이팅~</td><td>jojang</td><td>게시글 제목</td><td>2022-09-22</td><td>2</td></tr>
						    <tr><td class="table-title">공짜로 주세요</td><td>villain</td><td>게시글 제목</td><td>2022-09-22</td><td>1</td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						    <tr><td class="table-title"></td><td></td><td></td><td></td><td></td></tr>
						  </table>  
					</div>
				</div>
</div>
</body>
</html>