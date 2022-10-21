<%@page import="java.util.ArrayList"%>
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
$(function() {
	//선택삭제 버튼클릭시
	$("#multipleDelBtn").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			if(!$("[name='commChk']").is(":checked")){
				alert("댓글을 1개 이상 선택해 주세요");
				return;
			}
			$("#multipleDelFrm").submit();//체크박스 값들을 submit
		}
	});
});

//체크박스일괄처리
function allChk() {
	if($("#allChk").is(":checked")){
		$("[name='commChk']").prop("checked",true);
	} else {
		$("[name='commChk']").prop("checked",false);
	}
}
//댓글개별삭제
function oneCommDelete(pIdx, cIdx, rIdx) { // 댓글삭제 버튼을 누를 시 값들이 저장되어 호출
	if(confirm("선택한 댓글을 정말 삭제하시겠어요?")){
		$("#oneDelete").val(pIdx+","+cIdx+","+rIdx); // 값들을 히든폼에 넣어서 한번에 전달
		$("#deleteFrm").submit();
	}
}

//페이징
function pageMove( page ) {
	$("#pageFlag").val(page);
	$("#pageFrm").submit();
}

</script>
</head>
<body>
<%-- 세션만료시 로그인을 복귀 --%>
<c:if test="${ empty sessionScope.id }">
<c:redirect url="../../login/jsp/user_login.jsp" />
</c:if>

<% 
//내댓글목록불러오기
request.setCharacterEncoding("UTF-8");
MyCommDAO mcDAO = MyCommDAO.getInstance();
List<MyCommVO> mcList = mcDAO.selectMC((String)session.getAttribute("id"),request.getParameter("pageFlag") == null ? 1:Integer.parseInt(request.getParameter("pageFlag")));
pageContext.setAttribute("mcList", mcList);

//총 댓글 수
int total = mcDAO.selectMCTotal((String)session.getAttribute("id"));
pageContext.setAttribute("total", total);
%>

<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">

<%@ include file="myinfo_navi.jsp" %>

<%-- 개별삭제를 위한 폼 --%>
<form id="deleteFrm" method="post">
<input type="hidden" id="oneDelete" name="oneDelete" value="${ param.oneDelete }"/>
</form>

<%-- 페이징폼 --%>
<form id="pageFrm" method="get">
<input type="hidden" id="pageFlag" name="pageFlag" value="${ param.pageFlag }"/>
</form>

<div class="mcm_title_wrap">
	
	<div class="mcm_title">내 댓글 관리<span class="title-span"> (총 댓글 수 <c:out value="${ total }"/>개)</span></div><!-- mcm title -->
		<c:if test="${ empty mcList }">
		작성한 댓글이 없습니다.
		</c:if>
		<div class="my_comment_list"${ empty mcList ?" style='display:none'":"" }>
		    <div class="mcl_title">
				<div class="mcl_title_align"><!-- mcl_title_align 시작 -->
					<div><input type="checkbox" id="allChk" class="mcl_check" onclick="allChk()">번호</div><!-- mcl_num -->	
					<div>내용</div><!-- mcl_content -->
					<div>
						<button class="mcl_button" type="button" id="multipleDelBtn">선택삭제</button>
					</div><!-- mcl_btn -->	
				</div><!-- mcl_title_align 끝 -->
		    </div><!-- mcl_title -->
				<!-- 댓글 내용들 -->
				<div> <!-- mcl_content_wrap -->
					<!-- 반복시작 -->
					<form id="multipleDelFrm" method="post"> 
					<c:set var="sizeChk" value="${ pageScope.mcList }"/>
					<c:forEach var="mcList" items="${ pageScope.mcList }" varStatus="i">
					<div class="mcl_content">
						 <div><!-- chk_wrap -->
						 	<!-- ","로 나눠진 여러개의 값들을 하나의 value로 받는다. -->
						 	<input type="checkbox" name="commChk" value="${ mcList.product_idx },${ mcList.comment_idx },${ mcList.reply_idx }" class="mcl_check"/>${ i.count } 
						 </div>
					  <div class="content_wrap"><!-- content_wrap 시작 -->
						<div class="post_style"><a href="../../product/jsp/user_buyer_product_comments.jsp?product_idx=${mcList.product_idx }" style="color: #040404;">[글]&nbsp;<c:out value="${ mcList.title }"/></a></div><!-- mcl_content의 제목 --><!-- 폰트크기 댓글이랑 날짜랑 차이나게 키워야함 -->
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
					</form> 
				</div><!-- mcl_content_wrap-->
		</div><!-- 댓글관리 리스트 전체-->
		<!-- 페이징 -->
		<div class="page-bottom" >
		<c:set var="ceil" value="${ total/10 }"/>
		<c:set var="lastPage" value="${ ceil+(1-(ceil%1))%1 }"/>
		<c:set var="curPage" value="${ empty param.pageFlag? 1 : param.pageFlag }"/>
		<c:set var="startNum" value="${ curPage - (curPage - 1)% 3 }"/>
		<c:set var="isLast" value="2"/>
		<c:if test="${ total gt 0 }">
		
		<c:if test="${curPage >= 4}">
		<a href="javascript:pageMove(1)" class="page-bottom-next">&lt;&lt;</a>
		<a href="javascript:pageMove('${ startNum eq 1 ? 1 :  startNum-1 }')" class="page-bottom-next">&lt;</a>
		</c:if>
		
		<c:if test="${ startNum+3 > lastPage }">
			<c:set var="isLast" value="${ lastPage - startNum }"/>
		</c:if>
		
		<c:forEach var="i" step="1" begin="0" end="${ isLast }">
			<a href="javascript:pageMove('${ startNum+ i }')"${ curPage eq startNum+i ? "class='page-bottom-icon-click'": "class='page-bottom-icon'" }><c:out value="&nbsp;${ startNum+i }&nbsp;" escapeXml="false"/></a>
		</c:forEach>
		
		<c:if test="${ lastPage >= startNum+3 }">
			<a href="javascript:pageMove('${ startNum+3 }')" class="page-bottom-next">&gt;&gt;</a>
			<a href="javascript:pageMove('${ lastPage }')" class="page-bottom-next">&gt;</a>
		</c:if>
		
		</c:if>
		</div>
</div>
</div><!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>
<%-- 댓글삭제처리 --%>
<c:if test="${ not empty param.oneDelete }">
<jsp:useBean id="mcdVO" class="userVO.MyCommVO"></jsp:useBean>
<%-- 담아온 값을 split으로 자르고 해당하는 객체에 set --%>
<jsp:setProperty property="product_idx" name="mcdVO" value="${ fn:split(param.oneDelete,',')[0] }"/>
<jsp:setProperty property="comment_idx" name="mcdVO" value="${ fn:split(param.oneDelete,',')[1] }"/>
<jsp:setProperty property="reply_idx" name="mcdVO" value="${ fn:split(param.oneDelete,',')[2] }"/>
<% mcDAO.updateDropMc(mcdVO); %>
<script type="text/javascript">
location.href="my_comment_management.jsp";
alert("댓글이 삭제되었습니다.");
</script>
</c:if>

<%-- 댓글일괄삭제처리 --%>
<c:if test="${ not empty paramValues.commChk or not empty param.commChk }">
<% 
List<MyCommVO> list = new ArrayList<>();
String[] commArr = request.getParameterValues("commChk");// 배열 방 하나에 상품인덱스, 댓글인덱스, 답글인덱스가 ","로 구분되어 있다.
MyCommVO mcuVO = null;
String[] param = null;
for(int i = 0 ; i<commArr.length;i++) {
	mcuVO = new MyCommVO();
	param=commArr[i].split(",");// split으로 넘어온 파라매터 배열의 각 방을 자른다.
	mcuVO.setProduct_idx(param[0]);//첫번 째 방의 상품인덱스를 vo에 set
	mcuVO.setComment_idx(Integer.parseInt(param[1]));//두번 째 방의 댓글인덱스를 vo에 set
	mcuVO.setReply_idx(Integer.parseInt(param[2]));//세번 째 방의 답글인덱스를 vo에 set
	list.add(mcuVO);
}
int resultCnt = mcDAO.updateDropMultipleMc(list);
pageContext.setAttribute("resultCnt", resultCnt);
%>
<script type="text/javascript">
location.href="my_comment_management.jsp";
alert("${ resultCnt }개의 댓글이 삭제 되었습니다.");
</script>


</c:if>

</body>
</html>