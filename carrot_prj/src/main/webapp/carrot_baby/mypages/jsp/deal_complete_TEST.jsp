<%@page import="java.io.PrintWriter"%>
<%@page import="userVO.MySalesVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.MySalesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- parameter받은 VO생성 -->
<jsp:useBean id="msdcVO" class="userVO.MySalesVO" scope="session"/>
<!-- 2. VO에 setter method(property)호출 -->
<jsp:setProperty property="*" name="msdcVO"/>
<!-- 세션에 저장된 아이디 가져오기-->
<jsp:setProperty property="id" name="msdcVO" value="${id }"/>
 
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
<% 
// 세션 만료시 로그인화면으로 이동
	if(session.getAttribute("id")==null) {
		response.sendRedirect("../../login/jsp/user_login.jsp");
	}
%>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->

<div class="container">
	
<%@ include file="myinfo_navi.jsp" %>

<div class="deal_complete_title_wrap">
	<div class="deal_complete_title">거래완료</div>
	<%
	String id = (String)session.getAttribute("id");
	MySalesDAO msDAO=MySalesDAO.getInstance();
	List<MySalesVO> dealComplete=msDAO.selectDealComplete(id);
	//System.out.println("-----"+dealComplete); //찍어보니 값이 안담긴당...--->계속 test1으로 테스트해봤었는데 test1에는 거래 완료가 없어서 
	//빈 화면이 출력되는 거였음! test5로 하니까 판매중 버튼도 잘 걸림
	
	//스콥 객체에 할당하기
	pageContext.setAttribute("dealComplete", dealComplete);
	%>
	
	<!--  게시글 삭제 코드 by 구선배 ㅋ-->
	<%
	//String id = null; 위에 써서 중복이라고 뜨는 건지? 일단 주석으로 막음
	if(session.getAttribute("id") !=null ){ //세션에 아이디가 없다면?
		id = (String)session.getAttribute("id"); //아이디를 세션에서 가져온다
	}//end if
	if(id ==null){  //아이디가 없다면, alert로 "로그인을 해주세요"가 나온다.
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href ='user_login.jsp'");
		script.println("</script>");
	}//end if
	
	int product_idx =0;
	if(request.getParameter("product_idx") != null){
		product_idx=Integer.parseInt(request.getParameter("product_idx"));
	}//end if
	if(product_idx == 0) { //0으로 만들면 없애는,, 고런
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		//예시에서는 게시판 메인으로 돌아가는 a href 코드를 썼는데 어디로 이동할지 생각해보기
		script.println("</script>");
	}//end if
	//오류나서 밑에 두 줄은 막았습니다 ㅎㅎ.....
	//MySalesVO msVo= new MySalesDAO().getMySalesVO("product_idx");
	//MySalesVO msVo= new MySalesDAO().getInstance("product_idx");
	//위에랑 같이 있는 if문은 권한이 없습니다가 들어가는데, 
	//이 경우도 넣어야하나?/ 일단 밑에있는 else부터..!
			
	//MySalesDAO msDAO = new MySalesDAO(); //이것도 위에 똑같이 있어서 오류나는지?
	//String result = MySalesDAO.deleteBoard(product_idx);
	
	
	%>
	<!-- for each로 반복 -->
	<c:forEach var="dc" items="${dealComplete}">
	 	<div class="deal_complete_item">
			<div class="deal_complete_item_img">
				<a href="">
				<img alt="이미지 자리" src="${dc.thumbnail }">
				</a>
					<div class="deal_complete_item_border">
						<div class="dci_title">
							<a href="" style="text-decoration: none; color: black; ">
							<c:out value="${dc.title }"/>
							</a>
						<button class="edit_del_btn" type="button">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  							<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  							<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
						</button>
							<div class="dong_date">
							<c:out value="${dc.gu }"/>
							ㆍ
							<c:out value="${dc.posted_date }" />
						</div><!-- dong_date --><!-- 구와 올린날짜. 디자인할 때랑 이름이 달라짐 ^~^ -->
							<div class="price_ch">
									<div class="btn_price">
										<fmt:formatNumber pattern="#,###,###원" value="${dc.price }"/>
									</div><!-- "btn_price" -->
									 	<div class="cmt_n_heart">
											<div class="heart">하트&nbsp;
													<span class="heart_cnt">
														<c:out value="${dc.liked_cnt}"/>
													</span><!-- 하트 카운트 -->
											</div><!-- 하트 -->
											<div class="cmt">댓글&nbsp;
													<span>
														<c:out value="${dc.comment_cnt }"/>
													</span><!-- 댓글 카운트 -->
											</div><!-- 댓글 -->
										</div><!-- price_ch -->
											</div><!-- cmt_n_heart -->
								
	</div><!-- dci_title -->
	</div><!-- on_sale_item_border-->
	</div><!-- on-sale_item_img -->
	</div><!-- deal_complete_item -->
</c:forEach>

	<c:if test="${ empty dealComplete  }" >
	거래완료된 상품 내역이 없습니다.
	</c:if>


	</div> <!-- deal_complete_title_wrap -->
	
</div><!-- container -->

<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div><!-- wrap -->
</body>
</html>