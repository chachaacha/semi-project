<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="userDAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" info = "글쓰기 저장하기" isELIgnored="false" %>
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
<% 
//POST방식의 요청 한글 처리
request.setCharacterEncoding("UTF-8"); 
%>
<!-- 1. parameter 받을 VO 생성 -->
<%-- <jsp:useBean id="객체명" class="객체화할 클래스" scope=""/> --%>
<jsp:useBean id="pVO" class="userVO.PostVO"/>
<jsp:useBean id="iVO" class="userVO.ImgVO"/>

<%
	//1. 업로드 경로 얻기
	File uploadDir=new File("C:/Users/user/git/carrot_prj/carrot_prj/src/main/webapp/carrot_baby/search/image");
	//2. 업로드할 파일 크기를 연산
	int maxSize=1024*1024*5;
	//3. 업로드
	MultipartRequest mr = new MultipartRequest(request, uploadDir.getAbsolutePath(), 
			maxSize, "UTF-8", new DefaultFileRenamePolicy() );
	//4. 웹 파라메터 처리
	//5. file control 처리
	String product_idx = mr.getParameter("product_idx");
	int cnt=Integer.parseInt(mr.getParameter("count"));
	String[] chk_img = new String[cnt];
	for(int i =0; i<cnt; i++){
		chk_img[i]= mr.getParameter("chk_img"+i);
	}
	String title = mr.getParameter("title");
	String contents = mr.getParameter("contents");
	String user_id=(String)session.getAttribute("user_id");
	String category_loc=mr.getParameter("category_loc");
	int gu_idx = Integer.parseInt(category_loc);
	String category_pd=mr.getParameter("category_pd");
	int category_idx = Integer.parseInt(category_pd);
	String priceS = mr.getParameter("price");
	int price = Integer.parseInt(priceS);
	String free = mr.getParameter("free");
	if(free == null){
		free = "N";
	}
%>
<%-- <jsp:setProperty name="객체명" property="*"/> --%>
	<jsp:setProperty property="id" name="pVO" value="<%= user_id %>"/>
	<jsp:setProperty property="product_idx" name="pVO" value="<%= product_idx %>"/>
	<jsp:setProperty property="category_idx" name="pVO" value="<%= category_idx %>"/>
	<jsp:setProperty property="gu_idx" name="pVO" value="<%= gu_idx %>"/>
	<jsp:setProperty property="price" name="pVO" value="<%= price %>"/>
	<jsp:setProperty property="free" name="pVO" value="<%= free %>"/>
	<jsp:setProperty property="title" name="pVO" value="<%= title %>"/>
	<jsp:setProperty property="contents" name="pVO" value="<%= contents %>"/>
	<jsp:setProperty property="thumbnail" name="pVO" value=""/>
<%
PostDAO pDAO = PostDAO.getInstance();
out.println(pVO);
pDAO.updatePost(pVO);
%>
<%
	//원본 파일명
	String[] reName = new String[cnt];
	String[] originalName = new String[cnt];
	for(int i=0; i< cnt; i++){
	originalName[i]=mr.getOriginalFileName("post_img"+(i+1));
	//변경된 파일명
	reName[i]=mr.getFilesystemName("post_img"+(i+1));
	
	boolean flag=false;
	File temp = new File(uploadDir.getAbsolutePath()+"/"+reName[i]);

	int checkSize=1024*1024*5;
	if( temp.length() >= checkSize) {
		flag=true;
		temp.delete(); //파일 삭제
	}//end if
	
	if( !flag ){
%>
	파일이 업로드 되었습니다.<br/>
	파일명 : <%= originalName[i] %>(<%= reName[i] %>)
	나이 : <%= cnt %><br/>
<%} else {%>
업로드 파일은 5MByte까지만 가능합니다.
<%}//end else %>
<%
if( reName[i] != null ){
%>
<jsp:setProperty property="product_img" name="iVO" value="<%= reName[i] %>"/>
<jsp:setProperty property="product_idx" name="iVO" value="<%= product_idx %>"/>
<jsp:setProperty property="img_num" name="iVO" value="<%= i+1 %>"/>
<%
pDAO.deleteImg(product_idx);
pDAO.insertImg(iVO);
%>
<%} //end if %>
<%}//end for %>
<jsp:setProperty property="product_idx" name="pVO" value="<%= product_idx %>"/>
<jsp:setProperty property="thumbnail" name="pVO" value="<%= reName[0] %>"/>
<%
pDAO.updateThumbnail(pVO);
%>
</body>
</html>