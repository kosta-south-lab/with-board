<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 등록 form -->
<form action="${pageContext.request.contextPath}/board/news/update" method="post" name="registerForm">
	<input type="hidden" name="boardNo" value="${news.boardNo}">
	제목 : 
	<input type="text" name="title" value="${news.title}"> 
	<p>

	내용 :<p>
	<textarea rows="20" cols="100" name="content">${news.content}</textarea>
	<p>
	<input type="submit" value="수정하기">
	<input type="button" value="돌아가기" onclick="history.back()">
</form>

</body>
</html>