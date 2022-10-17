<%@page import="java.util.ArrayList"%>
<%@page import="userVO.ImgVO"%>
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
var cnt = 2;
var minAppend=1;
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
	
	$("#btnAdd").click(function() {
		/* if(){
			alert("썸네일을 등록");
			return;
		} */
		//$("#inputWrap").last().append("<div>a</div>");//자식으로 삽입
		//$("#inputWrap").first().append("<div>a</div>");
		var outDiv = "<div><label>사진" + cnt + "<label>" 
		+ " <input type = 'file' name = 'post_img"+ ++cnt +"' class='inputBox' onchange='readURL(this,"+ (cnt-1) +");'/><br/>"
		+ "<img id='preview"+ (cnt-1) +"' name='preview"+ (cnt-1) +"'/></div>";
		$("#inputWrap").append(outDiv);
		++minAppend;
		
		if( cnt ==10 ){
			alert("이미지를 10개 이상 추가 할 수 없습니다.");
			return;
		}
		
	});
	$("#btnRemove").click(function() {
		if(minAppend == 1){
			alert("더 이상 삭제하실 수 없습니다.");
			return;
		}
		$("#inputWrap div").last().remove();
		--cnt;
		if( cnt == -1 ){ cnt = 0; };
		--minAppend;
	});
});//ready

function imgClick() {
	document.getElementById("#btnAdd").click();
}


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
	
	for(var i=0; i<cnt; i++){
		var thu = $("#preview"+i).attr("src");
		if(thu == undefined ){
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
	    }
	}
</script>
</head>
<body>
<%
String user_id =(String)session.getAttribute("id");

		PostVO pVO = new PostVO();
		PostVO ppVO = new PostVO();
		String product_idx= request.getParameter("product_idx");
		pVO.setProduct_idx(product_idx);
		pVO.setId(user_id);
		//PostDAO와 연결
		PostDAO pDAO = PostDAO.getInstance();
		//VO 리스트로 받기
		List<LocVO> lVOList = pDAO.selectLoc();
		pageContext.setAttribute("lVOList", lVOList);
		List<CatVO> pCatList = pDAO.selectCat();
		pageContext.setAttribute("cVOList", pCatList);
		ppVO = pDAO.selectPost(pVO);
		List<ImgVO> list_img = new ArrayList<ImgVO>();
		list_img = pDAO.selectImg(product_idx);
		
		
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
		<form name="writePost" id="writePost" method="post" action="user_writeUp_process.jsp" enctype="multipart/form-data">
		<input type="hidden" id="uploadImgSize" name="uploadImgSize" value="<%= list_img.size() %>"/>
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
								<%if("Y".equals(free1)) {%> checked="checked" <%} %>>
								<span class="checkbox-share-txt">나눔</span>
							</div>
							<div class="checkbox-price-wrap">
								<input type="text" name="price"  id = "price" class="checkbox-price-input" style= "text-align:right" 
											oninput = "this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="8" value ="<%= price %>">
								<span class="checkbox-price-txt">원</span>
								
								<%if("Y".equals(free1)) {%> 
								<script type="text/javascript">
								$("#price").prop("readonly",true);
								$("#price").css("background", "#ccc");
								
								</script>
								 <%} %>
								
								
							</div>
						</div>
			</div>
			<div class="write-center-wrap">
				<input type="text" name="title" id="title" class="write-title-input" placeholder="제목을 입력해주세요" value ="<%= title %>">
				<div class="img-wrap">
					<div class="write-imgs-upload-wrap">
					<input type="hidden" name="count" value=""/>
					<div id = "inputWrap">
					<input type = "button" value = "추가" class = "inputBtn" id = "btnAdd" />
					<input type = "button" value = "삭제" class = "inputBtn" id = "btnRemove" />
					<div>
					<label>대표사진</label>
					<input type="file" name="post_img1" id="post_img1" class="inputBox" onchange="readURL(this,0);"/>
					<input type="hidden" value="<%= list_img.get(0).getProduct_img()%>" id="chk_img0" name="chk_img0"/>
					<br/>
					<img id="preview0" src="../image/<%= list_img.get(0).getProduct_img()%>"/>
					</div>
					<div>
					<label>사진 1</label>
					<input type="file" name="post_img2" id="post_img2"class="inputBox" onchange="readURL(this,1);"/>
					<input type="hidden" value="<%= list_img.get(1).getProduct_img()%>" id="chk_img1" name="chk_img1"/>
					<br/>
					<img id="preview1" src="../image/<%= list_img.get(1).getProduct_img()%>" />
					</div>
					<%if(2 < list_img.size() ) {%>
					<%for(int i =2; i<list_img.size(); i++) {%>
					<div>
					<label>사진 <%= i %></label>
					<input type="file" name="post_img<%= i+1 %>" class="inputBox" onchange="readURL(this,<%= i %>);"/>
					<input type="hidden" value="<%= list_img.get(i).getProduct_img()%>" id="chk_img<%= i %>" name="chk_img<%= i %>"/>
					<br/>
					<img id="preview<%= i %>" src="../image/<%= list_img.get(i).getProduct_img()%>" >
					</div>
					<script type="text/javascript">
					++cnt
					++minAppend;
					</script>
					<%}//end for %>
					<%}//end if %>
					</div>
					</div>
					<%
		   				pageContext.setAttribute("crcn", "\r\n");
		   				pageContext.setAttribute("br", "<br>");
						pageContext.setAttribute("contents", contents);
		   			%>
				</div>	
				<textarea rows="30" name="contents" id="contents" class="contents-txtarea" placeholder="내용을 입력해주세요"   ><c:out value=" ${fn:replace(contents,br,crcn) }" escapeXml="false"/></textarea>
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