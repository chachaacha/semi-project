<%@page import="managerVO.BlockReasonVO"%>
<%@page import="java.util.List"%>
<%@page import="managerDAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/manager_member_block_popup.css"/>
<style type="text/css">
html {
	overflow: hidden;
}
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	//신고하기를 누르면 서브밋
	$("#reportBtn").click(function(){
		var idx= $("[name='br_idx']:checked").val();
		if(idx==null){
			alert("차단사유를 선택하세요!");
		};
		$("#blockFrm").submit();
		
	})
});
</script>
</head>
<body>
<form method="get" id = "blockFrm">
<input type="hidden" name="id" value="${ param.id }"/> <!-- 회원관리에서 웹파라메터로 받은 아이디를 다시 히든에 넣어 submit한다.  -->
<div class="wrap">
	<h1 class="title">신고하기</h1>
	<div class="sub-title">사유선택</div>
	<div class="contents">
	<% 
		//차단사유 불러오기
		MemberDAO mDAO = MemberDAO.getInstance();  
		List<BlockReasonVO> brList = mDAO.selectBlockReason();
		pageContext.setAttribute("brList", brList);
	%>
		<ul>
			<c:forEach var="brList" items="${ pageScope.brList }">
			<li><input type="radio" name="br_idx" class="report-wc-radio" value="${ brList.br_idx }"><c:out value="${ brList.blocked_reason }"/></li>
			</c:forEach>
		</ul>
	</div>
	<button type="button" class="report-wc-btn" id="reportBtn" name="reportBtn">신고하기</button>
	
	
</div>
</form>
 	<%-- 신고하기 프로세스 --%>
	<c:if test="${ not empty param.br_idx }"> <%-- 처음에는 진입시에는 submit하지 않았기 때문에 웹파라메터가 없고 신고하기 버튼이 눌러어 웹 파마메터가 있을 때만 동작하게 한다. --%>
	<jsp:useBean id="mbVO" class="managerVO.ManagerBlockVO"></jsp:useBean>
	<jsp:setProperty property="*" name="mbVO"/>
	<c:catch var="sqlCVE"><%-- 이미 차단된 회원이라면 무결성조건에 대한 예외가 발생한다. 이를 잡아준다. --%>
	<% mDAO.insertBlock(mbVO); %>
	</c:catch>
	<c:if test="${ not empty sqlCVE }">
	<script type="text/javascript">
	//예외가 발생하면 이미 차단된 회원이기 때문에 경고창을 보여주고 복귀한다.
	alert("이미 차단된 아이디 입니다.");
	self.close();
	</script>
	</c:if>
	<script type="text/javascript">
	//예외가 발생하지 않을 경우 아직 차단되지 않은 회원이기 때문에 차단을 실행한다.
	alert("신고가 접수되었습니다.");
	self.close();
	</script>
	</c:if>
</body>
</html>