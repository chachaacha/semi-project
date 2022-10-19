<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="userVO.MyInfoVO"%>
<%@page import="userDAO.MyInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_myinfo_edit.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 다음우편번호API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 이메일 입력 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
//프로필사진 등록 미리보기
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        $('#myImg').attr('src', e.target.result);
        $("#deleteChk_img").attr("value", "Y");
        
        }
        reader.readAsDataURL(input.files[0]);
    }
}


//프로필사진 등록 삭제
function deleteFile() {
 	$("#myImg").attr("src", "../../user_profile_upload/profileImg.png");
 	$("#deleteChk_img").attr("value", "Y");
}

/* //전화번호 하이픈입력
//oninput="autoHyphen(this)" 
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
} */

//이메일 입력방식 선택
function selectEmail(ele){
    var $ele = $(ele);
    var $email1 = $('input[name=email1]');

    // '1'인 경우 직접입력
    if($ele.val() == "1"){
        $email1.attr('readonly', false);
        $email1.val('');
    } else {
        $email1.attr('readonly', true);
        $email1.val($ele.val());
    }
}

//우편번호 검색
function zipcodeapi() {
	 new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var roadAddr = data.roadAddress; // 도로명 주소 변수
             var extraRoadAddr = ''; // 참고 항목 변수

             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraRoadAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraRoadAddr !== ''){
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById("zipcode").value = data.zonecode;
             document.getElementById("addr1").value = roadAddr;
             document.getElementById("addr2").focus();
         }//oncomplete
    }).open();
}

$(function(){
	$("#btn").click(function(){
		$("#infoEditFrm").submit();
	});
	
	 $("#upfile").on('change', function(){
		 readURL(this);
	});
	 $("#deleteImg").click(function() {
		 deleteFile();
	});
	 
});//ready
</script>

</head>
<% 
// 세션 만료시 로그인화면으로 이동
	if(session.getAttribute("id")==null) {
		response.sendRedirect("../../login/jsp/user_login.jsp");
	}
%>
<body>
<%
//Post 요청 방식
request.setCharacterEncoding("UTF-8");

String id = (String)session.getAttribute("id");

/* if(id==null){
   response.sendRedirect("../../login/jsp/user_login.jsp");
} */

//web.xml에 저장된 암호화된 key를 불러온다.
ServletContext sc=getServletContext();
String key=sc.getInitParameter("userKey");

//저장된 내 정보 불러오기
MyInfoDAO miDAO = MyInfoDAO.getInstance(key);
MyInfoVO miVO = miDAO.selectInfo(id);
%>
	<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

		<!-- container -->
		<div class="container">

			<%@ include file="myinfo_navi.jsp" %>

				<form action="user_myinfo_edit_process.jsp" enctype="multipart/form-data" method="post" id="infoEditFrm">
				<!-- 내정보수정  -->
				<div class="title">내 정보 수정</div>
				<!-- 정보 작성 폼 -->
				<div class="writeForm">
					<table>
						<tr>
							<th><label for="id">프로필 사진</label></th>
							<td>
								<div class="profile">
									<div>
										<img src="../../user_profile_upload/<%= miVO.getImg() %>" id="myImg" name="myImg" style="margin: 5px 30px; width: 70px; height: 70px; background: #f8edeb; border-radius: 50%;">
										<input type="hidden" id="chk_img" name="chk_img" value="<%= miVO.getImg() %>"/>
										<input type="hidden" id="deleteChk_img" name="deleteChk_img" value="N"/>
										
									</div>
									
									<div>
										<div class="upload-btn-wrapper">
											<input type="button" class="formBtn" style="padding: 8px 20px;" value="사진등록">
											<input type="file" name="upfile" id="upfile" style="padding: 8px 20px; cursor: pointer;" />
											<input type="button" value="삭제" id="deleteImg" class="formBtn" style="margin: 5px 5px; padding: 8px 20px; cursor: pointer;">
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th><label>성명</label></th>
							<td><input type="text" value="<%=miVO.getName() %>" id="name" class="inputTxt inputName" readonly="readonly" /></td>
						</tr>
						<tr>
							<th><label>별명</label></th>
							<td><input type="text" value="<%=miVO.getNick() %>"	id="nick" name="nick" class="inputTxt inputNickName" /></td>
						</tr>
						<tr>
							<th><label>아이디</label></th>
							<td><input type="text" value="${ id }" name="id" id="id" class="inputTxt inputIdtype" maxlength="20" readonly="readonly" /></td>
						</tr>
						<tr>
							<th scope="row"><label>생년월일</label></th>
							<td><input type="date" name="birth" id="birth" value="<%=miVO.getBirth() %>" readonly="readonly" /></td>
						</tr>
						<tr>
							<th><label>휴대폰</label></th>
							<td><input type="text" name="phone_num" id="phone_num" value="<%=miVO.getPhone_num() %>" readonly="readonly"/>
								<span class="label_wrap"><input type="checkbox" id="sms_chk" name="sms_chk" value="Y" style="cursor: pointer;" <%if(miVO.getSms_chk().equals("Y")) {%> checked="checked" <%} %> />
								<label>SMS 수신동의</label></span></td>
						</tr>
						<%
						//이메일은 암호화 되어있기 때문에 복호화해서 가져와야 한다.
						DataDecrypt dd = new DataDecrypt(DataEncrypt.messageDigest("SHA-1", key));
						
						%>
						<tr>
							<th><label>이메일</label></th>
							<td class="mail_type">
							<input type="text" value="<%=dd.decryption(miVO.getEmail()) %>" name="email" id="email" class="inputEmail" maxlength="100" />
							<span class="label_wrap"><input type="checkbox" id="email_chk" name="email_chk" value="Y" style="cursor: pointer;" <%if(miVO.getEmail_chk().equals("Y")) {%> checked="checked" <%} %>/>
							<label>이메일 수신동의</label></span></td>
						</tr>
						<tr>
							<th><label>주소</label></th>
							<td class="addr_td"><input 	type="text" class="zipcode" id="zipcode" name="zipcode" value="<%=miVO.getZipcode() %>" readonly="readonly" onclick="zipcodeapi();" />
								<a class="formBtn" href="javascript:zipcodeapi();">우편번호검색</a><br />
								<input type="text" id="addr1" class="addr" name="addr1" value="<%=miVO.getAddr1() %>" readonly="readonly" style="margin-top: 7px;" /><br />
								<input type="text" id="addr2" class="addr" name="addr2" value="<%=miVO.getAddr2() %>" style="margin-top: 7px;" /></td>
						</tr>
					</table>
				</div>
				<div class="writeForm_btn">
					<button type="button" class="oBtn" id="btn">확인</button>
				</div>
				</form>
			</div>
			<!-- 내정보수정 끝 -->
			<!-- content  -->
		<!-- container end -->

<!-- footer -->
<%@ include file="../../common/jsp/footer.jsp" %>
<!-- footer end -->
</div>

</body>
</html>