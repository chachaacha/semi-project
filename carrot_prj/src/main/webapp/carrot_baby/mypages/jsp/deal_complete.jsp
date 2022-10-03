<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래완료</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/deal_complete.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
//...버튼 누르면 글 삭제할건지 물어보는 팝업창 열기
$(function() {
	$(".edit_del_btn").click(function() {
		confirm("게시글을 정말 삭제하시겠어요?")
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
<!-- 1 -->
<div class="container">
<%@ include file="myinfo_navi.jsp" %>

<div class="deal_complete_title_wrap">
	<div class="deal_complete_title">거래완료</div>
	<div class="deal_complete_item">
		<div class="deal_complete_item_img">
			<img alt="이미지 자리" src="#void">
				<div class="deal_complete_item_border">
					<div class="dci_title">타니핑 하우스
						<button class="edit_del_btn" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  						<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  						<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
					</button>
					<div class="dong_date">역삼동 ㆍ 3일전 </div><!-- dond_date -->
						<div class="btn_price">
						<button class="complete_btn" type="button">거래완료</button>
						<div class="price">50,000원</div>
						</div><!-- "btn_price" -->
	</div><!-- olcl_content -->
	</div><!-- on_sale_item_border-->
	</div><!-- on-sale_item_img -->
	</div><!-- on_sale_item전체를 담는 div -->
	
<!-- 2 -->
	<div class="deal_complete_item">
		<div class="deal_complete_item_img">
			<img alt="이미지 자리" src="#void">
				<div class="deal_complete_item_border">
				<div class="dci_title">국민문짝
					<button class="edit_del_btn" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  						<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  						<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
					</button>
					<div class="dong_date">역삼동 ㆍ 5일전 </div><!-- dond_date -->
						<div class="btn_price">
						<button class="complete_btn" type="button">거래완료</button>
						<div class="price">62,000원</div>
						</div><!-- "btn_price" -->
	</div><!-- olcl_content -->
	</div><!-- on_sale_item_border-->			
	</div><!-- on-sale_item_img -->
	</div><!-- on_sale_item전체를 담는 div -->
<!-- 3 -->	
	<div class="deal_complete_item">
		<div class="deal_complete_item_img">
			<img alt="이미지 자리" src="#void">
				<div class="deal_complete_item_border">
				<div class="dci_title">아기체육관
					<button class="edit_del_btn" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  						<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  						<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
					</button>
					<div class="dong_date">역삼동 ㆍ 1달전 </div><!-- dond_date -->		
						<div class="btn_price">
						<button class="complete_btn" type="button">거래완료</button>
						<div class="price">80,000원</div>
						</div><!-- "btn_price" -->			
	</div><!-- olcl_content -->
	</div><!-- on_sale_item_border-->	
	</div><!-- on-sale_item_img -->
	</div><!-- on_sale_item전체를 담는 div -->
<!-- 4 -->	
	<div class="deal_complete_item">
		<div class="deal_complete_item_img">
			<img alt="이미지 자리" src="#void">
				<div class="deal_complete_item_border">
				<div class="dci_title">튤립 사운드북
					<button class="edit_del_btn" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  						<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  						<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
					</button>
					<div class="dong_date">역삼동 ㆍ 3달전 </div><!-- dond_date -->		
						<div class="btn_price">
						<button class="complete_btn" type="button">거래완료</button>
						<div class="price">23,000원</div>
						</div><!-- "btn_price" -->		
	</div><!-- olcl_content -->
	</div><!-- on_sale_item_border-->	
	</div><!-- on-sale_item_img -->
	</div><!-- on_sale_item전체를 담는 div -->


</div> <!-- 컨테이너 div -->
<!-- container end -->
</div>
<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div>
</body>
</html>