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
<!-- 사진업로드 -->
<%
//1.업로드 경로 얻기
File uploadDir=new File("C:/Users/user/git/carrot_prj/carrot_prj/src/main/webapp/carrot_baby/user_profile_upload");
//2.업로드할 파일 크기를 연산
//5MByte까지의 파일을 업로드
int maxSize=1024*1024*5;
//3.업로드 : MultipartRequest를 생성하면 파일이 업로드 된다.
//MultipartRequest(javax.servlet.http.HttpServletRequest request, java.lang.String saveDirectory, int maxPostSize, java.lang.String encoding, FileRenamePolicy policy)
/* try{ */
MultipartRequest mr = new MultipartRequest(request, uploadDir.getAbsolutePath(), maxSize,"UTF-8", new DefaultFileRenamePolicy()); 
//5. file control 처리
//원본 파일명
String originalName=mr.getOriginalFileName("upfile");
//변경된 파일명
String reName=mr.getFilesystemName("upfile");

boolean flag=false;
File temp=new File(uploadDir.getAbsolutePath()+"/"+reName);
int checkSize=1024*1024*5;
if(temp.length()> checkSize) {
	flag=false;
	temp.delete();
}
/* log("-------------"+temp.length()+"/"+checkSize); */
if(!flag){
%>
파일명 : <%= originalName %>(<%= reName %>)
<%-- <% }catch(IOException ie){
	ie.printStackTrace();
	out.println("파일크기가 너무 큽니다.");
	}
%> --%>
<% }else {%>
업로드 파일은 5MByte까지만 가능합니다.
<%} %>
%>

<!-- 1. parameter 받을 VO 생성 -->
<jsp:useBean id="jVO" class="userVO.JoinVO" scope="session" />
<!-- 2. VO에 setter method(property) 호출 -->
<jsp:setProperty property="*" name="jVO"/>
<!-- 이메일 추출 -->
<%
//방법 2.
String email1=request.getParameter("email1");
String email2=request.getParameter("email2");
String email=email1+"@"+email2;
%>
<jsp:setProperty property="email" name="jVO" value="<%= email %>"/> 
<!-- 주소 추출 -->
<%
String str=request.getParameter("addr1");
String addr=str.substring(0,str.lastIndexOf("구")+1);
%>
<jsp:setProperty property="addr1" name="jVO" value="<%= addr %>"/> 

<!-- DB연결 -->
<%
JoinDAO jDAO=JoinDAO.getInstance();
out.println ( jVO );
jDAO.insertJoin(jVO);%>

<script type="text/javascript">
	alert("정보작성이 완료되었습니다.");
	location.href="user_join_comp.jsp";
</script>

</body>
</html>