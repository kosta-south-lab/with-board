<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th, td{
		padding: 10px 20px;
		text-align: center;
	}
</style>
</head>
<body>
	
	<table class="table">
	    <tr>
			
			
		</tr>
		<tr class="table-primary">
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>방번호</h6></font></p>
	        </td>
	        <td>
	        	<p align="center"><font color="black"><h6>제목</h6></font></p>
	        </td>
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>입장</h6></font></p>
	        </td>
	       
	    </tr>
	
		<c:choose>
			<c:when test="${empty requestScope.joinMatchList}">
				<tr>
					<td colspan="6">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 게시글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="joinMatch" items="${joinMatchList}">
					<tr onmouseover="this.style.background='#eaeaea'"
						onmouseout="this.style.background='white'">
	
						<!-- 번호 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${joinMatch.joinMatchNo}</span>
						</td>
	
	
						<!-- 제목 -->
						<td bgcolor="" align="center"><a href="${pageContext.request.contextPath}/board/matchBoard/read/${matchBoard.boardNo}"> <span
								style="font-size: 11pt;">${matchBoard.joinMatchTitle}</span>
						</a></td>
	
						
						<!-- 지역 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${joinMatch.joinMatchTitle}</span>
						</td>
						
			
	
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<hr>
	<div align=right>
		<button type="submit" class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/board/matchBoard/registerForm'">글쓰기</button>
	</div>
</body>
</html>