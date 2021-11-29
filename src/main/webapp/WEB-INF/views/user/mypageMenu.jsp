<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

/*   $(function(){
	 $("#mypage").click(function(){
		 parent.location.href = "${path}/user/mypage.jsp"
	 }); 
  }); */
  
</script>
</head>
<body>
<ol>
  <li><a href="mypage.jsp" >내정보</a></li><p>
  <li><a href="infoChange.jsp" >정보수정</a></li><p>
  <li><a href="passChange.jsp" >비밀번호 변경</a></li><p>
</ol>
<table>
  <tr><a href="#" id="/home">메인페이지</a></tr>&nbsp;
  <tr><a href="#">로그아웃</a></tr>
</table>
</body>
</html>