<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 상세</title>
</head>
<body>
	
	<b>발신인</b> : ${postMessage.sendId} <br>
	<b>수신인</b> : ${postMessage.receiveId} <br>
	<b>제목</b> : ${postMessage.title} <br>
	<b>내용</b> : ${postMessage.content} <br>
	<b>수신일</b> : ${postMessage.sendDate}

</body>
</html>