<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../../mainhome/css/user_login_header.css"/>
<script>
$(function() {
 /* 스크롤시 헤더 그림자 */
 var header = $('.header');

 $(window).scroll(function(e){
     if(header.offset().top !== 0){
         if(!header.hasClass('shadow')){
             header.addClass('shadow');
         }
     }else{
         header.removeClass('shadow');
     }
 });
 
 	$("#searchIconBtn").click(function() {
		$("#searchInputBar").submit();
 	})

 
})
</script>
	<form action="../../search/jsp/user_search.jsp" method="get" id="searchInputBar">
<div class="header">

	<div class="wrap-banner">
		<div class="banner">
			<a href="../../mainhome/jsp/user_mainhome.jsp"><img src="../../images/logo.png" width="136" height="40"></a>
			<a class="sale-logo" href="../../search/jsp/user_search.jsp">중고거래</a> <!-- 매물창 링크필요 -->
		<div class="searchWrap">
			<input type="text" placeholder="어떤 상품을 찾으시나요?" class="searchBar" name="keyword" autocomplete="off" value="${param.keyword}">
			<button type="button" class="searchIcon" id="searchIconBtn">
				<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-1o7j8sd">
				<path stroke="currentColor" d="M11 19C15.4183 19 19 15.4183 19 11C19 6.58172 15.4183 3 11 3C6.58172 3 3 6.58172 3 11C3 15.4183 6.58172 19 11 19Z" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				<path stroke="currentColor" d="M21 21L17 17" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>
			</button>
		</div>
		<div class="wrap-login">
			<a href="../../login/jsp/user_login.jsp">
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true"><g><path d="M 16,0C 10.478,0, 6,4.546, 6,10.154L 6,12 L 4,12 C 2.896,12, 2,12.896, 2,14l0,16 c0,1.104, 0.896,2, 2,2l 24,0 c 1.104,0, 2-0.896, 2-2L 30,14 c0-1.104-0.896-2-2-2l-2,0 L 26,10.154 C 26,4.546, 21.522,0, 16,0z M 8,10.154C 8,5.658, 11.588,2, 16,2s 8,3.658, 8,8.154L 24,12 L 8,12 L 8,10.154 z M 28,30L 4,30 L 4,14 l 24,0 L 28,30 z M 20,22c0-2.21-1.79-4-4-4s-4,1.79-4,4s 1.79,4, 4,4S 20,24.21, 20,22z M 16,24c-1.102,0-2-0.898-2-2 s 0.898-2, 2-2s 2,0.898, 2,2S 17.102,24, 16,24z"></path></g></svg>
			로그인/회원가입</a>
			
			<a href="../../mainhome/jsp/user_mainhome.jsp">
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true"><g><path d="M 30,30L 30,14 c0-1.104-0.896-2-2-2L 7.99,12 L 8,11.152C 8,5.764, 11.328,2, 16.096,2c 3.49,0, 6.6,2.006, 8.118,5.236 c 0.234,0.5, 0.828,0.714, 1.33,0.478c 0.5-0.234, 0.714-0.83, 0.478-1.33C 24.172,2.448, 20.37,0, 16.096,0C 10.246,0, 6,4.69, 6,11.14 L 5.99,12L 4,12 C 2.896,12, 2,12.896, 2,14l0,16 c0,1.104, 0.896,2, 2,2l 24,0 C 29.104,32, 30,31.104, 30,30z M 4,14l 24,0 l0,16 L 4,30 L 4,14 zM 16,18c-2.21,0-4,1.79-4,4s 1.79,4, 4,4s 4-1.79, 4-4S 18.21,18, 16,18z M 16,24c-1.102,0-2-0.898-2-2s 0.898-2, 2-2 s 2,0.898, 2,2S 17.102,24, 16,24z"></path></g></svg>
			로그아웃</a>
			<a href="../../mypages/jsp/user_mypage_in.jsp">
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 32 33.762001037597656" fill="rgb(230, 126, 34)" data-svg-content="true"><g><path d="M 22,6c0-3.212-2.788-6-6-6S 10,2.788, 10,6c0,3.212, 2.788,6, 6,6S 22,9.212, 22,6zM 16,14c-5.256,0-10,5.67-10,12.716s 20,7.046, 20,0S 21.256,14, 16,14z"></path></g></svg>
			마이페이지</a>
			
			<a href="../../cs/jsp/cs_center_main.jsp"><!-- 고객센터 링크 연결 필요 -->
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="20px" height="20px" viewBox="0 0 32 32" enable-background="new 0 0 32 32" xml:space="preserve" data-svg-content="true" fill="rgb(230, 126, 34)">
			<g>
				<path fill="rgb(230, 126, 34)" d="M16-0.034C7.159-0.034-0.035,7.158-0.035,16S7.159,32.034,16,32.034S32.035,24.842,32.035,16   S24.841-0.034,16-0.034z M16,30.966C7.748,30.966,1.035,24.252,1.035,16S7.748,1.034,16,1.034S30.965,7.748,30.965,16   S24.252,30.966,16,30.966z"></path>
				<path fill="rgb(230, 126, 34)" d="M10.5,16.5c1.103,0,2-0.897,2-2s-0.897-2-2-2s-2,0.897-2,2S9.397,16.5,10.5,16.5z M10.5,13.5   c0.551,0,1,0.448,1,1s-0.449,1-1,1s-1-0.448-1-1S9.949,13.5,10.5,13.5z"></path>
				<path fill="rgb(230, 126, 34)" d="M21.5,16.5c1.103,0,2-0.897,2-2s-0.897-2-2-2s-2,0.897-2,2S20.397,16.5,21.5,16.5z M21.5,13.5   c0.551,0,1,0.448,1,1s-0.449,1-1,1s-1-0.448-1-1S20.949,13.5,21.5,13.5z"></path>
				<path fill="rgb(230, 126, 34)" d="M22.823,22.075c-1.696,1.837-4.097,2.891-6.588,2.891c-2.53,0-4.956-1.081-6.656-2.967   c-0.198-0.218-0.537-0.237-0.755-0.038c-0.219,0.197-0.237,0.535-0.039,0.755c1.903,2.109,4.618,3.318,7.45,3.318   c2.788,0,5.476-1.179,7.373-3.234c0.2-0.217,0.187-0.555-0.03-0.755S23.023,21.857,22.823,22.075z"></path>
			</g>
			</svg>
			고객센터</a>
		</div>
		</div>
	</div>
	
</div>
	</form>