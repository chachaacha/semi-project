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

<script type="text/javascript">
function zipcodeapi() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('#zipcode').val(data.zonecode); //5자리 새우편번호 사용
            $('#addr0').val(fullAddr);

            // 커서를 상세주소 필드로 이동한다.
            $('#addr1').focus();
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
				<div class="writeForm">
					<table>
						<tr>
							<th><label for="id">프로필 사진</label></th>
							<td>
								<div class="profile">
									<div>
										<img src="../../images/user.png"
											style="margin: 5px 30px; width: 70px; height: 70px;">
									</div>
									<div>
										<div class="upload-btn-wrapper">
											<button class="formBtn" style="padding: 8px 20px;" type="button">사진등록</button>
											<input type="file" name="myfile" style="padding: 8px 20px; cursor: pointer;" />
											<input type="button" value="삭제" class="formBtn"
												style="margin: 5px 5px; padding: 8px 20px; cursor: pointer;">
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th><label for="password">성명</label></th>
							<td><input data-value="이름을 입력해주세요." value="홍길동" id="name"
								name="name" class="inputTxt inputName" type="text" readonly="readonly"/></td>
						</tr>
						<tr>
							<th><label for="name">별명</label></th>
							<td><input data-value="별명을 입력해주세요." value="당근맘"
								id="nickName" name="nickName" class="inputTxt inputNickName"
								type="text" /></td>
						</tr>
						<tr>
							<th><label for="name">아이디</label></th>
							<td><input data-value="아이디를 입력해주세요." value="carrotbaby"
								name="id" id="id" class="inputTxt inputIdtype" type="text"
								maxlength="20" readonly="readonly" /></td>
						</tr>
						<tr>
							<th scope="row"><label for="">생년월일</label></th>
							<td><input type="date" name="birthday" id="birthday"
								data-value="생년월일을 입력해 주세요." value="1998-01-03" readonly="readonly"/></td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td><input type="text" name="cell" id="cell"
								value="010-1234-5678" onkeyup="isNumberOrHyphen(this);"
								onblur="cvtUserPhoneNumber(this)" data-value="휴대폰 번호를 입력해주세요." readonly="readonly" />
								<span class="label_wrap"><input type="checkbox"
									id="Num_check" name="issms" value="1"  style="cursor: pointer;"/><label for="Num_check">SMS
										수신동의</label></span></td>
						</tr>
						<tr>
							<th><label for="email">이메일</label></th>
							<td class="mail_type"><input data-value="이메일을 입력해주세요."
								value="babycarrot" name="email1" id="email1" class="inputEmail"
								type="text" maxlength="100" /><span class="email_txt">@</span>
								<select class="selecEmail" name="email2" id="email2"
								data-value="이메일을 선택해주세요.">
									<option value="">babycarrot.co.kr</option>
									<option value='직접 입력'>직접 입력</option>
									<option value='naver.com'>naver.com</option>
									<option value='daum.net'>daum.net</option>
									<option value='gmail.com'>gmail.com</option>
									<option value='hotmail.com'>hotmail.com</option>
									<option value='nate.com'>nate.com</option>
									<option value='korea.com'>korea.com</option>
							</select> <span class="label_wrap"><input type="checkbox"
									id="Email_check" name="ismail" value="1" style="cursor: pointer;" /><label
									for="Email_check">이메일 수신동의</label></span></td>
						</tr>
						<tr>
							<th><label for="addr0">주소</label></th>
							<td class="addr_td"><input data-value="우편번호를 입력해주세요."
								type="text" class="zipcode" id="zipcode" name="zipcode"
								value="06235" readonly="readonly" onclick="zipcodeapi();" /><a
								class="formBtn" href="javascript:zipcodeapi();">우편번호검색</a><br />
								<input data-value="주소를 입력해주세요." type="text" id="addr0"
								class="addr" name="addr0" value="서울 강남구 테헤란로 132 8층 쌍용교육센터"
								readonly="readonly" style="margin-top: 7px;" /><br /> <input
								data-value="상세주소를 입력해주세요." type="text" id="addr1" class="addr"
								name="addr1" value="4강의실" style="margin-top: 7px;" /></td>
						</tr>
					</table>
				</div>
				<div class="writeForm_btn">
					<button type="button" class="oBtn">확인</button>
				</div>
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