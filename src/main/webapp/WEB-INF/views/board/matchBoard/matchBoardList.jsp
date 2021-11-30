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
			
			<td colspan="5">
				<form action="${pageContext.request.contextPath}/board/matchBoard" method="get">			
					
					<div align="right">
						<select name = "searchOption" id=searchs>
		                    <option id="title" class="btn btn-outline-dark" value = "title">제목</option>
		                	<option id="user" class="btn btn-outline-dark" value = "writer">작성자</option>
		                	<option id="user" class="btn btn-outline-dark" value = "location">지역</option>
		                </select>
						<input type = "text" id = "searchByTitle" placeholder="검색어를 입력하세요" name="keyword">
		           		 <button>검색</button>
					</div>
				</form>
			</td>
		</tr>
		<tr class="table-primary">
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>번호</h6></font></p>
	        </td>
	        <td>
	        	<p align="center"><font color="black"><h6>지역</h6></font></p>
	        </td>
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>제목</h6></font></p>
	        </td>
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>작성자</h6></font></p>
	        </td>
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>조건</h6></font></p>
	        </td>
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>인원수</h6></font></p>
	        </td>     
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>등록날짜</h6></font></p>
	    	</td>
	    </tr>
	
		<c:choose>
			<c:when test="${empty requestScope.matchBoardList}">
				<tr>
					<td colspan="6">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 게시글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="matchBoard" items="${matchBoardList}">
					<tr onmouseover="this.style.background='#eaeaea'"
						onmouseout="this.style.background='white'">
	
						<!-- 번호 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${matchBoard.boardNo}</span>
						</td>
	
						<!-- 지역 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${matchBoard.location} ${meet.location2}</span>
						</td>
						
			
	
						<!-- 제목 -->
						<td bgcolor="" align="center"><a href="${pageContext.request.contextPath}/board/matchBoard/read/${matchBoard.boardNo}"> <span
								style="font-size: 11pt;">${matchBoard.title}</span>
						</a></td>
	
						<!-- 작성자 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${matchBoard.member.name}</span>
						</td>
	
						<!-- 조건 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${matchBoard.etc}</span>
						</td>
						
						<!-- 등록인원 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${matchBoard.headcount}</span>
						</td>
	
						<!-- 등록날짜 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${matchBoard.regdate}</span>
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