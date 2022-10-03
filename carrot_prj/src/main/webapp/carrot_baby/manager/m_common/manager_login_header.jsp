<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../../m_common/m_css/manager_login_header.css"/>

<script type="text/javascript">
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
	})
</script>


<div class="header">

	<div class="wrap-banner">
		<div class="banner">
			<a href="../../../mainhome/jsp/user_mainhome.jsp"><img src="../../../images/logo.png" width="136" height="40"></a>
		</div>
		<div class="wrap-login">
			<a href="../../login/jsp/manager_login.jsp"><!-- 로그아웃창 링크 연결 필요 -->
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true"><g><path d="M 30,30L 30,14 c0-1.104-0.896-2-2-2L 7.99,12 L 8,11.152C 8,5.764, 11.328,2, 16.096,2c 3.49,0, 6.6,2.006, 8.118,5.236 c 0.234,0.5, 0.828,0.714, 1.33,0.478c 0.5-0.234, 0.714-0.83, 0.478-1.33C 24.172,2.448, 20.37,0, 16.096,0C 10.246,0, 6,4.69, 6,11.14 L 5.99,12L 4,12 C 2.896,12, 2,12.896, 2,14l0,16 c0,1.104, 0.896,2, 2,2l 24,0 C 29.104,32, 30,31.104, 30,30z M 4,14l 24,0 l0,16 L 4,30 L 4,14 zM 16,18c-2.21,0-4,1.79-4,4s 1.79,4, 4,4s 4-1.79, 4-4S 18.21,18, 16,18z M 16,24c-1.102,0-2-0.898-2-2s 0.898-2, 2-2 s 2,0.898, 2,2S 17.102,24, 16,24z"></path></g></svg>
			로그아웃</a>
		</div>
	</div>
	<div class="wrap-navi">
		<div class="navi">
			<ul class="navibar">
				<li class="navi-item">
					<a class="navi-link" href="../../home/jsp/manager_mainhome.jsp">홈</a>
				</li>
				<li class="navi-item">
					<a class="navi-link" href="../../category/jsp/manager_local_management.jsp">카테고리 관리</a>
					<ul class="sub-navibar">
						<li class="subnavi-item">
							<a class="subnavi-link" href="../../category/jsp/manager_local_management.jsp">지역관리</a>
						</li>
						<li class="subnavi-item">
							<a class="subnavi-link" href="../../category/jsp/manager_product_management.jsp">상품 카테고리 관리</a>
						</li>
					</ul>
				</li>
				<li class="navi-item">
					<a class="navi-link" href="../../p_management/jsp/manager_product_category.jsp">상품관리</a>
				</li>
				<li class="navi-item">
					<a class="navi-link" href="../../m_management/jsp/manager_member_management.jsp">회원관리</a>
				</li>
				<li class="navi-item">
					<a class="navi-link" href="../../pass_change/jsp/manager_password_edit.jsp">비밀번호변경</a>
				</li>
			</ul>
		</div>
	</div>
	
</div>
