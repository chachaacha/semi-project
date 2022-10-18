<%@page import="java.io.File"%>
<%@page import="userVO.ImgVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.PostDAO"%>
<%@page import="userDAO.MySalesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.149/jsp_prj/common/css/main_v1_220901.css"/>
<style type="text/css">

</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap Css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Bootstrap Js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script type="text/javascript">
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

//MySalesDAO 생성
MySalesDAO msDAO=MySalesDAO.getInstance();
PostDAO pDAO=PostDAO.getInstance();
String product_idx=request.getParameter("product_idx"); //게시글 삭제를 위한 인덱스

List<ImgVO> list = null;
list= pDAO.selectImg(product_idx);
for(int i = 0; i<list.size(); i++){
	try {
	    String path = "../../search/image/"+list.get(i).getProduct_img(); // C 드라이브 -> test폴더 -> test.txt
	    File file = new File(path); // file 생성

	    if(file.delete()){ // f.delete 파일 삭제에 성공하면 true, 실패하면 false
	        System.out.println("파일을 삭제하였습니다");
	    }else{
	        System.out.println("파일 삭제에 실패하였습니다");
	    }
	} catch(Exception e) {
	 e.printStackTrace();
	}	
}//end for


msDAO.deleteBoard(product_idx);

response.sendRedirect("../../search/jsp/user_search.jsp");
%>

</body>
</html>