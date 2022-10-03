<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타사용자 프로필</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> 
<link rel="stylesheet" href="../css/other_user_profile.css"> 


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

</script>
<!-- tab 시작 -->

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  });
  $(function() {
 	 $(".confirm").click(function(){
 		window.open("report_profile_popup.jsp","report_profile_popup",
		"width=520,height=620,top=234,left=979,scrolling=no")
})	
});
  $(function() {
		$(".block").click(function() {
			confirm("사용자를 정말 차단하시겠어요?")
		})
	});
  </script>
  <!-- tab끝 -->
</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<!-- 1 -->
<div class="container">
	<div class="other_user_profile_title">프로필</div>
	<div class="oup_wrap">
		<div class="profile">
				<div class="profile_img_wrap">
					<img alt="프로필이미지" src="../../images/profile.png" class="profile-img">
				</div><!-- profile_img -->
				<div class="nick_name">라멘조아(rame***)
					<div class="btns">
						<button class="confirm" type="button">신고하기</button>
						<button class="block" type="button">차단하기</button>
					</div><!-- btns -->
				</div><!-- 별명 -->
				<div class="region">서울 어디어디</div>
				<div class="report_cnt">누적 신고 횟수 : 1회</div>
			
			</div><!-- profile -->
			
			<!-- <div class="buttons">
			<input type="button" value="전체" class="btn" style="width: 100px; height: 30px;"/>
			<input type="button" value="전체상품보기" class="btn" style="width: 130px; height: 30px;"/>
			<input type="button" value="거래완료" class="btn" style="width: 100px; height: 30px;"/>
			</div> --> <!-- 상태 나타내는 버튼 3가지의 위치 -->
			
			<div id="tabs">
		  <ul>
		    <li><a href="#tabs-1">전체</a></li>
		    <li><a href="#tabs-2">판매상품보기</a></li>
		    <li><a href="#tabs-3">거래완료</a></li>
		  </ul>
		  
		  <div id="tabs-1">
<!-- 1 -->
		    			<div class="ou_item">
							<div class="ou_img">
								<img alt="이미지 자리" src="#void">
								<div class="ou_border">
									<div class="ou_itm_title">국민문짝
										<div class="dong_date">역삼동 ㆍ 5일전 </div><!-- dong_date -->
											<div class="price">20,000원</div>
	
	</div><!-- ou_itm_title-->
		</div><!-- ou_border-->
			</div><!-- ou_img-->
				</div><!-- ou_item -->
<!-- 2 -->
	<div class="ou_item">
		<div class="ou_img">
			<img alt="이미지 자리" src="#void">
			<div class="ou_border">
				<div class="ou_itm_title">아기체육관
					<div class="dong_date">서울 어디어디 ㆍ n일전 </div><!-- dong_date -->	
						<div class="db_align"><input type="button" value="거래완료" class="deal_btn" style="width: 100px; height: 30px;"/>가격위치
	</div><!-- db_align -->
		</div><!-- ou_itm_title -->
			</div><!-- ou_border-->			
				</div><!-- ou_img -->
					</div><!-- ou_item-->
<!-- 3 -->	
	<div class="ou_item">
		<div class="ou_img">
			<img alt="이미지 자리" src="#void">
			<div class="ou_border">
				<div class="ou_itm_title">판매글 제목
					<div class="dong_date">서울 어디어디 ㆍ n일전 </div><!-- dong_date -->	
						<div class="db_align"><input type="button" value="거래완료" class="deal_btn" style="width: 100px; height: 30px;"/>가격위치
	</div><!-- db_align -->
		</div><!-- ou_itm_title -->
			</div><!-- ou_borderr-->	
				</div><!-- ou_img -->
					</div><!-- ou_item -->
<!-- 4 -->	
	<div class="ou_item">
		<div class="ou_img">
			<img alt="이미지 자리" src="#void">
			<div class="ou_border">
				<div class="ou_itm_title">판매글 제목
					<div class="dong_date">서울 어디어디 ㆍ n일전 </div><!-- dong_date -->	
						<div class="db_align"><input type="button" value="거래완료" class="deal_btn" style="width: 100px; height: 30px;"/>가격위치
	</div><!-- db_align -->
		</div><!-- ou_itm_title -->
			</div><!-- ou_border-->	
				</div><!-- ou_img -->
					</div><!--ou_item -->
		  </div><!-- tabs-1 -->
		  
		  <div id="tabs-2">
		    	<div class="ou_item">
					<div class="ou_img">
						<img alt="이미지 자리" src="#void">
						<div class="ou_border">
								<div class="ou_itm_title">국민문짝
									 <div class="dong_date">역삼동 ㆍ 5일전 </div><!-- dong_date -->
											<div class="price">20,000원</div>
	
	</div><!-- ou_itm_title-->
		</div><!-- ou_border-->
			</div><!-- ou_img-->
				</div><!-- ou_item -->
		  </div><!-- tabs-2 -->
		  
		  <div id="tabs-3">
		    <!-- 2 -->
	<div class="ou_item">
		<div class="ou_img">
			<img alt="이미지 자리" src="#void">
			<div class="ou_border">
				<div class="ou_itm_title">아기체육관
					<div class="dong_date">서울 어디어디 ㆍ n일전 </div><!-- dong_date -->	
						<div class="db_align"><input type="button" value="거래완료" class="deal_btn" style="width: 100px; height: 30px;"/>가격위치
	</div><!-- db_align -->
		</div><!-- ou_itm_title -->
			</div><!-- ou_border-->			
				</div><!-- ou_img -->
					</div><!-- ou_item-->
<!-- 3 -->	
	<div class="ou_item">
		<div class="ou_img">
			<img alt="이미지 자리" src="#void">
			<div class="ou_border">
				<div class="ou_itm_title">판매글 제목
					<div class="dong_date">서울 어디어디 ㆍ n일전 </div><!-- dong_date -->	
						<div class="db_align"><input type="button" value="거래완료" class="deal_btn" style="width: 100px; height: 30px;"/>가격위치
	</div><!-- db_align -->
		</div><!-- ou_itm_title -->
			</div><!-- ou_borderr-->	
				</div><!-- ou_img -->
					</div><!-- ou_item -->
<!-- 4 -->	
	<div class="ou_item">
		<div class="ou_img">
			<img alt="이미지 자리" src="#void">
			<div class="ou_border">
				<div class="ou_itm_title">판매글 제목
					<div class="dong_date">서울 어디어디 ㆍ n일전 </div><!-- dong_date -->	
						<div class="db_align"><input type="button" value="거래완료" class="deal_btn" style="width: 100px; height: 30px;"/>가격위치
	</div><!-- db_align -->
		</div><!-- ou_itm_title -->
			</div><!-- ou_border-->	
				</div><!-- ou_img -->
					</div><!--ou_item -->
		  </div><!-- tabs-3 -->
	</div><!-- tabs -->
			
			<!--<div class="ou_item_wrap">  -->

	
<!-- </div> <!-- ou item wrap --> 
</div><!-- profile -->
</div><!-- oup_wrap//전체 감싸는 틀~ -->



<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div> <!-- 컨테이너 div -->


</body>
</html>