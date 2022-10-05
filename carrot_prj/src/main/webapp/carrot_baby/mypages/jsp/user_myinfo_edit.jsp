<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


	$(function() {
		$(".oBtn").click(function() {
			alert("개인정보가 수정되었습니다.")
		});
	});
</script>

</head>
<body>
	<div class="wrap">

<!-- header -->
<%@ include file="../../mainhome/jsp/user_logout_header.jsp" %>
<!-- header end-->

		<!-- container -->
		<div class="container">

			<%@ include file="myinfo_navi.jsp" %>

				<!-- 내정보수정  -->
				<div class="title">내 정보 수정</div>

				<!-- 정보 작성 폼 -->
				<form action="user_myinfo_edit_process.jsp" method="post" name="editFrm">
				<div class="writeForm">
					<table>
						<tr>
							<th><label for="id">프로필 사진</label></th>
							<td>
								<div class="profile">
									<div>
										<img src="../../images/profileImg.png" style="margin: 5px 30px; width: 70px; height: 70px; background: #f8edeb; border-radius: 50%;">
									</div>
									
									<div>
										<div class="upload-btn-wrapper">
											<button class="formBtn" style="padding: 8px 20px;">사진등록</button>
											<input type="file" style="padding: 8px 20px; cursor: pointer;" />
											<input type="button" value="삭제" class="formBtn" style="margin: 5px 5px; padding: 8px 20px; cursor: pointer;">
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th><label>성명</label></th>
							<td><input type="text" value="홍길동" id="name" class="inputTxt inputName" readonly="readonly" /></td>
						</tr>
						<tr>
							<th><label>별명</label></th>
							<td><input type="text" value="당근맘"	id="nick" name="nick" class="inputTxt inputNickName" /></td>
						</tr>
						<tr>
							<th><label>아이디</label></th>
							<td><input type="text" value="carrotbaby" name="id" id="id" class="inputTxt inputIdtype" maxlength="20" readonly="readonly" /></td>
						</tr>
						<tr>
							<th scope="row"><label>생년월일</label></th>
							<td><input type="date" name="birth" id="birth" value="1998-01-03" readonly="readonly" /></td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td><input type="text" name="phone_num" id="phone_num" value="010-1234-5678" readonly="readonly" />
								<span class="label_wrap"><input type="checkbox" id="sms_chk" name="sms_chk" style="cursor: pointer;"/>
								<label>SMS 수신동의</label></span></td>
						</tr>
						<tr>
							<th><label>이메일</label></th>
							<td class="mail_type">
							<input type="text" value="babycarrot" name="email" id="email" class="inputEmail" maxlength="100" />
							<span class="email_txt">@</span>
							<input type="text" value="babycarrot.co.kr" name="email1" id="email1" class="inputEmail" maxlength="100" />
							<select class="selectEmail" name="email2" id="email2" onchange="selectEmail(this)">
									<option value='1'>직접 입력</option>
									<option value='babycarrot.co.kr' selected>babycarrot.co.kr</option>
									<option value='naver.com'>naver.com</option>
									<option value='daum.net'>daum.net</option>
									<option value='gmail.com'>gmail.com</option>
									<option value='nate.com'>nate.com</option>
							</select> <span class="label_wrap"><input type="checkbox" id="email_chk" name="email_chk" style="cursor: pointer;" />
							<label>이메일 수신동의</label></span></td>
						</tr>
						<tr>
							<th><label>주소</label></th>
							<td class="addr_td"><input 	type="text" class="zipcode" id="zipcode" name="zipcode" value="06235" readonly="readonly" onclick="zipcodeapi();" />
								<a class="formBtn" href="javascript:zipcodeapi();">우편번호검색</a><br />
								<input type="text" id="addr1" class="addr" name="addr1" value="서울 강남구 테헤란로 132 8층 쌍용교육센터" readonly="readonly" style="margin-top: 7px;" /><br />
								<input type="text" id="addr2" class="addr" name="addr2" value="4강의실" style="margin-top: 7px;" /></td>
						</tr>
					</table>
				</div>
				<div class="writeForm_btn">
					<button type="button" class="oBtn">확인</button>
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