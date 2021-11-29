<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

</head>
<body>

<script type="text/javascript">
  function withdraw(){
	  confirm("정말 탈퇴하시겠습니까?");
  }
  
  
</script>
  
<table>
  <tr>
    <th>이미지</th>
    <th>닉네임</th>
    <th>성별</th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly" id="image" name="image" value="${requestScope.member.image}"></th> 
    <th><input type="text" readonly="readonly" id="nickname" name="nickname" value="${requestScope.member.nickname}"></th>
    <th><input type="text" readonly="readonly" id="gender" name="gender" value="${requestScope.member.gender}"></th><p>
  </tr>
  <tr>
  	<th>주소</th>
  	
  </tr>
  <tr>
  	<th><input type="text" readonly="readonly" id="location" name="location" value="${requestScope.member.location}"></th>
  	<th><input type="text" readonly="readonly" id="location2" name="location2" value="${requestScope.member.location2}"></th><br>
 	</tr>
   <tr>
  	<th>이메일</th>
  	  <th><input type="text" readonly="readonly" id="email" name="email" value="${requestScope.member.email}"></th>
  </tr>
  
</table>
<input type="button" id="withdraw" value="탈퇴하기" onclick="withdraw()">
</body>
</html>