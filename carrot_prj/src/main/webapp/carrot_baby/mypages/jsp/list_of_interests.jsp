<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심목록</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" href="../css/list_of_interestes.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<!-- 1 -->
<div class="container">
<%@ include file="myinfo_navi.jsp" %>

<div class="list_of_interests_wrap">
	<div class="list_of_interests">관심목록</div>
	<div class="list_of_interests_item">
		<div class="list_of_interests_item_img">
			<img alt="이미지 자리" src="#void">
				<div class="list_of_interests_item_border">
					<div class="loi_title">오가닉 수유쿠션 팝니다~! <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="heart_btn" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>
							<div class="dong_date">연남동</div><!-- dong_date -->
								<div class="price_ch">
									<div class="price">35,000원</div>
									 	<div class="cmt_n_heart">
											<div class="heart">하트
												<div clss="heart_cnt">2</div><!-- 하트 카운트 -->
													</div><!-- 하트 -->
											<div class="cmt">댓글
													<div>7</div><!-- 댓글 카운트 -->
												</div><!-- 댓글 -->
										</div><!-- cmt_n_heart -->
									</div><!-- price_ch -->
	</div><!-- loi_title -->
	</div><!-- loi_border-->
	</div><!-- loi_img -->
	</div><!-- loi 전체를 담는 div -->
<!-- 2 -->
	<div class="list_of_interests_item">
		<div class="list_of_interests_item_img">
			<img alt="이미지 자리" src="#void">
				<div class="list_of_interests_item_border">
					<div class="loi_title">판매글 제목 <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="heart_btn" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>
						<div class="dong_date">서울 어디어디
							<div class="price_ch">
									<div class="price">55,000원</div>
									 	<div class="cmt_n_heart">
											<div class="heart">하트
												<div clss="heart_cnt">1</div><!-- 하트 카운트 -->
													</div><!-- 하트 -->
											<div class="cmt">댓글
													<div>5</div><!-- 댓글 카운트 -->
												</div><!-- 댓글 -->
										</div><!-- cmt_n_heart -->
									</div><!-- price_ch -->
											
	</div><!-- dong_date -->
	</div><!-- loi_title -->
	</div><!-- loi_border-->
	</div><!-- loi_img -->
	</div><!-- loi 전체를 담는 div -->	
<!-- 3 -->
	<div class="list_of_interests_item">
		<div class="list_of_interests_item_img">
			<img alt="이미지 자리" src="#void">
			<div class="list_of_interests_item_border">
				<div class="loi_title">판매글 제목 <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="heart_btn" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>
					<div class="dong_date">서울 어디어디
						<div class="price_ch">
									<div class="price">18,000원</div>
									 	<div class="cmt_n_heart">
											<div class="heart">하트
												<div clss="heart_cnt">6</div><!-- 하트 카운트 -->
													</div><!-- 하트 -->
											<div class="cmt">댓글
													<div>9</div><!-- 댓글 카운트 -->
												</div><!-- 댓글 -->
										</div><!-- cmt_n_heart -->
									</div><!-- price_ch -->
							
	 </div><!-- dong_date -->								
	</div><!-- loi_title -->
	</div><!-- loi_border-->
	</div><!-- loi_img -->
	</div><!-- loi 전체를 담는 div -->
</div>
</div>
<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div> <!-- 컨테이너 div -->

</body>
</html>