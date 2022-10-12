<%@page import="userVO.MyInfoVO"%>
<%@page import="userDAO.MyInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../../common/css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_myinfo_edit.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 다음우편번호API -->
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<!-- 이메일 입력 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
//프로필사진 등록 미리보기
function previewFile() {
 //다른이미지에 적용되지않게 #profile로 id를 주어 타켓설정
  const preview = document.querySelector('#profile');
  const file = document.querySelector('input[type=file]').files[0];
  const reader = new FileReader();

  reader.addEventListener("load", () => {
    // convert image file to base64 string
    preview.src = reader.result;
  }, false);

  if (file) {
    reader.readAsDataURL(file);
  }
}

//프로필사진 등록 삭제
function deleteFile() {
 
}

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

            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('#zipcode').val(data.zonecode); //5자리 새우편번호 사용
            $('#addr1').val(fullAddr);

            // 커서를 상세주소 필드로 이동한다.
            $('#addr2').focus();
        }
    }).open();
}

$(function(){
	$("#btn").click(function(){
		$("#infoEditFrm").submit();
		
	//기존에 sms 체크했을시 checked 되도록 함.
	if(${param.sms_chk}=='Y'){
		$("#sms_check").prop("checked",true);
	}
	});
	//기존에 sms 체크했을시 checked 되도록 함.
	if(${param.email_chk}=='Y'){
		$("#sms_check").prop("checked",true);
	}
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

if(id==null){
   response.sendRedirect("../../login/jsp/user_login.jsp");
}

//저장된 내 정보 불러오기
MyInfoDAO miDAO = MyInfoDAO.getInstance();
MyInfoVO info = miDAO.selectInfo(id);
%>
	<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_login_header.jsp" %>
<!-- header end-->

		<!-- container -->
		<div class="container">

			<%@ include file="myinfo_navi.jsp" %>

				<form action="user_myinfo_edit_process.jsp" method="post" id="infoEditFrm">
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
									<!-- 파일로 넘긴 이미지 어떻게 보여주는지? -->
										<img src="../../images/profileImg.png" style="margin: 5px 30px; width: 70px; height: 70px; background: #f8edeb; border-radius: 50%;">
									</div>
									
									<div>
										<div class="upload-btn-wrapper">
											<button class="formBtn" style="padding: 8px 20px;">사진등록</button>
											<input type="file" name="upfile" onchange="previewFile()" style="padding: 8px 20px; cursor: pointer;" />
											<input type="button" value="삭제" class="formBtn" onchange="deleteFile()" style="margin: 5px 5px; padding: 8px 20px; cursor: pointer;">
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th><label>성명</label></th>
							<td><input type="text" value="<%=info.getName() %>" id="name" class="inputTxt inputName" readonly="readonly" /></td>
						</tr>
						<tr>
							<th><label>별명</label></th>
							<td><input type="text" value="<%=info.getNick() %>"	id="nick" name="nick" class="inputTxt inputNickName" /></td>
						</tr>
						<tr>
							<th><label>아이디</label></th>
							<td><input type="text" value="${ id }" name="id" id="id" class="inputTxt inputIdtype" maxlength="20" readonly="readonly" /></td>
						</tr>
						<tr>
							<th scope="row"><label>생년월일</label></th>
							<td><input type="date" name="birth" id="birth" value="<%=info.getBirth() %>" readonly="readonly" /></td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td><input type="text" name="phone_num" id="phone_num" value="<%=info.getPhone_num() %>" readonly="readonly" />
							<!-- 체크박스 초기값 설정하는거 왜 안되는지.. -->
								<span class="label_wrap"><input type="checkbox" id="sms_chk" name="sms_chk" style="cursor: pointer;" <%if(info.getSms_chk().equals("Y")) {%> checked="checked" <%} %> />
								<label>SMS 수신동의</label></span></td>
						</tr>
						<tr>
							<th><label>이메일</label></th>
							<td class="mail_type">
							<!-- 체크했었다가 취소했을 때 그 값을 어떻게 넘기는지? -->
							<input type="text" value="<%=info.getEmail() %>" name="email" id="email" class="inputEmail" maxlength="100" />
							<span class="label_wrap"><input type="checkbox" id="email_chk" name="email_chk" style="cursor: pointer;" <%if(info.getEmail_chk().equals("Y")) {%> checked="checked" <%} %>/>
							<label>이메일 수신동의</label></span></td>
						</tr>
						<tr>
							<th><label>주소</label></th>
							<td class="addr_td"><input 	type="text" class="zipcode" id="zipcode" name="zipcode" value="<%=info.getZipcode() %>" readonly="readonly" onclick="zipcodeapi();" />
								<a class="formBtn" href="javascript:zipcodeapi();">우편번호검색</a><br />
								<input type="text" id="addr1" class="addr" name="addr1" value="<%=info.getAddr1() %>" readonly="readonly" style="margin-top: 7px;" /><br />
								<input type="text" id="addr2" class="addr" name="addr2" value="<%=info.getAddr2() %>" style="margin-top: 7px;" /></td>
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