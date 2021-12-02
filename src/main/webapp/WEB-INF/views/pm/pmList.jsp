<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>현재 접속중인 아이디 : ${member.id}</h3>
	쪽지 수신함
	<table>
		<tr>
			<th>발신인</th>
			<th>수신인</th>
			<th>제목</th>
			<th>내용</th>
			<th>수신일</th>
		</tr>	
		<c:forEach items="${postMessageList}" var="pm">
			<tr>
				<td>${pm.sendId}</td>
				<td>${pm.receiveId}</td>
				<td>${pm.title}</td>
				<td>${pm.content}</td>
				<td>${pm.sendDate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>