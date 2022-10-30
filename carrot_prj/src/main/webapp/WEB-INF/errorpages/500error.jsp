<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500error</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.151/carrot_baby/common/css/main_v1_220901.css">
<style type="text/css">
p{margin: 15px;}
.msg {
   text-align: center;
   font-size: 15px;
   font-weight: bold;
   padding-bottom: 10px
}
/* 주메세지 */
.msg1 {
   font-size: 30px;
   font-weight: bold;
   padding: 30px
}

/* 버튼 */
.btn {
   font-size: 20px;
    font-weight: bold;
    border: 0px;
    border-radius: 10px;
    padding: 20px 60px;
    cursor: pointer;
}
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<!-- header -->
<div style="border-bottom: 5px solid orange;">
<a href="../../mainhome/jsp/user_mainhome.jsp"><img src="../../images/logo.png" style="width:150px; height:50px; padding: 20px 0 20px 230px; "></a> 
</div>

         <!-- 이미지 -->
         <div>
         <img src="../../images/error.png" style="display:block; margin: auto; width: 300px; height:300px;">
         </div>

         <!-- 메세지 -->
         <div class="msg">
            <p class="msg1">서비스에 접속할 수 없습니다.</p>
            <p>기술적인 문제로 일시적으로 접속되지 않았습니다.</p>
            <p>잠시 후 다시 이용 부탁드립니다 :)</p>
         </div>

         <!-- 버튼  -->
         <div style="text-align: center; margin:30px;">
            <input type="button" value="새로고침" class="btn" onclick="window.location.reload()">
         </div>
</body>
</html>