<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cs 운영정책</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> 
<link rel="stylesheet" type="text/css" href="../css/cs_center_main.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() { 
	//질문 클릭시 답변 보이는 기능
	$(".question-1").click(function() {
	$(".answer-1").toggle();
	}); //click
	
	//질문 클릭시 답변 보이는 기능
	$(".question-2").click(function() {
	$(".answer-2").toggle();
	}); //click
});//ready
</script>
<!-- tab 시작 -->

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
  <!-- tab끝 -->

</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">
	<div class="csTitle">고객센터</div>
	<div id="tabs">
		 <ul>
		    <li><a href="#tabs-1">운영정책</a></li>
		    <li><a href="#tabs-2">구매/판매</a></li>
		    <li><a href="#tabs-3">거래 품목</a></li>
		    <li><a href="#tabs-4">거래 매너</a></li>
		    <li><a href="#tabs-5">이용 제재</a></li>
		    <li><a href="#tabs-6">기타</a></li>
		  </ul>
		 
		
<hr>
 <div id="tabs-1">
<div class="question-1">
Q. 중고거래 운영정책
</div>
 <div class="answer-1">
A. 애기당근은 육아용품을 중고거래할 수 있는 웹사이트입니다. <br>
　애기당근은 "육아용품" 전문 중고거래 웹사이트로 육아용품을 제외한 다른 물품은 거래가 불가합니다.
</div>

<div class="question-2">
Q. 거래 분쟁이 발생한 경우 어떻게 해야 할까요?
</div>
 <div class="answer-2">
A. 애기당근의 모든 거래는 기본적으로 거래 당사자들끼리 대화를 통해 문제를 해결하도록 안내드리고 있습니다. <Br>
　대화를 통해 문제가 해결되지 않는 경우 [신고하기]기능을 통해 상대방을 신고해주세요.
</div>
 </div><!-- tabs-1 -->

 <div id="tabs-2">
<div class="question-1">
Q. 중고 거래 및 환불 정책
</div>
 <div class="answer-1">
 A. 애기당근의 모든 거래는 기본적으로 거래 당사자들끼리 자유롭게 진행할 수 있습니다.<br>
　가급적 애기당근은 거래에 개입하지 않습니다. <br>
　그래서 거래 중에 이견이 있어도 거래 당사자들끼리 직접 대화하여 해결하는 것을 권장합니다. <br><br>
　하지만 대화로 해결하기 어렵다면 애기당근은 아래와 같은 정책을 따르고 있습니다.
</div>

<div class="question-2">
Q. 육아용품 중고거래 매물을 검색하는 방법을 알고 싶습니다.
</div>
 <div class="answer-2">
A.　1. 홈 화면 상단 '돋보기' 모양 버튼을 클릭 해주세요. <br>
　　2. 검색창에 검색어를 입력하고 검색 해주세요.
</div>
</div><!-- tabs-2 -->


 <div id="tabs-3">
<!-- 거래품목 자리임 수정예정 -->
<div class="question-1">
Q. 판매 금지 물품
</div>
 <div class="answer-1">
A. * 가품, 이미테이션(상표권, 저작권 침해 물품, 특정 브랜드의 스타일을 모방한 물품)<Br>
　* 수제 음식물, 건강기능식품 : 직접 만들거나 가공한 음식, 건강기능식품(지자체 및 영업 신고를 한 사람만 판매할 수 있음)<br>
　* 한약, 의약품, 의료기기, 마약류(청소년 유해약물, 유해화학물질)<br>
　* 조건부 무료나눔<br>
　* 이외 법률을 위반하는 모든 물품
</div>

<div class="question-2">
Q. 형편없는 물건을 판매해요
</div>
 <div class="answer-2">
A. 애기당근은 판매 금지 물품 이외의 물건에 대해서는 직접적으로 제재하지 않습니다.<br>
　하지만 사용할 수 없을 정도의 물건은 판매하지 않는 것이 좋습니다. 물건의 상태가 좋지 않다면 구매자로부터 환불 요구를 받을 가능성이 커집니다.<br>
　물건의 상태가 심하게 좋지 않아서 판매할 가치가 없는 경우 [신고하기]를 통해 신고해주세요.
</div>
</div><!-- 3 -->

 <div id="tabs-4">
<!-- 거래매너 자리임 수정예정 -->
<div class="question-1">
Q. 애기당근에서 지켜야 할 매너
</div>
 <div class="answer-1">
A. 애기당근에서 따뜻한 경험을 함께 나눠요! <Br>
　여러분의 작은 친절이 애기당근을 이용하는 이웃들에게 큰 감동을 줄 수 있습니다. <br>
　여러분 근처의 이웃에게 따뜻한 배려를  베풀어 주세요. <br><br>

　<기본 매너> <Br>
　- 서로 존중해요. 존댓말로 대화합시다.<br>
　- 모두의 시간은 소중합니다. 시간 약속을 꼭 지켜주세요. <Br>
　- 절대로 중간에 연락 끊기는 일이 없도록 해요. (점수는 절대 안돼요!) <br>
　- 어떤 상황에서도 욕설, 비방, 명예훼손 등의 언행은 지양해주세요. <br>
　- 늦은 시간 채팅은 부담스러울 수 있습니다. 특히 새벽 시간에는 채팅을 자제해주세요.
</div>

<div class="question-2">
Q. 애기당근에서 직거래 잘하는 방법
</div>
 <div class="answer-2">
A. 애기당근에서는 우리 동네 근처의 이웃과 거래하는 만큼 직거래하는 것을 권장하고 있습니다. <br>
　그렇다면 직거래를 잘하기 위해서 지켜야할 점은 무엇이 있을까요?<br><Br>
     
　* 공공장소에서 만나 거래해요.<Br>
　* 약속시간을 꼭 지켜서 거래해요.<br>
　* 만나서 가격을 무리하게 깎지 않습니다.<Br>
　* 거래 후에는 따뜻한 감사 인사로 마무리해요.<Br>
</div>
</div><!-- 4 -->

 <div id="tabs-5">
<!-- 이용제재 자리임 수정예정 -->
<div class="question-1">
Q. 차단한 사용자가 탈퇴 후 재가입하면 차단 상태가 이어지나요?
</div>
 <div class="answer-1">
A. 차단한 사용자가 탈퇴 후 재가입했다면 차단 상태는 이어지지 않습니다.<Br> 
　번거롭겠지만 다시 차단을 해주셔야합니다. <br>
　사용자 차단은 [사용자 관리]에서 하실 수 있습니다.
</div>

<div class="question-2">
Q. 이용정지 된 이유가 궁금해요
</div>
 <div class="answer-2">
 A. 1. 비매너, 거래 약속 불이행 사유 <Br>
　최근 30일 이내 3번 이상 신고 접수가 된 경우 비매너 사유로 경고 및 이용정지 됩니다.<br>
　-아래와 같은 행동은 거래약속 불이행 사유에 포함되고 있으니 주의해주시기 바랍니다.<br>
　1) 약속장소에 나타나지 않음 <br>
　2) 거래 시간과 장소를 정하고 연락 두절됨<br>
　3) 거래 시간과 장소를 정하고 거래 직전에 취소함<Br><br>
 
　내가 받은  비매너 신고가 납득되지 않을 수 있습니다. <br>
　그렇더라도 고객센터에서 임의로 비매너 평가를 삭제할 수는 없습니다. <Br>
　비매너 신고는 주관적으로 남길 수 있는 만큼 고객센터에서도 비매너하다, 비매너가 아니다라고 판단할 수 없기 때문입니다. <br>
　이 점은 양해부탁드립니다. <br><br>

　2. 애기당근 운영정책을 위반한 경우<br>
　채팅 남용, 욕설 및 명예훼손, 스팸, 홍보/광고 등 애기당근 운영정책을 위반했을 경우 이용이 정지될 수 있습니다.<br><br>

　이용정지 되었다면 새로운 게시글을 작성하실 수 없으며, 새로운 댓글을 다실 수 없습니다.
</div>
</div><!-- 5 -->

 <div id="tabs-6">
<!-- 거래매너 자리임 수정예정 -->
<div class="question-1">
Q. 신고하면 상대방이 알 수 있나요?
</div>
 <div class="answer-1">
A. 상대방(신고를 당한 사람)은 누가 신고했는지를 알 수 없습니다. 그러니 신고해야 할 일이 생겼다면 안심하고 신고해 주세요.
</div>

<div class="question-2">
Q. 게시글 아래의 하트 아이콘은 무엇을 의미하나요?
</div>
 <div class="answer-2">
A. 하트는 관심 개수를 의미합니다. 하트 개수가 많을 수록 인기 많은 게시글이라고 볼 수 있습니다.
</div>
</div><!-- 6 -->

</div> 
</div>



<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div><!-- container div -->


</body>
</html>