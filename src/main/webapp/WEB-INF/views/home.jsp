<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>${nickname}님 반갑습니다.</h3>
	
	<h1>home</h1>
	<h2>home2</h2>
	
	<h3>김찬원 test</h3>

	<c:if test="${!empty nickname}">
	<a href="/user/logout2">로그아웃</a>
	</c:if>
	<c:if test="${empty nickname}">
	<a href="/user/loginForm">로그인</a>
	</c:if>
	
<%-- 	
	<c:if test="${pageContext.request.userPrincipal.name != null }">
	welcome ${pageContext.request.userPrincipal.name } ! <br>
	
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="logout"/>
	</form:form>	
	</c:if>
	<hr>
	<c:if test="${pageContext.request.userPrincipal.name == null}">
	<a href="<c:url value="/login" />"> login</a> <br>
	</c:if> --%>
	

</body>
</html>