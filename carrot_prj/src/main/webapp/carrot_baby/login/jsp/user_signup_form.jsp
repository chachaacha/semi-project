<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<link rel="stylesheet" type="text/css" href="../../common/css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="../css/user_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/user_signup_form.css"/> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- 다음우편번호API -->
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
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

</script>
</head>
<body>

<!-- header -->
<!-- header end-->

<!-- container -->
<div class="container">

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
						<div><img src="../../images/user.png"  class="img"></div>
						<div>
							<div class="upload-btn-wrapper">
								<button class="formBtn">사진등록</button>
								<input type="file" /> <input type="button" value="삭제" class="formBtn">
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
						<input type="text" placeholder="아이디를 입력해주세요" name="id" id="id" class="inputTxt inputIdtype"  maxlength="20"  />
					</td>
				</tr>
						<tr>
					<th><label><span style="color:red">*</span>비밀번호</label></th>
					<td>
						<input type="password" placeholder="비밀번호를 입력해주세요" name="password" id="password" class="inputPass size02" />
						<span>*8~12자의 영문, 숫자, 특수문자 3가지를 조합하여 입력</span>
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
						<input type="text" name="phone_num" id="phone_num" placeholder="휴대폰번호 입력" />
						<span class="label_wrap"><input type="checkbox" id="sms_chk" name="sms_chk" />
						<label>SMS 수신동의</label></span>
					</td>
				</tr>
				<tr>
					<th><label><span style="color:red">*</span>이메일</label></th>
					<td class="mail_type">
						<input type="text" placeholder="이메일 입력" name="email" id="email" class="inputEmail" maxlength="100"  />
						<span class="email_txt">@</span>
						<input type="text" name="email1" id="email1" class="inputEmail" maxlength="100" />
						<select class="selectEmail" name="email2" id="email2" onchange="selectEmail(this)">
							<option value="">선택해주세요</option>
							<option value='1' >직접 입력</option>
							<option value='naver.com' >naver.com</option>
							<option value='daum.net' >daum.net</option>
							<option value='gmail.com' >gmail.com</option>
							<option value='nate.com' >nate.com</option>
						</select>
						<span class="label_wrap"><input type="checkbox" id="email_chk" name="email_chk" /><label>이메일 수신동의</label></span>
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
			<a href="user_signup_comp.jsp"><input type="button" value="가입하기" class="oBtn" id="btn"></a>
			<a href="user_login.jsp" ><input type="button" value="처음으로" class="gBtn" ></a>
		</div>
		
		<!-- 내정보수정 끝 -->
		</div>
<!-- container end -->

<!-- footer -->
<!-- footer end -->

</body>
</html>