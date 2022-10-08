<%@page import="userVO.PostVO"%>
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
<jsp:useBean id="pVO" class="userVO.PostVO" scope="page"/>
<jsp:setProperty property="*" name="pVO"/>
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
	
	$("")
	
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
	
	(/* Closure를 활용한 접근제한 변경.  */
			//첫 번째 매개변수 att_zone은 첨부될 이미지 들이 표시될 영역을 나타내는 div의 id 값
			//두 번째 매개변수는 file 태그의 id 값
			imageView = function imageView(att_zone, btn) {
				/* 함수 내에서 사용될 변수 선언 시작. */				
				
				//div(att_zone)의 태그를 얻기 위한 attZone 변수
				var attZone = document.getElementById(att_zone);
				//file(btn)의 태그의 얻기 위한 btnAtt 변수
				var btnAtt = document.getElementById(btn);
				//첨부된 파일의 목록을 저장할 변수
				var sel_files = [];
				
				/* 함수 내에서 사용될 변수 선언 끝. */
				
				/* //이미지와 체크 박스를 감싸고 있는 div 속성(z-index:1)
				var div_style = "display:inline-block; position:relative; "
								+ "width:150px; height:120px; margin:5px; border:1px solid #00f; z-index:1;";
				
				//미리보기 이미지 속성(z-index)
				var img_style = "width:100%; heigth:100%; z-index:none;"; 
				
				
				//이미지 안에 표시되는 체크박스의 속성
				var chk_style = "width:30px; heigth:30px; position: absolute; font-size:24px; "
								+ "rigth:0px; bottom:0px; z-index:999; background-color:rgba(255,255, 255, 0.1); color:#f00; "; */
				//이미지와 체크 박스를 감싸고 있는 div 속성(z-index:1)				
				var div_style = 'display:inline-block; position:relative; '
					            + 'width:120px; height:120px; margin:5px; border:1px; z-index:1; border-radius:20px; overflow-hidden; ';
				
				//미리보기 이미지 속성(z-index)
				var img_style = 'width:100%;height:100%;z-index:none';
				//이미지 안에 표시되는 체크박스의 속성	    
				var chk_style = 'width:25px;height:25px;position:absolute; '
					            + 'right:0px;top:0px;z-index:999';
				
				/* file 태그 상태가 바뀌었을 때(파일을 선택 했을 때) 시작 */
				//multiple 속성의 file 태그로부터 n개의 이미지를 전달받아 각각의 이미지를 읽어
				//화면에 표시해 주는 imageLoader() 함수 호출
				btnAtt.onchange = function( e ) {
					//이벤트가 발생한 타겟 파일 반환
					var files = e.target.files;
					//Array.prototype.slice.call을 사용하여 새로운 Array로 변환
					var fileArr = Array.prototype.slice.call(files);
					for( f of fileArr ){//이터러블 순회 적용 : for of로 fileArr 배열 안에 있는 f을 순회한다.
						//이미지 미리보는 함수
						imageLoader(f);
					}//end for
				}//btnAtt.onchange
				/* file 태그 상태가 바뀌었을 때(파일을 선택 했을 때) 끝 */
				
				/* 드래그앤 드롭 사용 시작 */
				//탐색기 등에서 파일이 드롭되었을 때 처리되는 부분
				//이 부분이 없으면 브라우저에 이미지가 드롭될 시 브라우저가 이미지 정보를 인식할 수 있기 때문에
				//그냥 브라우저에 표시된다. 이벤트 처리를 해줘야 한다.
				attZone.addEventListener("dragenter", function(e) {
					//창을 새로고침 실행
					e.preventDefault();
					//이벤트가 연속하여 발생하는 버블현상 제거
					e.stopPropagation();
				}, false);
				
				attZone.addEventListener("dragover", function(e) {
					//창을 새로고침 실행
					e.preventDefault();
					//이벤트가 연속하여 발생하는 버블현상 제거
					e.stopPropagation();
				}, false);
				
				attZone.addEventListener("drop", function(e) {
					//배열 생성
					var files = {};
					//창을 새로고침 실행
					e.preventDefault();
					//이벤트가 연속하여 발생하는 버블현상 제거
					e.stopPropagation();
					var dt = e.dataTransfer;
					files = dt.files;
					for(f of files){
						imageLoader(f);
					}//end for
				}, false);
				
				/* 드래그앤 드롭 사용 시작 끝 */
				
				
				
				/* 첨부된 이미지를 배열에 넣고 미리 보기 시작. */
				//file 태그에 의해 전달된 파일 하나하나를 sel_files에 추가한 후 이미지와 버튼을 추가하여 
				//하나의 div를 만들어 반환하는 함수 makeDiv() 함수를 호출하여 그 결과를 att_zone에 추가한다.
				imageLoader = function(file) {
					//file 태그에 의해 전달된 파일을 sel_files에 추가
					sel_files.push(file);
					//FileReader
					var reader = new FileReader();
					
					//reader의 onload
					reader.onload = function(ee) {
						//img 요소를 만들어 반환
						let img = document.createElement("img");
						//img의 style = "img_style"
						img.setAttribute("style", img_style)
						//img의 src =""
						img.src = ee.target.result;
						//attZone의 자식div만들어 img와 file를 넣음
						attZone.appendChild( makeDiv(img, file) );
					}//reader
					
					//file을 읽어오는 역할
					reader.readAsDataURL(file);
					
				}//imageLoader
				/* 첨부된 이미지를 배열에 넣고 미리 보기 끝. */
				
				/* 선택된 파일을 삭제할 때 시작. */
				//추가할 div 태그를 생성하고, 전달받은 이미지를 div에 추가
				//전달받은 파일 정보를 사용하여 삭제 기능을 하는 button 태그를 만들어 div에 붙임.
				//만들어진 삭제 버튼이 클릭되면 div와 sel_files에서 관련 정보를 삭제하는 코드
				makeDiv = function(img, file) {
					//div 요소를 만들어 반환
					var div = document.createElement("div");
					//div의 stlye = "div_style"
					div.setAttribute("style", div_style)
					
					//input 요소를 만들어서 반환
					var btn = document.createElement("input");
					//input의 type = "button"
					btn.setAttribute("type", "button");
					//input의 class = "btn-close"
					btn.setAttribute("class", "btn-close");
					//input의 aria-label = "Close"
					btn.setAttribute("aria-label", "Close");
					//input의 delFile = "file.name"
					btn.setAttribute("delFile", "file.name");
					//input의 style = "chk_style"
					btn.setAttribute("style", chk_style);
					//btn의 onclick
					
					btn.onclick = function(ev) {
						//이벤트가 발생한 개체를 반환/설정
						var ele = ev.srcElement;
						//deFile요소 반환
						var delFile = ele.getAttribute("delFile");
						
						//sel_files의 길이만큼 반복
						for( var i = 0; i < sel_files.length; i++ ){
							if( delFile == sel_files[i].name ){
								//i번 index에서 1개 요소 제거
								sel_files.splice(i, 1);
							}//end if
						}//end for
						
						//드래그되는 데이터 유지
						dt = new DataTransfer();
						//key 값에 접근하는 반복문
						for(f in sel_files) {
							var file = sel_files[f];
							//리스트에 추가
							dt.items.add(file);
						}//end for
						
						btnAtt.files = dt.files;
						//ele의 부모 반환
						var p = ele.parentNode;
						//p자식 제거
						attZone.removeChild(p);
					}//btn.onclick
					
					//div에 자식으로 img붙임
					div.appendChild(img);
					//div에 자식으로 btn붙임
					div.appendChild(btn);
					return div;
					
				}//makeDiv
				/* 선택된 파일을 삭제할 때 끝. */
				
			}//imageView
	)("att_zone", "btnAtt")
	$("#my-button").click(function(){
	
		onClickUpload();
	});
	
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
		//PostDAO와 연결
		PostDAO pDAO = PostDAO.getInstance();
		//VO 리스트로 받기
		List<LocVO> locCatList = pDAO.selectLoc();
		List<CatVO> pCatList = pDAO.selectCat();
		List<PostVO> pdList = pDAO.selectPost(pVO);
		//scope 객체 설정
		request.setAttribute("loc_cat", locCatList);
		request.setAttribute("p_cat", pCatList);
		
		List<LocVO> listLoc = (List<LocVO>)request.getAttribute("loc_cat");
		List<CatVO> listCat = (List<CatVO>)request.getAttribute("p_cat");
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
		<form name="writePost" id="writePost" method="get" action="user_write_process.jsp">
		<input type="hidden" id="proudct_idx" name="product_idx" value=""/>
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">서울특별시</div>
						<select id="category_loc"name="category_loc" class="write-select" >
							<option value="0">동네를 선택하세요</option>
						<%for(LocVO lVO : listLoc ) { %><!-- 향상된 for문으로 listLoc 출력 -->
							<option value = "<%=lVO.getGu_idx() %>"><%=lVO.getGu() %></option>
						<%}//end for %>
						</select>
			</div>
			<div class="write-sel-wrap">
						<div class="write-sel-wrap-text">카테고리</div>
						<select id ="category_pd" name="category_pd" class="write-select">
							<option value="0">카테고리를 선택하세요</option>
							<%for(CatVO cVO : listCat) {%><!-- 향상된 for문으로 listCat 출력 -->
								<option value = "<%= cVO.getCategory_idx()%>"><%= cVO.getCategory() %></option>
							<%}//end for %>
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
				<textarea rows="30" name="contents" id="contents" class="contents-txtarea" placeholder="내용을 입력해주세요"></textarea>
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