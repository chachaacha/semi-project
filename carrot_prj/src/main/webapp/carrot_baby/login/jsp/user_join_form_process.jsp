<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page import="userDAO.JoinDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:useBean id="jVO" class="userVO.JoinVO" scope="session" />
<!-- 2. VO에 setter method(property) 호출 -->
<jsp:setProperty property="*" name="jVO"/>
<!-- 이미지 -->
<%
//1.업로드 경로 얻기
File uploadDir = new File("C:/Users/user/git/carrot_prj/carrot_prj/src/main/webapp/carrot_baby/user_profile_upload");
//2.업로드할 파일 크기를 연산
//5MByte까지의 파일을 업로드
int maxSize=1024*1024*5;
//3.업로드 : MultipartRequest를 생성하면 파일이 업로드 된다.
MultipartRequest mr = new MultipartRequest(request, uploadDir.getAbsolutePath(), maxSize,"UTF-8", new DefaultFileRenamePolicy()); 
//4. file control 처리
//원본 파일명
String originalName=mr.getOriginalFileName("upfile");
//변경된 파일명
String reName=mr.getFilesystemName("upfile");

System.out.println("--------새파일: "+originalName);
System.out.println("--------중복이름파일: "+reName);

boolean flag=false;
File temp=new File(uploadDir.getAbsolutePath()+"/"+reName);
int checkSize=1024*1024*5;
if(temp.length()> checkSize) {
	flag=false;
	temp.delete();
}

//<!-- 체크박스 -->
String check1=mr.getParameter("sms_chk");
if(check1 == null){
	check1 = "N";
}
System.out.println("--------전화수신: "+check1);
String check2=mr.getParameter("email_chk");
if(check2 == null){
	check2 = "N";
System.out.println("--------이메일수신: "+check2);
}

//<!-- 이메일 추출 -->
//방법 2.
String email1=mr.getParameter("email1");
System.out.println(email1);
String email2=mr.getParameter("email2");
System.out.println(email2);
String email=email1+"@"+email2;
System.out.println("--------이메일: "+email);

//<!-- 주소 추출 -->
String str=mr.getParameter("addr1");
String addr=str.substring(0,str.lastIndexOf("구")+1);
System.out.println("--------주소: "+addr);

%>
<jsp:setProperty property="img" name="jVO" value="<%= originalName %>"/>
 
<jsp:setProperty property="sms_chk" name="jVO" value="<%= check1 %>"/>
<jsp:setProperty property="email_chk" name="jVO" value="<%= check2 %>"/>

<jsp:setProperty property="email" name="jVO" value="<%= email %>"/> 

<jsp:setProperty property="addr1" name="jVO" value="<%= addr %>"/> 

<!-- DB연결 -->
<%
JoinDAO jDAO=JoinDAO.getInstance();
out.println ( jVO );
jDAO.insertJoin( jVO );%>

<script type="text/javascript">
	alert("정보작성이 완료되었습니다.");
	location.href="user_join_comp.jsp";
</script>

</body>
</html>