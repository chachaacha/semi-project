<%@page import="userDAO.MyBlockDAO"%>
<%@page import="userVO.MyBlockVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차단 사용자 관리</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/block_user_management.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
//차단하기 버튼을 눌렀을 때 confirm창
function delBlock(id){
	if(confirm("차단 해제하시겠습니까?")){
		$("#delBlo").val(id);
		$("#hidFrm").submit();
	};
};


</script>

</head>
<%-- 세션처리 --%>
<c:if test="${ empty sessionScope.id }">
<c:redirect url="../../login/jsp/user_login.jsp" />
</c:if>

<%
MyBlockDAO mbDAO = MyBlockDAO.getInstance();
List<MyBlockVO> mbList = mbDAO.selectMB((String)session.getAttribute("id"));
pageContext.setAttribute("mbList", mbList);
%>

<form method="post" id="hidFrm">
	<input type="hidden" id="delBlo" name="delBlo">
</form>
<%-- 차단해제처리 --%>
<jsp:useBean id="mbVO" class="userVO.MyBlockVO"></jsp:useBean>
<jsp:setProperty property="blocked_id" name="mbVO" value="${ param.delBlo }"/>
<jsp:setProperty property="id" name="mbVO" value="${ id }"/>
<c:if test="${ not empty param.delBlo }">
<% mbDAO.deleteMB(mbVO); %>
<script type="text/javascript">
alert("차단해제 하였습니다.");
location.href="block_user_management.jsp";
</script>
</c:if>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">
<%@ include file="myinfo_navi.jsp" %>
<div class="title_wrap">
	<div class="title">차단 사용자 관리</div>
	
	<c:forEach var="mbList" items="${ pageScope.mbList }">
	<div class="profile">
			<div class="profile-wrap">
				<div class="profile_img_wrap">
					<img alt="프로필이미지" src="../../images/profileImg.png" class="profile-img">
				</div><!-- profile_img -->
				<div class="profile-txt-wrap">
						<div class="nick_name"><c:out value="${ mbList.nickPlusId }" /></div><!-- 별명 -->
						<div class="region"><c:out value="${ mbList.addr1 }" /></div>
				</div>
			</div><!-- profile-wrap -->
		<div><a href="javascript:delBlock('${ mbList.blocked_id }')"><button class="block" type="button">차단해제</button></a></div>
	</div><!-- profile -->
	</c:forEach>
</div> <!-- container div -->
</div><!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>

</body>
</html>