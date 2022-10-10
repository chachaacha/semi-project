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
 		window.open("report_profile_popup.jsp?id="+id,"report_profile_popup",
		"width=520,height=620,top=234,left=979,scrolling=no")
})	
});
  
  //차단하기 버튼 클릭 시
  $(function() {
		$(".block").click(function() {
			confirm("사용자를 정말 차단하시겠어요?")
		})
	});
  </script>
  <!-- tab끝 -->
</head>
<body>
<!-- 사용자의 기본 정보 가져오기 -->
<jsp:useBean id="pVO" class="userVO.ProfilVO"></jsp:useBean>
<jsp:setProperty property="*" name="pVO"/>
<%
String id="test1";
ProfilDAO pDAO = ProfilDAO.getInstance();
List<ProfilVO> ppList = pDAO.selectPp(id);
%>

<!-- 사용자에 따른 상품 전체 조회 -->
<jsp:useBean id="ppVO" class="userVO.ProfilPVO"></jsp:useBean>
<!-- hidden으로 받은 아이디 설정 -->
<jsp:setProperty property="id" name="ppVO" value=""/>
<jsp:setProperty property="price" name="ppVO" />
<jsp:setProperty property="product_idx" name="ppVO" />
<jsp:setProperty property="thumbnail" name="ppVO" />
<jsp:setProperty property="title" name="ppVO" />
<jsp:setProperty property="gu" name="ppVO" />
<jsp:setProperty property="reserved" name="ppVO" />
<jsp:setProperty property="sold_check" name="ppVO" />
<jsp:setProperty property="posted_date" name="ppVO" />

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
					<img alt="프로필이미지" src="../../images/profileImg.png" class="profile-img">
				</div><!-- profile_img -->
				<div class="nick_name"><%=pVO.getNick() %>( <%=pVO.getId() %>)
					<div class="btns">
						<button class="confirm" type="button">신고하기</button>
						<button class="block" type="button">차단하기</button>
					</div><!-- btns -->
				</div><!-- 별명 -->
				<div class="report_cnt">누적 신고 횟수 : <%= pVO.getReport_cnt() %></div>
			
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
								<img alt="이미지 자리" src="${pa.thumbnail }">
								<div class="ou_border">
									<div class="ou_itm_title"><c:out value="${ pa.title }"/>
										<div class="dong_date"><c:out value="${ pa.gu }"/> ㆍ <c:out value="${ pa.posted_date }"/> </div><!-- dong_date -->
											<div class="price"><fmt:formatNumber pattern="#,###,###" value="${ pa.price }"/>원</div>
	
	</div><!-- ou_itm_title-->
		</div><!-- ou_border-->
			</div><!-- ou_img-->
				</div><!-- ou_item -->
</c:forEach>
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
						<img alt="이미지 자리" src="${ so.thumbnail }">
						<div class="ou_border">
								<div class="ou_itm_title"><c:out value="${ so.title }"/>
									 <div class="dong_date"><c:out value="${ so.gu }"/> ㆍ ${ so.posted_date } </div><!-- dong_date -->
											<div class="price"><fmt:formatNumber pattern="#,###,###" value="${ so.price }"/>원</div>
	
	</div><!-- ou_itm_title-->
		</div><!-- ou_border-->
			</div><!-- ou_img-->
				</div><!-- ou_item -->
</c:forEach>
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
			<img alt="이미지 자리" src="${ ps.thumbnail }">
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