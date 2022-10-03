<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 댓글 관리</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/my_comment_management.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
//선택 삭제와 댓글 삭제 버튼을 눌렀을 때 나오는 confirm창
$(function() {
	$(".mcl_button").click(function() { //선택 삭제 버튼
		confirm("선택한 댓글을 정말 삭제하시겠어요?")
	})
	$(".cmt_delete").click(function() {//댓글 삭제 버튼
		confirm("선택한 댓글을 정말 삭제하시겠어요?")
	})
})
</script>

</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_logout_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">

<%@ include file="myinfo_navi.jsp" %>

<div class="mcm_title_wrap">
	<div class="mcm_title">내 댓글 관리</div><!-- mcm title -->
		<div class="my_comment_list">
			<div class="mcl_title">
				<div class="mcl_title_align"><!-- mcl_title_align 시작 -->
					<div><input type="checkbox" class="mcl_check">번호</div><!-- mcl_num -->	
					<div>내용</div><!-- mcl_content -->
					<div>
						<button class="mcl_button" type="button">선택삭제</button>
					</div><!-- mcl_btn -->	
				</div><!-- mcl_title_align 끝 -->
		    </div><!-- mcl_title -->			
				<!-- 댓글 내용들 -->
				<div> <!-- mcl_content_wrap -->
					<div class="mcl_content">
						 <div><!-- chk_wrap -->
						 	<input type="checkbox" class="mcl_check"/>1 
						 </div>
					  <div class="content_wrap"><!-- content_wrap 시작 -->
						<div class="post_style">[글] 국민체육관 팝니다.</div><!-- mcl_content의 제목 --><!-- 폰트크기 댓글이랑 날짜랑 차이나게 키워야함 -->
						<div class="cmt_style">그럼 돈은 어디다 입금하죠</div> <!-- mcl_comment의 댓글 --><!-- 폰트 색 : gray -->
						<div class="cmt_style">날짜</div><!-- mcl_content의 날짜 -->
					</div><!-- content_wrap 끝 -->
					
						<div><!-- button_wrap 시작-->
							<button class="cmt_delete" type="button">댓글삭제</button>
						</div><!-- button_wrap 끝-->
					</div><!-- mcl_content 1 -->
				<hr>
					<div class="mcl_content">
						 <div><!-- chk_wrap -->
						 	<input type="checkbox" class="mcl_check"/>2 
						 </div>
					  <div class="content_wrap"><!-- content_wrap 시작 -->
						<div class="post_style">[글] 국민체육관 팝니다.</div><!-- mcl_content의 제목 --><!-- 폰트크기 댓글이랑 날짜랑 차이나게 키워야함 -->
						<div class="cmt_style">판매자님 계좌번호 알려주세요</div> <!-- mcl_comment의 댓글 --><!-- 폰트 색 : gray -->
						<div class="cmt_style">날짜</div><!-- mcl_content의 날짜 -->
					</div><!-- content_wrap 끝 -->
					
						<div class="button_wrap"><!-- button_wrap 시작-->
							<button class="cmt_delete" type="button">댓글삭제</button>
						</div><!-- button_wrap 끝-->
					</div><!-- mcl_content 2 -->
				<hr>
					<div class="mcl_content">
						 <div><!-- chk_wrap -->
						 	<input type="checkbox" class="mcl_check"/>3
						 </div>
					  <div class="content_wrap"><!-- content_wrap 시작 -->
						<div class="post_style">[글] 국민체육관 팝니다.</div><!-- mcl_content의 제목 --><!-- 폰트크기 댓글이랑 날짜랑 차이나게 키워야함 -->
						<div class="cmt_style">판매자님 계좌번호 알려주세요</div> <!-- mcl_comment의 댓글 --><!-- 폰트 색 : gray -->
						<div class="cmt_style">날짜</div><!-- mcl_content의 날짜 -->
					</div><!-- content_wrap 끝 -->
					
						<div class="button_wrap" ><!-- button_wrap 시작-->
							<button class="cmt_delete" type="button">댓글삭제</button>
						</div><!-- button_wrap 끝-->
					</div><!-- mcl_content 3 -->
				<hr>
					<div class="mcl_content">
						 <div><!-- chk_wrap -->
						 	<input type="checkbox" class="mcl_check"/>4
						 </div>
					  <div class="content_wrap"><!-- content_wrap 시작 -->
						<div class="post_style">[글] 국민체육관 팝니다.</div><!-- mcl_content의 제목 --><!-- 폰트크기 댓글이랑 날짜랑 차이나게 키워야함 -->
						<div class="cmt_style">판매자님 계좌번호 알려주세요</div> <!-- mcl_comment의 댓글 --><!-- 폰트 색 : gray -->
						<div class="cmt_style">날짜</div><!-- mcl_content의 날짜 -->
					</div><!-- content_wrap 끝 -->
					
						<div class="button_wrap"><!-- button_wrap 시작-->
							<button class="cmt_delete" type="button">댓글삭제</button>
						</div><!-- button_wrap 끝-->
					</div><!-- mcl_content 4 -->
					
				
</div><!-- mcl_content_wrap-->
</div><!-- 댓글관리 리스트 전체-->
</div>
</div><!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>

</body>
</html>