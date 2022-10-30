<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
var cnt = 2;
var minAppend=1;
$(function() {	
	
	$("#pushBtn").click(function() {
		//유효성 검사.
		chkNull();
	});//click
	
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
	
	$("#btnAdd").click(function() {
		/* if(){
			alert("썸네일을 등록");
			return;
		} */
		//$("#inputWrap").last().append("<div>a</div>");//자식으로 삽입
		//$("#inputWrap").first().append("<div>a</div>");
		var outDiv = "<div class='imginput-wrap'><label class='filelabel' for='post_img"+ (cnt+1) +"'>사진" + cnt + " 업로드</label>" 
		+ " <input type = 'file' name = 'post_img"+ ++cnt +"' id = 'post_img"+ cnt +"' class='inputBox' onchange='readURL(this,"+ (cnt-1) +");'/>"
		+ "<img class='imginput' id='preview"+ (cnt-1) +"' name='preview"+ (cnt-1) +"'/></div>";
		$("#inputWrap").append(outDiv);
		++minAppend;
		
		if( cnt == 7 ){
			alert("이미지는 6개까지 추가할 수 있습니다.");
			$("#inputWrap div").last().remove();
			cnt--;
			--minAppend;
			return;
		}
		
	});
	$("#btnRemove").click(function() {
		if(minAppend == 1){
			alert("더 이상 삭제하실 수 없습니다.");
			return;
		}
		$("#inputWrap div").last().remove();
		cnt--;
		if( cnt == -1 ){ cnt = 0; };
		--minAppend;
	});
	
});//ready

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
	for(var i=1; i<cnt+1; i++ ){
		var thu = $("#post_img"+i).val();
		if( !thu ){
		alert("이미지를 첨부해 주세요");
		return;
		}//end if
	}//end for
	
	$("input[name=count]").attr("value",cnt);
	var comTxt=$("#contents").val().replace(/(?:\r\n|\r|\n)/g, "<br>");
	$("#contents").val(comTxt);
	$("#writePost").submit();
	/* document.location.href="user_search.jsp"; */
}//chkNull

function readURL(input ,cnt) {
		 
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview'+cnt).src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
		  
	    document.getElementById('preview'+cnt).src = "";
	  }
	  if(!/\.(jpeg|jpg|png|gif|bmp)$/i.test(input.value)){ 

	        alert('이미지 파일만 업로드 가능합니다.'); 

	        input.value = ''; 

	        input.focus(); 
	        return;
	    }
	}

</script>
</head>
<body>
<%
String user_id =(String)session.getAttribute("id");
if(user_id==null) {
%>
<c:redirect url="../../mainhome/jsp/user_mainhome.jsp"/>
<%
}
		//PostDAO와 연결
		PostDAO pDAO = PostDAO.getInstance();
		//VO 리스트로 받기
		List<LocVO> lVOList = pDAO.selectLoc();
		List<CatVO> pCatList = pDAO.selectCat();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyMMdd");
		Date now = new Date();        
		String nowTime = sdf1.format(now);
		int ran = (int)((Math.random()*10000));
		String ran1= String.format("%04d", ran);
		String productIDX = nowTime+ran1;
		String idx_chk=pDAO.selectIdx(productIDX);
		String product_idx="";
		
		if( idx_chk == null){
			product_idx = productIDX;
		} else{
			while( true ){
			ran = (int)((Math.random()*10000));
			ran1= String.format("%04d", ran);
			productIDX = nowTime+ran1;
			idx_chk=pDAO.selectIdx(productIDX);
				if( idx_chk != null ){
					product_idx = productIDX;
					break;
				}//end if
			}//end while
		}//end else
		
		pageContext.setAttribute("lVOList", lVOList);
		pageContext.setAttribute("cVOList", pCatList);
		
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
		<form name="writePost" id="writePost"  action="user_write_process.jsp" enctype="multipart/form-data" method="post">
		<input type="hidden" name="user_id" id="user_id" value="<%= user_id %>">
		<input type="hidden" name="product_idx" id="product_idx" value="<%= product_idx%>"/>
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">서울특별시</div>
						<select id="category_loc"name="category_loc" class="write-select" >
							<option value="0">동네를 선택하세요</option>
						<c:forEach var="lVO" items="${ lVOList }">
									<option value="${lVO.gu_idx}">${lVO.gu}</option>
							</c:forEach>
						</select>
			</div>
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">카테고리</div>
						<select id ="category_pd" name="category_pd" class="write-select">
							<option value="0">카테고리를 선택하세요</option>
							<c:forEach var="cVO" items="${ cVOList }">
									<option value="${cVO.category_idx}">${cVO.category}</option>
							</c:forEach>
						</select>
			</div>
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">판매가격</div>
						<div class="write-sel-wrap-right">
						<c:if test=""></c:if>
							<div class="checkbox-share-wrap">
								<input type="checkbox" name="free" id= "free" value="Y"class="checkbox-share">
								<span class="checkbox-share-txt">나눔</span>
							</div>
							<div class="checkbox-price-wrap">
								<input type="text" name="price"  id = "price" class="checkbox-price-input" style= "text-align:right" 
											oninput = "this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="8">
								<span class="checkbox-price-txt">원</span>
							</div>
						</div>
			</div>
			<div class="write-center-wrap">
				<input type="text" name="title" id="title" class="write-title-input" placeholder="제목을 입력해주세요">
				<div class="img-wrap">
					<div class="write-imgs-upload-wrap">
						<div class="filebtn-wrap">
						<input type="hidden" name="count" value=""/>
						<button type = "button" value = "추가" class = "inputBtn filebtn" id = "btnAdd">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi" viewBox="0 0 16 16">
							  <path d="m.5 3 .04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.683.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
							  <path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 1 1 0 1H14v1.5a.5.5 0 1 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
							</svg>
						</button>
						<button type = "button" value = "삭제" class = "inputBtn filebtn" id = "btnRemove">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi" viewBox="0 0 16 16">
							  <path d="m.5 3 .04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.683.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
							  <path d="M11 11.5a.5.5 0 0 1 .5-.5h4a.5.5 0 1 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
							</svg>
						</button>
						</div>
						<div id = "inputWrap" class="inputwrap-wrap">
						<div class="imginput-wrap">
						<label class="filelabel" for="post_img1">대표사진 업로드</label>
						<input type="file" name="post_img1" id = "post_img1" class="inputBox" onchange="readURL(this,0);" />
						<img id="preview0" class="imginput"/>
						</div>
						<div class="imginput-wrap">
						<label class="filelabel" for="post_img2">사진1 업로드</label>
						<input type="file" name="post_img2" id="post_img2" class="inputBox" onchange="readURL(this,1);"/>
						<img id="preview1" class="imginput"/>
						</div>
						</div>
					</div>
				</div>
				<textarea rows="30" name="contents" id="contents" class="contents-txtarea" placeholder="내용을 입력해주세요" ></textarea>
			</div>
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