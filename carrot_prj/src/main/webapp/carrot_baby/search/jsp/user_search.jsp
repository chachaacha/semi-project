<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_search.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

/* 필터 접고 펴는 기능 */
$(function(){
	$(".category-button").click(function() {
		$(".category-list-wrap").toggle();
		$(".category-button .down-img").toggleClass("down-img-change");
	})
	
	$(".sort-button").click(function() {
		$(".sort-list-wrap").toggle();
		$(".sort-button .down-img").toggleClass("down-img-change");
	})
	
	$(".price-button").click(function() {
		$(".price-list-wrap").toggle();
		$(".price-button .down-img").toggleClass("down-img-change");
	})
	
	$(".price-list-input").click(function() {
		$(".ant-space-item").show();
	})
	
	$(".price-list").click(function() {
		$(".ant-space-item").hide();
	})
});

</script>
</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">
	<div class="test">
	<div class="content">
		<h1 class="content-head-title">중고거래 매물</h1>
	
		<div class="content-wrap">
		
			<!-- 왼쪽 필터 영역  -->
			<div class="filter"> 
				<div class="filter-text">필터</div>
					
					<div class="category">
						<button type ="button" class="category-button">
							<div class="category-title">카테고리</div>
							<span role="img" aria-label="down" class="anticon anticon-down">
								<svg class="down-img" viewBox="64 64 896 896" focusable="false" data-icon="down" width="1em" height="1em" fill="currentColor" aria-hidden="true">
									<path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z">
									</path>
								</svg>
							</span>
						</button>
						<div class="category-list-wrap">
							<div>
								<div class="category-list">
									<a href="#void">
										<div class="category-list-text">전체</div>
									</a>
								</div>
								<div class="category-list">
									<a href="#void">
										<div class="category-list-text">출산/육아용품</div>
									</a>
								</div>
								<div class="category-list">
									<a href="#void">
										<div class="category-list-text">유아동안전/실내용품</div>
									</a>
								</div>
								<div class="category-list">
									<a href="#void">
										<div class="category-list-text">유아동의류</div>
									</a>
								</div>
								<div class="category-list">
									<a href="#void">
										<div class="category-list-text">유아동잡화</div>
									</a>
								</div>
								<div class="category-list">
									<a href="#void">
										<div class="category-list-text">유아동가구</div>
									</a>
								</div>
								<div class="category-list">
									<a href="#void">
										<div class="category-list-text">유아동교구/완구</div>
									</a>
								</div>
								<div class="category-list">
									<a href="#void">
										<div class="category-list-text">기타 유아동용품</div>
									</a>
								</div>
							</div>
						</div> 
					</div>
						
					<div class="sort">
						<button type ="button" class="sort-button">
							<div class="sort-title">정렬</div>
							<span role="img" aria-label="down" class="anticon anticon-down">
								<svg class="down-img" viewBox="64 64 896 896" focusable="false" data-icon="down" width="1em" height="1em" fill="currentColor" aria-hidden="true">
									<path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z">
									</path>
								</svg>
							</span>
						</button>
						<div class="sort-list-wrap">
							<div>
								<div class="sort-list">
									<label class="sort-radio-wrap">
										<span class="sort-radio">
											<input type="radio" name="sort-radio" class="input-radio" checked="checked">
										</span>
										<span>최신순</span>
									</label>
								</div>
								<div class="sort-list">
									<label class="sort-radio-wrap">
										<span class="sort-radio">
											<input type="radio"  name="sort-radio" class="input-radio">
										</span>
										<span>과거순</span>
									</label>
								</div>
								<div class="sort-list">
									<label class="sort-radio-wrap">
										<span class="sort-radio">
											<input type="radio" name="sort-radio" class="input-radio">
										</span>
										<span>인기순</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					
					<div class="price">
						<button type ="button" class="price-button">
							<div class="price-title">가격</div>
							<span role="img" aria-label="down" class="anticon anticon-down">
								<svg class="down-img" viewBox="64 64 896 896" focusable="false" data-icon="down" width="1em" height="1em" fill="currentColor" aria-hidden="true">
									<path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z">
									</path>
								</svg>
							</span>
						</button>
						<div class="price-list-wrap">
							<div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" class="input-radio" checked="checked">
										</span>
										<span>전체가격</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" class="input-radio">
										</span>
										<span>나눔</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" class="input-radio">
										</span>
										<span>5,000원 이하</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" class="input-radio">
										</span>
										<span>5,000원 - 1만원 이하</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" class="input-radio">
										</span>
										<span>1만원 - 5만원 이하</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" class="input-radio">
										</span>
										<span>5만원 - 10만원 이하</span>
									</label>
								</div>
								<div class="price-list">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" class="input-radio">
										</span>
										<span>10만원 이상</span>
									</label>
								</div>
								<div class="price-list-input">
									<label class="price-radio-wrap">
										<span class="price-radio">
											<input type="radio" name="price-radio" class="input-radio">
										</span>
										<span>직접입력</span>
									</label>
								</div>
								<div class="ant-space-item">
									<form><div class="ant-space-item-input">
											<input type="tel" name="minPrice" placeholder="최저가" class="ant-input" value="">
											<span>~</span>
											<input type="tel" name="maxPrice" placeholder="최고가" class="ant-input" value="">
										</div>
										<button type="submit" class="input-btn">적용</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			
			<!-- 오른쪽 매물 리스트 영역 -->
			<div class="content-list-wrap">
			
				<!-- 오른쪽 매물 위 -->
				<div class="content-list-top">
					<div class="content-list-top-left">전체 카테고리(수치)</div>
					<div class="content-list-top-right">
						<div class="content-list-top-right-text">서울특별시</div>
						<select name="region" class="hot-articles-nav-select">
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
				</div>
				
				<!-- 오른쪽 매물 가운데 -->
				<div class="content-list-middle">
					<div class="card">
						<a class="card-link" href="../../product/jsp/user_buyer_product.jsp"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
					<div class="card">
						<a class="card-link" href="#void"><!-- 거래창 연결 링크 필요 -->
							<div class="card-photo">
								<img alt="이미지 자리" src="#void">
							</div>
							<div class="card-desc">
								<h2 class="card-title">글제목</h2>
								<div class="card-price">가격</div>
								<div class="card-region-name">지역(시 구까지만 동 x)</div>
							</div>
							<div class="card-counts">
								<span> 하트 0 </span>
								ㆍ
								<span> 채팅 0 </span>
							</div>
						</a>
					</div>
				</div>
				
				<!-- 오른쪽 매물 하단 글쓰기 버튼 -->
				<div class="write-bottom">
					<div class="write-bottom-wrap">
                   	 <a href="user_write.jsp" class="write-bottom-btn">
                   	 <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 48 48" data-svg-content="true" fill="rgb(255, 255, 255)">
                   	 <path d="M35.5 14L28 6.5l-20 20V34h7.5l20-20zm5.91-5.91c.78-.78.78-2.05 0-2.83L36.74.59c-.78-.78-2.05-.78-2.83 0L30 4.5l7.5 7.5 3.91-3.91z"></path>
                   	 <path fill-opacity=".36" d="M0 40h48v8H0z">
                   	 </path></svg>
                   	 글쓰기</a>
            		</div>
				</div>
				
				<!-- 오른쪽 매물 하단 페이지 버튼 -->
				<div class="page-bottom">
					<div class="page-bottom-icon-click">
						<a href="user_search.jsp">1</a>
					</div>
					<div class="page-bottom-icon">
						<a href="#void">2</a>
					</div>
					<div class="page-bottom-icon">
						<a href="#void">3</a>
					</div>
					<div class="page-bottom-icon">
						<a href="#void">4</a>
					</div>
						<div class="page-bottom-next">&gt;</div>
				</div>
				
			</div>
			
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