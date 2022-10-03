<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../../m_common/m_css/manager_header.css"/>

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
	</div>
	<div class="wrap-navi">
		<div class="navi">
			<ul class="navibar">
				<li class="navi-item">
					<a class="navi-link" href="#void">홈</a>
				</li>
				<li class="navi-item">
					<a class="navi-link" href="#void">카테고리 관리</a>
					<ul class="sub-navibar">
						<li class="subnavi-item">
							<a class="subnavi-link" href="#void">지역관리</a>
						</li>
						<li class="subnavi-item">
							<a class="subnavi-link" href="#void">상품 카테고리 관리</a>
						</li>
					</ul>
				</li>
				<li class="navi-item">
					<a class="navi-link" href="#void">상품관리</a>
				</li>
				<li class="navi-item">
					<a class="navi-link" href="#void">회원관리</a>
				</li>
				<li class="navi-item">
					<a class="navi-link" href="#void">비밀번호변경</a>
				</li>
			</ul>
		</div>
	</div>
	
</div>