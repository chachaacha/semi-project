<%@page import="userDAO.MyCommDAO"%>
<%@page import="userVO.MyCommVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	$(".cmt_delete").click(function() {//댓글 삭제 버튼
		confirm("선택한 댓글을 정말 삭제하시겠어요?")
	})
});

function allChk() {
	if($("#allChk").is(":checked")){
		$("[name='commChk']").prop("checked",true);
	} else {
		$("[name='commChk']").prop("checked",false);
	}
}

function oneCommDelete(pIdx, cIdx, rIdx) {
	if(confirm("선택한 댓글을 정말 삭제하시겠어요?")){
		location.href="";
	} else {
		
	}
	
}

</script>
</head>
<body>
<c:if test="${ empty sessionScope.id }">
<c:redirect url="../../login/jsp/user_login.jsp" />
</c:if>

<% 
request.setCharacterEncoding("UTF-8");
MyCommDAO mcDAO = MyCommDAO.getInstance();
List<MyCommVO> mcList = mcDAO.selectMC((String)session.getAttribute("id"));
pageContext.setAttribute("mcList", mcList);
%>


<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">

<%@ include file="myinfo_navi.jsp" %>

<div class="mcm_title_wrap">
	<div class="mcm_title">내 댓글 관리</div><!-- mcm title -->
		<div class="my_comment_list">
			<div class="mcl_title">
				<div class="mcl_title_align"><!-- mcl_title_align 시작 -->
					<div><input type="checkbox" id="allChk" class="mcl_check" onclick="allChk()">번호</div><!-- mcl_num -->	
					<div>내용</div><!-- mcl_content -->
					<div>
						<button class="mcl_button" type="button">선택삭제</button>
					</div><!-- mcl_btn -->	
				</div><!-- mcl_title_align 끝 -->
		    </div><!-- mcl_title -->			
				<!-- 댓글 내용들 -->
				<div> <!-- mcl_content_wrap -->
					<!-- 반복시작 -->
					<c:set var="sizeChk" value="${ pageScope.mcList }"/>
					<c:forEach var="mcList" items="${ pageScope.mcList }" varStatus="i">
					<div class="mcl_content">
						 <div><!-- chk_wrap -->
						 	<input type="checkbox" name="commChk" class="mcl_check"/>${ i.count } 
						 </div>
					  <div class="content_wrap"><!-- content_wrap 시작 -->
						<div class="post_style">[글]&nbsp;<c:out value="${ mcList.title }"/></div><!-- mcl_content의 제목 --><!-- 폰트크기 댓글이랑 날짜랑 차이나게 키워야함 -->
						<div class="cmt_style"><c:out value="${ mcList.contents }" /></div> <!-- mcl_comment의 댓글 --><!-- 폰트 색 : gray -->
						<div class="cmt_style"><fmt:formatDate pattern="yyyy-MM-dd" value="${ mcList.posted_date }"/></div><!-- mcl_content의 날짜 -->
					</div><!-- content_wrap 끝 -->
					
						<div><!-- button_wrap 시작-->
							<a href="javascript:oneCommDelete('${ mcList.product_idx }','${ mcList.comment_idx }','${ mcList.reply_idx }')"><button class="cmt_delete" type="button">댓글삭제</button></a>
						</div><!-- button_wrap 끝-->
					</div><!-- mcl_content 1 -->
					<c:if test="${ fn:length( sizeChk ) ne i.count }">
					<hr>
					</c:if>
					</c:forEach>
				
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