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
    <th><input type="text" readonly="readonly" id="image" value="${requestScope.members.image}"></th>
    <th><input type="text" readonly="readonly" id="nickname" value="${requestScope.members.nickname}"></th>
    <th><input type="text" readonly="readonly" id="nickname" value="${requestScope.members.gender}"></th>
  </tr>
  <tr>
  	<th>주소</th>
  	<th>이메일</th>
    <th>가입날짜</th>
  </tr>
  <tr>
  	<th><input type="text" readonly="readonly" id="email" value="${requestScope.members.location}"></th>
  	<th><input type="text" readonly="readonly" id="email" value="${requestScope.members.location2}"></th>
    <th><input type="text" readonly="readonly" id="email" value="${requestScope.members.email}"></th>
    <th><input type="text" readonly="readonly" id="joinDate" value="${requestScope.members.joinDate}"></th>
  </tr>
</table>
<input type="button" id="withdraw" value="탈퇴하기" onclick="withdraw()">
</body>
</html>