<%@page import="java.io.Console"%>
<%@page import="userVO.PostVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="userVO.CatVO"%>
<%@page import="userVO.LocVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 형식 지정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 사이즈 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_write.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	
	$("#pushBtn").click(function() {
		//유효성 검사.
		chkNull();
	});//click
	
	/* div 선택시 파일 열기  */
	const imgUpload=document.querySelector(".imgs-upload");
	const upload=document.querySelector(".upload");
	
/* 	upload.addEventListener('click', () => imgUpload.click()); */
	
	$("#free").change (function() {
		var st = this.checked;
		
		if(st){
			$("#price").prop("readonly",true);
			$("#price").css("background", "#ccc");
			$("#price").val("0");
		} else{
			$("#price").prop("readonly", false);
			$("#price").css("background", "none");
		}//end else
		
	});//change
	
	
	
});//ready


function onClickUpload() {
    let myInput = document.getElementById("btnAtt");
    myInput.click();
}

function chkNull(){
	 //구 입력
	if($("#category_loc").val()==0){
		alert("지역구를 선택하세요.");
		$("#categorly_loc").focus();
		return;
	}
	
	if($("#category_pd").val()==0){
		alert("상품 카테고리를 선택하세요.");
		$("#categorly_pd").focus();
		return;
	}
	
	if($("#price").val().trim()==""){
		alert("가격을 입력해주세요.");
		$("#price").focus();
		return;
	}
	
	if($("#title").val().trim()==""){
		alert("제목을 작성해주세요.");
		$("#title").focus();
		return;
	}
	
	if($("#contents").val().trim()==""){
		alert("내용을 작성해주세요.");
		$("#contents").focus();
		return;
	}
	
	
	$("#writePost").submit();
	/* document.location.href="user_search.jsp"; */
}//chkNull

</script>
</head>
<body>
<%
String user_id =(String)session.getAttribute("user_id");
if(user_id==null){
user_id = "test10";
session.setAttribute("user_id", user_id);

}
%>
<%
		PostVO pVO = new PostVO();
		// String product_idx= request.getParameter("product_idx");
		String product_idx = "2210089137";
		pVO.setProduct_idx(product_idx);
		pVO.setId(user_id);
		//PostDAO와 연결
		PostDAO pDAO = PostDAO.getInstance();
		//VO 리스트로 받기
		List<LocVO> lVOList = pDAO.selectLoc();
		pageContext.setAttribute("lVOList", lVOList);
		List<CatVO> pCatList = pDAO.selectCat();
		pageContext.setAttribute("cVOList", pCatList);
		PostVO ppVO = pDAO.selectPost(pVO);
		
		
		//scope 객체 설정
		
		
		String contents = ppVO.getContents();
		int gu_idx = ppVO.getGu_idx();
		pageContext.setAttribute("gu_idx", gu_idx);
		int category_idx = ppVO.getCategory_idx();
		pageContext.setAttribute("category_idx", category_idx);
		String title = ppVO.getTitle();
		String price = Integer.toString(ppVO.getPrice());
		String free1 = ppVO.getFree();
%>
<div class="wrap">
<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">
	<div class="write-wrap">
		<h1 class="write-title">중고거래 글쓰기</h1>
		<div class="write">
		<form name="writePost" id="writePost" method="get" action="user_writeUp_process.jsp">
		<input type="hidden" id="prouduct_idx" name="product_idx" value="<%= product_idx %>"/>
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">서울특별시</div>
						<select id="category_loc"name="category_loc" class="write-select" >
							<option value="0">동네를 선택하세요</option>
							<c:forEach var="lVO" items="${ lVOList }">
									<option value="${lVO.gu_idx}"${ lVO.gu_idx eq gu_idx?" selected='selected'":"" }>${lVO.gu}</option>
							</c:forEach>
						</select>
			</div>
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">카테고리</div>
						<select id ="category_pd" name="category_pd" class="write-select">
							<option value="0">카테고리를 선택하세요</option>
							<c:forEach var="cVO" items="${ cVOList }">
									<option value="${cVO.category_idx}"${ cVO.category_idx eq category_idx?" selected='selected'":"" }>${cVO.category}</option>
							</c:forEach>
						</select>
			</div>
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">판매가격</div>
						<div class="write-sel-wrap-right">
						<c:if test=""></c:if>
							<div class="checkbox-share-wrap">
								<input type="checkbox" name="free" id= "free" value="Y" class="checkbox-share" 
								<%if(free1.equals("Y")) {%> checked="checked" <%} %>>
								<span class="checkbox-share-txt">나눔</span>
							</div>
							<div class="checkbox-price-wrap">
								<input type="text" name="price"  id = "price" class="checkbox-price-input" style= "text-align:right" 
											oninput = "this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="8" value ="<%= price %>">
								<span class="checkbox-price-txt">원</span>
							</div>
						</div>
			</div>
			<div class="write-center-wrap">
				<input type="text" name="title" id="title" class="write-title-input" placeholder="제목을 입력해주세요" value ="<%= title %>">
			</div>
		    </form>
		    <form name="ImgPost" id="ImgPost" method="get" action="user_Img_process.jsp">
		    <div class="write-center-wrap">
				<div class="img-wrap">
						<!-- <input type="file" id = "my-input" multiple = "multiple" style="visibility: hidden;"> -->
						<input type="file" id = "btnAtt" multiple = "multiple" style="visibility: hidden;">
						<label class="upload"  id="my-button">
							<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
							  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
							</svg>
						</label>
					</div>
					<div id = "att_zone"></div>			
				</div>
				</form>
				<form name="writePost" id="writePost" method="get" action="user_writeUp_process.jsp">
				<textarea rows="30" name="contents" id="contents" class="contents-txtarea" placeholder="내용을 입력해주세요"   ><%= contents %></textarea>
				</form>
			<div class="register-write">
					<button type="button" id="pushBtn" class="report-btn">등록하기</button>
			</div>
		</div>
	</div>
</div>
<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div>

</body>
</html>