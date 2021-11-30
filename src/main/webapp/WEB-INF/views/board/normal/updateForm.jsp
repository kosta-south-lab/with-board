<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>

<!-- 등록 form -->
<form action="${pageContext.request.contextPath}/board/normal/update" method="post" name="registerForm">
	<input type="hidden" name="boardNo" value="${normal.boardNo}">
	제목 : 
	<input type="text" name="title" value="${normal.title}"> 
	<p>
	카테고리 : 
	<select name="normalCategoryNo">
		<option value="1" <c:if test="${normal.normalCategory.normalCategoryNo == 1}">selected</c:if>>자유</option>
		<option value="2" <c:if test="${normal.normalCategory.normalCategoryNo == 2}">selected</c:if>>공략</option>
		<option value="22" <c:if test="${normal.normalCategory.normalCategoryNo == 22}">selected</c:if>>Q&A</option>
		<option value="23" <c:if test="${normal.normalCategory.normalCategoryNo == 23}">selected</c:if>>정보</option>
		<option value="24" <c:if test="${normal.normalCategory.normalCategoryNo == 24}">selected</c:if>>예판/핫딜</option>
	</select>

	내용 :<p>
	<textarea rows="20" cols="100" name="content">${normal.content}</textarea>
	<p>
	<input type="submit" value="수정하기">
	<input type="button" value="돌아가기" onclick="history.back()">
</form>

</body>
</html>