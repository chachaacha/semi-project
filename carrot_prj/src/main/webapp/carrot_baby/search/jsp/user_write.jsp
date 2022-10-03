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
	
})
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
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">서울특별시</div>
						<select name="region" class="write-select">
							<option value="">동네를 선택하세요</option>
							<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강북구">강북구</option>
							<option value="강서구">강서구</option>
							<option value="관악구">관악구</option>
							<option value="광진구">광진구</option>
							<option value="구로구">구로구</option>
							<option value="금천구">금천구</option>
							<option value="노원구">노원구</option>
							<option value="도봉구">도봉구</option>
							<option value="동대문구">동대문구</option>
							<option value="동작구">동작구</option>
							<option value="마포구">마포구</option>
							<option value="서대문구">서대문구</option>
							<option value="서초구">서초구</option>
							<option value="성동구">성동구</option>
							<option value="성북구">성북구</option>
							<option value="송파구">송파구</option>
							<option value="양천구">양천구</option>
							<option value="영등포구">영등포구</option>
							<option value="용산구">용산구</option>
							<option value="은평구">은평구</option>
							<option value="종로구">종로구</option>
							<option value="중구">중구</option>
							<option value="중랑구">중랑구</option></select>
			</div>
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">카테고리</div>
						<select name="region" class="write-select">
							<option value="">카테고리를 선택하세요</option>
							<option value="출산/육아용품">출산/육아용품</option>
							<option value="유아동안전/실내용품">유아동안전/실내용품</option>
							<option value="유아동의류">유아동의류</option>
							<option value="유아동잡화">유아동잡화</option>
							<option value="유아동가구">유아동가구</option>
							<option value="유아동교구/완구">유아동교구/완구</option>
							<option value="기타 유아동용품">기타 유아동용품</option>
						</select>
			</div>
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">판매가격</div>
						<div class="write-sel-wrap-right">
							<div class="checkbox-share-wrap">
								<input type="checkbox" name="checkbox" class="checkbox-share">
								<span class="checkbox-share-txt">나눔</span>
							</div>
							<div class="checkbox-price-wrap">
								<input type="text" name="text" class="checkbox-price-input">
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