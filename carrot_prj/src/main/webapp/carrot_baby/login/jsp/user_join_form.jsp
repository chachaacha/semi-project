<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_join_form.css"/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 다음우편번호API -->
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<!--  -->
<script type="text/javascript">
//가입하기 버튼을 클릭했을 때
$(function () {
    $("#btn").click(function () {
		//null 검사
    	chkNull(); 
    });
    
	//아이디 중복확인 팝업창 열기
    $("#idbtn").click(function() {
		window.open("id_dup_popup.jsp","id_dup_popup",
			"width=520,height=370,top=220,left=700");
	});
});

//필수 입력에 대한 체크 수행
function chkNull(){
	//이름 필수 입력	
	if($("#name").val().trim()=="") {
		alert("이름을 입력하세요");
		$("#name").focus();
		return;
	}
	//별명 필수 입력	
	if($("#nick").val().trim()=="") {
		alert("별명을 입력하세요");
		$("#nick").focus();
		return;
	}
	//아이디 필수 입력	
	if($("#id").val().trim()=="") {
		alert("아이디를 입력하세요");
		$("#id").focus();
		return;
	}
	//비밀번호 필수 입력	
	if($("#password").val().trim()=="") {
		alert("비밀번호를 입력하세요");
		$("#password").focus();
		return;
	}
	//8~25자의 영문, 숫자, 특수문자 3가지를 조합하여 입력
	var passChk= /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,25}$/;
	
	if(!passChk.test($("#password").val().trim())){
		alert("8~25자의 영문, 숫자, 특수문자 3가지를 조합하여 입력해야 합니다.");
		$("#password").focus();
		return;
	}  
	//비밀번호확인 필수 입력	
	if($("#passwordChk").val().trim() !== $("#password").val().trim()) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#passwordChk").focus();
		return;
	}
	//생년월일 필수 입력	
	if($("#birth").val().trim()=="") {
		alert("생년월일을 입력하세요");
		$("#birth").focus();
		return;
	}
	//번호 필수 입력	
	if($("#phone_num").val().trim()=="") {
		alert("휴대폰번호를 입력하세요");
		$("#phone_num").focus();
		return;
	}
	//이메일 필수 입력	
 	if($("#email1").val().trim()=="") {
		alert("이메일을 입력하세요");
		$("#email1").focus();
		return;
	}
	//이메일도메인 필수 입력	
	if($("#email2").val().trim()=="") {
		alert("이메일을 확인하세요");
		$("#email2").focus();
		return;
	} 
	
/* 	//방법1 email1과 email2를 email에 설정한다. 
	$("#email").val( $("#email1").val()+"@"+$("#email2").val() );// 끗!!!! */

	//주소 필수 입력	
	if($("#zipcode").val().trim()=="") {
		alert("주소를 입력하세요");
		$("#zipcode").focus();
		return;
	}
	//상세주소 필수 입력	
	if($("#addr2").val().trim()=="") {
		alert("상세주소를 입력하세요");
		$("#addr2").focus();
		return;
	}//end if
	
	$("#memberFrm").submit();
} 

//이메일 입력방식 선택
function selectEmail(e){
    var $e = $(e);
    var $email1 = $('input[name=email2]');

    // '1'인 경우 직접입력
    if($e.val() == "1"){
        $email1.attr('readonly', false);
        $email1.val('');
    } else {
        $email1.attr('readonly', true);
        $email1.val($e.val());
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

</script>
</head>
<body>
<!-- header -->
<!-- header end-->

<!-- container -->
<div class="container">
	<form name="memberFrm" id="memberFrm" enctype="multipart/form-data" method="post" action="user_join_form_process.jsp" >

	<!-- 상단 로고 -->
	<div>
		<a href="../../mainhome/jsp/user_mainhome.jsp"><img src="../../images/logo.png" class="logoImg"></a>
	</div>

	<!-- 회원가입  -->
	<div class="title">회원가입</div>

	<!--회원가입 박스-->
	<div class="writeForm">
				<table>
					<tr>
						<th><label>프로필 사진</label></th>
						<td>
							<div class="profile">
							<div><img src="../../images/profileImg.png"  class="img"></div>
							<div>
								<div class="upload-btn-wrapper">
									<button class="formBtn" id="uploadBtn">사진등록</button>
									<input type="file" name="upfile"  />
									 <input type="button" value="삭제" class="formBtn">
								</div>
							</div>
							</div>
						</td>
					</tr>
					<tr>
						<th><label><span style="color:red">*</span>성명</label></th>
						<td>
							<input type="text" placeholder="이름을 입력해주세요" id="name" name="name" class="inputTxt inputName" />
						</td>
					</tr>
					<tr>
						<th><label><span style="color:red">*</span>별명</label></th>
						<td>
							<input type="text" placeholder="별명을 입력해주세요" id="nick" name="nick" class="inputTxt inputNickName" />
						</td>
					</tr>
					<tr>
						<th><label><span style="color:red">*</span>아이디</label></th>
						<td>
							<input type="text" placeholder="아이디를 입력해주세요" name="id" id="id" class="inputTxt inputIdtype"  maxlength="20" />
							<input type="button" value="아이디 중복 확인" class="idBtn" id="idbtn" />
						</td>
					</tr>
							<tr>
						<th><label><span style="color:red">*</span>비밀번호</label></th>
						<td>
							<input type="password" placeholder="비밀번호를 입력해주세요" name="password" id="password" class="inputPass size02" />
							<span>*8~25자의 영문, 숫자, 특수문자 3가지를 조합하여 입력</span>
						</td>
					</tr>
							<tr>
						<th><label><span style="color:red">*</span>비밀번호 확인</label></th>
						<td>
							<input type="password" placeholder="비밀번호를 입력해주세요" name="passwordChk" id="passwordChk" class="inputPass size02 mmarT10"  />
						</td>
					</tr>
					<tr>
						<th scope="row"><label><span style="color:red">*</span>생년월일</label></th>
						<td >
							<input type="date" name="birth" id="birth" />
						</td>
					</tr>
					<tr>
						<th><span style="color:red">*</span>휴대폰</th>
						<td>
							<input type="tel" name="phone_num" id="phone_num" placeholder="예) 010-1234-5678" />
							<span class="label_wrap"><input type="checkbox" id="sms_chk" name="sms_chk"  value="Y"  />
							<label>SMS 수신동의</label></span>
						</td>
					</tr>
					<tr>
						<th><label><span style="color:red">*</span>이메일</label></th>
						<td class="mail_type">
						<!--  방법 1-->
							<input type="hidden"  name="email" id="email" />
							<input type=text placeholder="이메일 입력" name="email1" id="email1" class="inputEmail" maxlength="100" />
							<span class="email_txt">@</span>
							<input type="text" name="email2" id="email2" class="inputEmail" maxlength="100" />
							<select class="selectEmail" name="email3" id="email3" onchange="selectEmail(this)">
								<option value='1' >직접 입력</option>
								<option value='naver.com' >naver.com</option>
								<option value='daum.net' >daum.net</option>
								<option value='gmail.com' >gmail.com</option>
								<option value='nate.com' >nate.com</option>
								<option value='nate.com' >hotmail.com</option>
							</select>
							<span class="label_wrap"><input type="checkbox" id="email_chk" name="email_chk" value="Y" /><label>이메일 수신동의</label></span>
						</td>
					</tr>
					<tr>
						<th><label><span style="color:red">*</span>주소</label></th>
						<td class="addr_td">
							<input type="text" placeholder="우편번호 입력" class="zipcode" id="zipcode" name="zipcode" readonly="readonly" onclick="zipcodeapi();"/>
							<a class="formBtn" href="javascript:zipcodeapi();" >우편번호검색</a><br/>
							<input type="text" placeholder="주소 입력" id="addr1" class="addr" name="addr1" readonly="readonly" style="margin-top:7px;" /><br />
							<input  type="text" placeholder="상세주소 입력" id="addr2" class="addr" name="addr2" style="margin-top:7px;"  />
						</td>
					</tr>
				</table>
	
			</div>
	
			<div style="text-align: center; margin: 50px; padding-bottom: 50px;">
				<input type="button" id="btn" value="가입" class="oBtn" >
				<input type="reset" value="취소" class="gBtn" >
			</div>
			<!-- 내정보수정 끝 -->
			</form>
</div>
<!-- container end -->

<!-- footer -->
<!-- footer end -->

</body>
</html>