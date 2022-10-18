<%@page import="userVO.ProfilVO"%>
<%@page import="userVO.ProfilPVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.ProfilDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
  //신고하기 버튼 클릭 시
 	 $(".confirm").click(function(){
 		 //팝업창 열기
 		window.open("report_profile_popup.jsp?id=${param.id}"
 				,"report_profile_popup",
		"width=580,height=660,top=234,left=979,scrolling=no")
		//신고하려는 아이디 팝업창으로 전달
		$("#reportFrm").submit();
	});//click
});//ready
  
  //차단하기 버튼 클릭 시
  $(function() {
		$(".block").click(function() {
			var flag = confirm("사용자를 정말 차단하시겠어요?");
			
			if(flag==true){
				$("#blockFrm").submit();
			}
		});//click
	});
	
  </script>
  <!-- tab끝 -->
</head>
<body>
<% //POST방식의 요청 한글 처리
request.setCharacterEncoding("UTF-8");%>

<!-- 사용자의 기본 정보 가져오기 -->
<jsp:useBean id="pfVO" class="userVO.ProfilVO"></jsp:useBean>
<jsp:setProperty property="*" name="pfVO"/>
<jsp:setProperty property="id" name="pfVO" value="${ param.id }"/>

<!-- 사용자에 따른 상품 전체 조회 -->
<jsp:useBean id="ppVO" class="userVO.ProfilPVO"></jsp:useBean>
<!-- 게시글 작성자 클릭시 넘겨받은 아이디를 value로 설정 -->
<jsp:setProperty property="*" name="ppVO"/>
<jsp:setProperty property="id" name="ppVO" value="${ param.id }"/>

<% 
String id=request.getParameter("id");
ProfilDAO pDAO = ProfilDAO.getInstance();

//사용자 기본 정보 가져오기
ProfilVO pVO = pDAO.selectPp(id);
pageContext.setAttribute("pVO", pVO);
%>

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
					<img alt="프로필이미지" src="../../user_profile_upload/${pVO.img }" class="profile-img">
				</div><!-- profile_img -->
				<div class="nick_name">${pVO.nick} ( <c:out value="${fn:substring(pVO.id,0,4) }****"/>)
					<div class="btns">
						<button class="confirm" type="button">신고하기</button>
						<form method="post" action="user_block_process.jsp" id="blockFrm">
						<input type="hidden" name="id" id="id" value="${param.id }"/>
						<button class="block" type="button">차단하기</button>
						</form>
					</div><!-- btns -->
				</div><!-- 별명 -->
				<div class="report_cnt">누적 신고 횟수 : ${pVO.reported_cnt}</div>
			
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
<!-- 전체 -->
<%
List<ProfilPVO> paList = pDAO.selectPdAll(id);
//스콥객체에 할당
pageContext.setAttribute("paList", paList);
%>
<c:forEach var="pa" items="${ paList }">
		    			<div class="ou_item">
							<div class="ou_img">
								<a href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${pa.product_idx }">
								<img alt="이미지 자리" src="../../search/image/${pa.thumbnail }">
								</a>
								<div class="ou_border">
									<div class="ou_itm_title"><c:out value="${ pa.title }"/>
										<div class="dong_date"><c:out value="${ pa.gu }"/> ㆍ <c:out value="${ pa.posted_date }"/> </div><!-- dong_date -->
											<div class="price"><fmt:formatNumber pattern="#,###,###" value="${ pa.price }"/>원</div>
	
	</div><!-- ou_itm_title-->
		</div><!-- ou_border-->
			</div><!-- ou_img-->
				</div><!-- ou_item -->
</c:forEach>

<c:if test="${ empty paList }">
	거래하신 내역이 없습니다.
</c:if>	
		  </div><!-- tabs-1 -->
		  
<!-- 판매 상품 조회 -->
		  <div id="tabs-2">
<%
List<ProfilPVO> soList = pDAO.selectSO(id);
pageContext.setAttribute("soList", soList);
%>
<c:forEach var="so" items="${ soList }">
		    	<div class="ou_item">
					<div class="ou_img">
						<a href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${so.product_idx }">
						<img alt="이미지 자리" src="../../search/image/${ so.thumbnail }">
						</a>
						<div class="ou_border">
								<div class="ou_itm_title"><c:out value="${ so.title }"/>
									 <div class="dong_date"><c:out value="${ so.gu }"/> ㆍ ${ so.posted_date } </div><!-- dong_date -->
											<div class="price"><fmt:formatNumber pattern="#,###,###" value="${ so.price }"/>원</div>
	
	</div><!-- ou_itm_title-->
		</div><!-- ou_border-->
			</div><!-- ou_img-->
				</div><!-- ou_item -->
</c:forEach>

<!-- 사용자가 판매중인 상품이 없을 경우 표시되는 메시지-->
<c:if test="${ empty soList  }" >
	판매중인 상품 내역이 없습니다.
</c:if>
		  </div><!-- tabs-2 -->

<!-- 판매완료 -->		  
		  <div id="tabs-3">
<%
List<ProfilPVO> psList = pDAO.selectPS(id);
pageContext.setAttribute("psList", psList);
%>
<c:forEach var="ps" items="${ psList }">
	<div class="ou_item">
		<div class="ou_img">
			<a href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${ps.product_idx }">
			<img alt="이미지 자리" src="../../search/image/${ ps.thumbnail }">
			</a>
			<div class="ou_border">
				<div class="ou_itm_title"><c:out value="${ ps.title }"/>
					<div class="dong_date"><c:out value="${ ps.gu }"/> ㆍ <c:out value="${ ps.posted_date }"/> </div><!-- dong_date -->	
						<div class="db_align"><input type="button" value="거래완료" class="deal_btn" style="width: 100px; height: 30px;"/>가격위치
	</div><!-- db_align -->
		</div><!-- ou_itm_title -->
			</div><!-- ou_border-->			
				</div><!-- ou_img -->
					</div><!-- ou_item-->
</c:forEach>

<!-- 사용자가 거래완료한 상품이 없을 경우 표시되는 메시지-->
<c:if test="${ empty psList }">
	거래 완료된 상품 내역이 없습니다.
</c:if>	
		  </div><!-- tabs-3 -->
	</div><!-- tabs -->
			<!--<div class="ou_item_wrap">  -->

	
<!-- </div> <!-- ou item wrap --> 
</div><!-- profile -->
</div><!-- oup_wrap//전체 감싸는 틀~ -->



<!-- container end -->

<!-- 신고 팝업창으로 아이디 전달 -->
<%-- <form method="get" action="report_profile_popup.jsp" id="reportFrm">
	<input type="hidden" name="id" id="id" value="${param.id }"/>
</form> --%>

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div> <!-- 컨테이너 div -->


</body>
</html>