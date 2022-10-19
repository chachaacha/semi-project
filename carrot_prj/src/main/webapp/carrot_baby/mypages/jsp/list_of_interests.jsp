<%@page import="userVO.WishListVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.WishListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<%-- 세션말료시 로그인화면 이동 --%>
<c:if test="${ empty id }">
<c:redirect url="../../login/jsp/user_login.jsp"/>
</c:if>

<body>
<!--VO객체 생성 -->
<jsp:useBean id="wlVO" class="userVO.WishListVO"></jsp:useBean>
<!-- session에 저장된 아이디를 구매자 아이디로 설정 -->
<jsp:setProperty property="id" name="wlVO" value="${ id }"/>
<jsp:setProperty property="product_idx" name="wlVO"/>
<jsp:setProperty property="thumbnail" name="wlVO"/>
<jsp:setProperty property="title" name="wlVO"/>
<jsp:setProperty property="gu_idx" name="wlVO"/>
<jsp:setProperty property="gu" name="wlVO"/>
<jsp:setProperty property="price" name="wlVO"/>
<jsp:setProperty property="comment_cnt" name="wlVO"/>
<jsp:setProperty property="liked_cnt" name="wlVO"/>

<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<!-- 1 -->
<div class="container">
<%@ include file="myinfo_navi.jsp" %>

<%
String id = (String)session.getAttribute("id");
WishListDAO wlDAO = WishListDAO.getInstance();
List<WishListVO> wlList = wlDAO.selectWL(id);

//스콥객체에 할당
pageContext.setAttribute("wlList", wlList);
%>

<div class="list_of_interests_wrap">
   <div class="list_of_interests">관심목록</div>
   <c:forEach var="wl" items="${ wlList }">
   <div class="list_of_interests_item">
      <div class="list_of_interests_item_img">
      <!-- 이미지 클릭시 해당 페이지로 이동 -->
      <a href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${wl.product_idx }">
         <img alt="이미지 자리" src="${wl.thumbnail }">
      </a>
            <div class="list_of_interests_item_border">
               <div class="loi_title">
               <a href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${wl.product_idx }"><c:out value="${ wl.title }"/></a> <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="heart_btn" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>
                     <div class="dong_date"><c:out value="${ wl.gu }"/> </div><!-- dong_date -->
                        <div class="price_ch">
                           <div class="price"><fmt:formatNumber pattern="#,###,###" value="${ wl.price }"/>원</div>
                               <div class="cmt_n_heart">
                                 <div class="heart">하트
                                    <div clss="heart_cnt"><c:out value="${ wl.liked_cnt }"/> </div><!-- 하트 카운트 -->
                                       </div><!-- 하트 -->
                                 <div class="cmt">댓글
                                       <div><c:out value="${ wl.comment_cnt }"/> </div><!-- 댓글 카운트 -->
                                    </div><!-- 댓글 -->
                              </div><!-- cmt_n_heart -->
                           </div><!-- price_ch -->
   </div><!-- loi_title -->
   </div><!-- loi_border-->
   </div><!-- loi_img -->
   </div><!-- loi 전체를 담는 div -->
   </c:forEach>
   <c:if test="${ empty wlList  }" >
   관심목록에 담긴 상품이 없습니다.
   </c:if>
</div>
</div>
<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div> <!-- 컨테이너 div -->

</body>
</html>