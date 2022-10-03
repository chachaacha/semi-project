<%@page import="userVO.CatVO"%>
<%@page import="userVO.LocVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	/* div 선택시 파일 열기  */
	const imgUpload=document.querySelector(".imgs-upload");
	const upload=document.querySelector(".upload");
	
	upload.addEventListener('click', () => imgUpload.click());
	
	$("#sharechk").change (function() {
		var st = this.checked;
		if(st){
			$("#price").prop("disabled",true);
			$("#price").css("background", "#ccc");
			$("#price").val("0");
		} else{
			$("#price").prop("disabled", false);
			$("#price").css("background", "none");
		}//end else
		
	});//change
	
});//ready
</script>
</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">
	<div class="write-wrap">
		<h1 class="write-title">중고거래 글쓰기</h1>
		<div class="write">
		<%
		//PostDAO와 연결
		PostDAO pDAO = PostDAO.getInstance();
		%>
			<div class="write-sel-wrap">
			<% 
			//LocVO 리스트로 받기
			List<LocVO> locCatList = pDAO.selectLoc();
			//뷰페이지로 보내기 위해 scope 객체에 설정
			request.setAttribute("loc_cat", locCatList);
			%>
						<div class="write-sel-wrap-text">서울특별시</div>
						<select name="region" class="write-select">
							<option value="">동네를 선택하세요</option>
							<%
						//scope 객체 받기.
						List<LocVO> listLoc = (List<LocVO>)request.getAttribute("loc_cat");
						%>
						<%//향상된 for문으로 listLoc 출력
						for(LocVO lVO : listLoc ) { %>
							<option value = "<%=lVO.getGu_idx() %>"><%=lVO.getGu() %></option>
						<%}//end for %>
						</select>
			</div>
			<div class="write-sel-wrap">
			<%
			//CatVO 리스트로 받기
			List<CatVO> pCatList = pDAO.selectCat();
			//scope 객체에 설정
			request.setAttribute("p_cat", pCatList);
			%>
						<div class="write-sel-wrap-text">카테고리</div>
						<select name="region" class="write-select">
							<option value="">카테고리를 선택하세요</option>
							<%
							//scope 객체 받기
							List<CatVO> listCat = (List<CatVO>)request.getAttribute("p_cat");
							%>
							<%
							//향상된 for문으로 listCat 출력
							for(CatVO cVO : listCat) {%>
								<option value = "<%= cVO.getCategory_idx()%>"><%= cVO.getCategory() %></option>
							<%}//end for %>
						</select>
			</div>
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">판매가격</div>
						<div class="write-sel-wrap-right">
							<div class="checkbox-share-wrap">
								<input type="checkbox" name="sharechk" id= "sharechk" class="checkbox-share">
								<span class="checkbox-share-txt">나눔</span>
							</div>
							<div class="checkbox-price-wrap">
								<input type="text" name="price"  id = "price" class="checkbox-price-input" style= "text-align:right" 
											oninput = "this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								<span class="checkbox-price-txt">원</span>
							</div>
						</div>
						
			</div>
			<div class="write-center-wrap">
				<input type="text" name="text" class="write-title-input" placeholder="제목을 입력해주세요">
				<div class="img-wrap">
					<div class="write-imgs-upload-wrap">
						<input type="file" class="imgs-upload" accept="image/*" required multiple>
						<label class="upload">
							<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
							  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
							</svg>
							<div class="imgs-cnt">
								<span>0</span>
								<span>/10</span>
							</div>
						</label>
					</div>
					<div class="write-imgs-wrap">
						<div class="imgs-preview">
							<div class="write-imgs">
								<img class="add-imgs" src="" alt="이미지">
							</div>
							<svg  class="cancel-img" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" viewBox="0 0 16 16">
								 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
							<div class="thumbnail-img">대표 사진</div>
						</div>
						<div class="imgs-preview">
							<div class="write-imgs">
								<img class="add-imgs" src="" alt="이미지">
							</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="cancel-img" viewBox="0 0 16 16">
								 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
						</div>
						<div class="imgs-preview">
							<div class="write-imgs">
								<img class="add-imgs" src="" alt="이미지">
							</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="cancel-img" viewBox="0 0 16 16">
								 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
						</div>
						<div class="imgs-preview">
							<div class="write-imgs">
								<img class="add-imgs" src="" alt="이미지">
							</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="cancel-img" viewBox="0 0 16 16">
								 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
						</div>
						<div class="imgs-preview">
							<div class="write-imgs">
								<img class="add-imgs" src="" alt="이미지">
							</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="cancel-img" viewBox="0 0 16 16">
								 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
						</div>
						<div class="imgs-preview">
							<div class="write-imgs">
								<img class="add-imgs" src="" alt="이미지">
							</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="cancel-img" viewBox="0 0 16 16">
								 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
						</div>
						<div class="imgs-preview">
							<div class="write-imgs">
								<img class="add-imgs" src="" alt="이미지">
							</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="cancel-img" viewBox="0 0 16 16">
								 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
						</div>
						<div class="imgs-preview">
							<div class="write-imgs">
								<img class="add-imgs" src="" alt="이미지">
							</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="cancel-img" viewBox="0 0 16 16">
								 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
						</div>
						<div class="imgs-preview">
							<div class="write-imgs">
								<img class="add-imgs" src="" alt="이미지">
							</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="cancel-img" viewBox="0 0 16 16">
								 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
						</div>
						<div class="imgs-preview">
							<div class="write-imgs">
								<img class="add-imgs" src="" alt="이미지">
							</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="cancel-img" viewBox="0 0 16 16">
								 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
						</div>
					</div>
				</div>
				<textarea rows="30" name="textarea" class="contents-txtarea" placeholder="내용을 입력해주세요"></textarea>
			</div>
			<div class="register-write">
				<a class="report-btn-link" href="../../product/jsp/user_seller_product.jsp">
					<button type="button" class="report-btn">등록하기</button>
				</a>
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