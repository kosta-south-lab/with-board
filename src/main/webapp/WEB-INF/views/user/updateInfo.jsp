<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

</head>
<body>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">


</script>

 <form name="updateInfo" method="post" action="${pageContext.request.contextPath}/user/changeInfo">
 <h1>수정 Form 입니다.</h1>
<table>
  <tr>
  	<th>아이디</th>
    <th>이미지</th>
    <th>닉네임</th>
    <th>성별</th>
  </tr>
  <tr>
  	<th><input type="text" readonly="readonly" id="id" name="id" value="${member.id}"></th> 
    <th><input type="text" id="image" name="image" value="${member.image}"></th> 
    <th><input type="text" id="nickname" name="nickname" value="${member.nickname}"></th>
    <th><input type="text" readonly="readonly" id="gender" name="gender" value="${member.gender}"></th><p>
  </tr>
  <tr>
  	<th>주소</th>
  	
  </tr>
  <tr>
  	<th><input type="text" id="location" name="location" value="${sessionScope.member.location}"></th>
  	<th><input type="text" id="location2" name="location2" value="${sessionScope.member.location2}"></th><br>
 	</tr>
   <tr>
  	<th>이메일</th>
  	  <th><input type="text" readonly="readonly" id="email" name="email" value="${sessionScope.member.email}"></th>
  </tr>
  
</table>
	<input type="submit" value="수정하기">
	<input type="button" value="뒤로가기" onclick="history.back()">
</form>

</body>
</html>