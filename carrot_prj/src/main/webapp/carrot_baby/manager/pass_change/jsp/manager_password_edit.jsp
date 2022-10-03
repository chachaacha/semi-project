<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 비밀번호 변경</title>
<link rel="stylesheet" type="text/css" href="../../../common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../../common/css/manager_wrap_container.css"/>
<link rel="stylesheet" type="text/css" href="../css/manager_password_edit.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
$("#btn").click(function(){
	alert("비밀번호가 변경되었습니다.")
});
});
</script>

</head>
<body>
<div class="wrap">

<!-- header -->
<%@ include file="../../../manager/m_common/manager_login_header.jsp" %>
<!-- header end-->

<!-- container -->
<div class="container">

<div class="main">

<!-- 현재 메뉴 -->
		<div style="display: flex; align-items: center; background-color: #a0a0a0;">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi-key" viewBox="0 0 16 16">
			  <path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
			  <path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
			</svg>
			<span class="text">비밀번호 변경</span>
		</div>
<!-- 현재 메뉴 -->
<!-- 대시보드 -->
				<div class="writeForm">
			<table>
				<tr>
					<th><label for="managerId">관리자 아이디</label></th>
					<td>
						<input name="managerId" id="managerId" class="inputBox" type="text" value="babycarrot@babycarrot.co.kr"  readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th><label for="password">현재 비밀번호</label></th>
					<td>
						<input placeholder="비밀번호를 입력해주세요" name="password" id="password" class="inputBox" type="password"  />
					</td>
				</tr>
				<tr>
					<th><label for="password">신규 비밀번호</label></th>
					<td>
						<input placeholder="비밀번호를 입력해주세요" name="password1" id="password1" class="inputBox" type="password"  />
						<span>*8~12자의 영문, 숫자, 특수문자 3가지를 조합하여 입력</span>
					</td>
				</tr>
				<tr>
					<th><label for="password">신규 비밀번호 확인</label></th>
					<td>
						<input placeholder="비밀번호를 입력해주세요" name="password2" id="password2" class="inputBox" type="password"  />
					</td>
				</tr>
				</table>
		</div>
		
		<div>
		<input type="button" value="저장" class="btn" id="btn">
		</div>
<!-- 대시보드 -->
</div><!-- main -->
</div><!-- container end -->

<!-- footer -->
<%@ include file="../../../common/jsp/footer.jsp" %>
<!-- footer end -->

</div><!-- wrap  -->

</body>
</html>