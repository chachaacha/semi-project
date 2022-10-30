<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
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
<jsp:useBean id="jVO" class="userVO.JoinVO" />
<!-- 2. VO에 setter method(property) 호출 -->
<!-- 이미지 -->
<%
//1.업로드 경로 얻기
File uploadDir = new File("E:/web_service/carrot_baby/user_profile_upload");
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
if(reName == null){
   reName = "profileImg.png";
}

boolean flag=false;
File temp=new File(uploadDir.getAbsolutePath()+"/"+reName);
int checkSize=1024*1024*5;
if(temp.length()> checkSize) {
   flag=false;
   temp.delete();
}
System.out.println("***이미지***"+reName);
//이름
String name=mr.getParameter("name");
String namechk=name.toLowerCase();
System.out.println("***이름***"+namechk);
//별명
String nick=mr.getParameter("nick");
String nickchk=nick.toLowerCase();
System.out.println("***별명***"+nickchk);
//아이디
String id=mr.getParameter("id");
System.out.println("**아이디**"+id);
String idchk=id.toLowerCase();
System.out.println("***아이디***"+idchk);
//비밀번호
String pwd=mr.getParameter("password");
System.out.println("일반비밀번호: "+pwd);
String plainText=pwd;
//알고리즘 설정하여 비밀번호 암호화
MessageDigest md=MessageDigest.getInstance("SHA-1");
md.update(plainText.getBytes());
String sha_p=DataEncrypt.messageDigest("SHA-1", plainText);
System.out.println("***암호화비번***"+sha_p);
//생년월일
String birth=mr.getParameter("birth");
//폰번호
String phone_num=mr.getParameter("phone_num");
//<!-- 체크박스 -->
String check1=mr.getParameter("sms_chk");
if(check1 == null){
   check1 = "N";
}
String check2=mr.getParameter("email_chk");
if(check2 == null){
   check2 = "N";
}
//<!-- 이메일 추출 -->
//방법 2.
String email1=mr.getParameter("email1");
String email2=mr.getParameter("email2");
String email=email1+"@"+email2;
System.out.println("***이메일***: "+email);
//우편번호
String zipcode=mr.getParameter("zipcode");
//<!-- 주소 추출 -->
String addr1=mr.getParameter("addr1");
/* String addr=str.substring(0,str.lastIndexOf("구")+1); */
System.out.println("***주소***: "+addr1);
//상세주소
String addr2=mr.getParameter("addr2");
%>
<jsp:setProperty property="img" name="jVO" value="<%= reName %>"/>

<jsp:setProperty property="name" name="jVO" value="<%= namechk %>"/>
<jsp:setProperty property="nick" name="jVO" value="<%= nickchk %>"/>
<jsp:setProperty property="id" name="jVO" value="<%= idchk %>"/>
<jsp:setProperty property="password" name="jVO" value="<%= sha_p %>"/>
<jsp:setProperty property="birth" name="jVO" value="<%= birth %>"/>
<jsp:setProperty property="phone_num" name="jVO" value="<%= phone_num %>"/>
<jsp:setProperty property="sms_chk" name="jVO" value="<%= check1 %>"/>
<jsp:setProperty property="email" name="jVO" value="<%= email %>"/> 
<jsp:setProperty property="email_chk" name="jVO" value="<%= check2 %>"/>
<jsp:setProperty property="zipcode" name="jVO" value="<%= zipcode %>"/>
<jsp:setProperty property="addr1" name="jVO" value="<%= addr1 %>"/> 
<jsp:setProperty property="addr2" name="jVO" value="<%= addr2 %>"/> 

<!-- DB연결 -->
<%
//암호화 키 불러오기
ServletContext sc=getServletContext();
String key = sc.getInitParameter("userKey");
//키를 집어넣기
JoinDAO jDAO=JoinDAO.getInstance(key);
/* out.println ( jVO ); */
jDAO.insertJoin( jVO );%>

<script type="text/javascript">
   alert("정보작성이 완료되었습니다.");
   location.href="user_join_comp.jsp";
</script>

</body>
</html>