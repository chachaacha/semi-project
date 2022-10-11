<%@ page import="userDAO.FindPwDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
<% //POST요청방식의 한글 처리  
request.setCharacterEncoding("UTF-8"); %>
<!-- 1. parameter 받을 VO 생성 -->
<jsp:useBean id="fVO" class="userVO.FindPwVO" />
<!-- 2. VO에 setter method(property) 호출 -->
<jsp:setProperty property="*" name="fVO"/>
<%
/* 랜덤변수 */
int[] abc = new int[8];
		char[] abbc = new char[8];
		StringBuilder temp1 = new StringBuilder();
		for(int i =0; i<8; i++) {
			abc[i] = (int)(Math.random()*74) +48; //48~57, 65~90,  97~122 :;<=>?@, [\]^_`
			abbc[i]= (char)abc[i];
			temp1.append(abbc[i]);
		}
String temp = temp1.toString();
System.out.println( "임시비밀번호 : " +temp);
/* String name = request.getParameter("name");
String birth = request.getParameter("birth");
String phone_num = request.getParameter("phone_num");  */
FindPwDAO fDAO=FindPwDAO.getInstance();
String id=fDAO.selectFindPw(fVO);
fVO.setId(id);
fVO.setName(request.getParameter("name"));
fVO.setTemp(temp);

fDAO.updateTempPw(fVO);
String pass=fDAO.selectView(id);
pageContext.setAttribute("pass", pass);

%>
	<script type="text/javascript">
<%
System.out.println( "-----"+temp);
if(fDAO.selectFindPw(fVO) !=null) {
	session.setAttribute("tempPass",temp);
%>
<%-- <c:redirect url="user_find_pass.jsp"/> --%>
	location.href="user_find_pass.jsp";

<%
	}else{
%>
<!-- 입력된 정보를 확인하시오  -->
	alert("입력하신 정보를 다시 확인해주세요.");
	location.href="user_find_pass.jsp";
<% } %>
	</script>
</body>
</html>