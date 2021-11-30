<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시물 등록</title>
</head>
<body>
<!-- 등록 form -->
<form action="${pageContext.request.contextPath}/board/normal/insert" method="post" name="registerForm">
	제목 : 
	<input type="text" name="title"> 
	<p>
	카테고리 : 
	<select name="normalCategoryNo">
		<option value="1">자유</option>
		<option value="2">공략</option>
		<option value="22">Q&A</option>
		<option value="23">정보</option>
		<option value="24">예판/핫딜</option>
	</select>
<p>
	내용 :<p>
	<textarea rows="20" cols="100" name="content"></textarea>
	<p>
	<input type="submit" value="작성하기">
	<input type="button" value="돌아가기" onclick="history.back()">
</form>


</body>
</html>