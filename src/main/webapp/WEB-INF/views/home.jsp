<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> HOME 화면 입니다. </title>
</head>
<body>
	
	<h1>여기는 home화면 입니다.</h1>
	
  <!-- <h3>${member.getId()}님 반갑습니다.</h3>-->
  
    <h3>${sessionScope.member.getNickname()}님 반갑습니다.</h3>
	
	
	<h3>test page</h3>
	<a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a>


	<c:if test="${!empty nickname}">
	<a href="/user/logout2">로그아웃</a>
	</c:if>
	<c:if test="${empty nickname}">
	<a href="/user/loginForm">로그인</a>
	</c:if>
	

</body>
</html>