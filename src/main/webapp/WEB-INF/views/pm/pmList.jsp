<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$('a').click(function() {
			var postMessageNo = $(this).attr('data-value');
			window.open("${pageContext.request.contextPath}", "쪽지상세보기", "width=500px,height=250px,scrollbars=yes");
		})
	})
</script>
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
			<th>확인여부</th>
		</tr>	
		<c:forEach items="${postMessageList}" var="pm">
			<tr>
				<td>${pm.sendId}</td>
				<td>${pm.receiveId}</td>
				<td><a href="#" data-value="${pm.postMessageNo}">${pm.title}</a></td> <!-- 커스텀 데이타 -->
				<td>${pm.content}</td>
				<td>${pm.sendDate}</td>
				<td>${pm.recvCheck}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>