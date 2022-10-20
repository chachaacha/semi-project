<%@page import="userDAO.BoardDAO"%>
<%@page import="javax.swing.RepaintManager"%>
<%@page import="userVO.ReportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/report_write_comments_popup.css"/>
<jsp:useBean id="rVO" class="userVO.ReportVO" scope="page"/>
<jsp:useBean id="rbVO" class="userVO.ReportBVO" scope="page"/>
<jsp:useBean id="rcVO" class="userVO.ReportCVO" scope="page"/>
<jsp:useBean id="cVO" class="userVO.UserCommentVO" scope="page"/>
<jsp:setProperty property="*" name="rVO"/>
<jsp:setProperty property="*" name="rbVO"/>
<jsp:setProperty property="*" name="rcVO"/>
<jsp:setProperty property="*" name="cVO"/>

<style type="text/css">
html {
   overflow: hidden;
}
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

   function report() {
      var rridx= $("[name='rr_idx']:checked").val();
      if(rridx==null){
         alert("차단사유를 선택해주세요.");
      }else{
         $("#rr_idx").val(rridx);
         $("#reportFrm").submit();   
      }
   }

</script>
<%
//BoardDAO 생성
BoardDAO bDAO=BoardDAO.getInstance();

//신고사유 불러오기
List<ReportVO> reportList=bDAO.selectReportB();
pageContext.setAttribute("reportList", reportList);

/* String type=request.getParameter("type");
pageContext.setAttribute("type", type); */
%>
<c:if test="${not empty param.rr_idx && param.type eq 'breport'}"> <%--게시물 신고접수--%>
   <c:catch var="ServletException">
   <% 
   bDAO.insertReportB(rbVO);
   bDAO.updateReportB(rbVO);
   %>
   </c:catch>
   <c:if test="${not empty ServletException }">
      <script type="text/javascript">
         alert("이미 신고가 접수된 게시물입니다.");
         self.close();
      </script>
   </c:if>
   <script type="text/javascript">
      alert("신고가 접수되었습니다.");
      self.close();
   </script>   
</c:if>

<c:if test="${not empty param.rr_idx && param.type eq 'creport'}"><%--댓글 신고접수--%>
   <c:catch var="ServletException">
   <% 
   bDAO.insertReport(rcVO);
   bDAO.updateReportC(cVO);
   %>
   </c:catch>
   <c:if test="${not empty ServletException }">
      <script type="text/javascript">
         alert("이미 신고가 접수된 댓글입니다.");
         self.close();
      </script>
   </c:if>
   <script type="text/javascript">
      alert("신고가 접수되었습니다.");
      self.close();
   </script>   
</c:if>

<head>
<body>
<div class="wrap">
   <h1 class="title">신고하기</h1>
   <div class="sub-title">사유선택</div>
   <div class="contents">
      <ul>
         <c:forEach var="rList" items="${reportList}">
         <li><input type="radio" name="rr_idx" class="report-wc-radio" value="${rList.rr_idx }"><c:out value="${rList.contents }"></c:out></li>
         </c:forEach>
      </ul>
   </div>
   <button type="button" class="report-wc-btn" onclick="report();">신고하기</button>
</div>

<form method="get" id="reportFrm">
<input type="hidden" id="id" name="id" value="${param.id }"/>
<input type="hidden" id="product_idx" name="product_idx" value="${param.product_idx }"/>
<input type="hidden" id="rr_idx" name="rr_idx" value="${param.rr_idx }"/>
<input type="hidden" name="comment_idx" id="comment_idx" value="${param.comment_idx}">
<input type="hidden" name="reply_idx" id="reply_idx" value="${param.reply_idx}">
<input type="hidden" name="type" id="type" value="${param.type}">
</form>

</body>
</html>