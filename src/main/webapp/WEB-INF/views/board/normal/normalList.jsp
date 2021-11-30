<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 목록</title>
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
			<td colspan="2">
				<div align="left">
					<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList?normalCategoryNo=1'">자유</button>
					<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList?normalCategoryNo=2'">공략</button>
					<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList?normalCategoryNo=3'">Q&A</button>
					<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList?normalCategoryNo=4'">정보</button>
					<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList?normalCategoryNo=5'">예판/핫딜</button>
				</div>
			</td>
			<td colspan="5">
				<form action="${pageContext.request.contextPath}/board/normal/normalList" method="get">			
					<input type="hidden" name="normalCategoryNo" value="${normalCategoryNo}">
					<div align="right">
						<select name = "searchOption" id=searchs>
		                    <option id="title" class="btn btn-outline-dark" value = "title">제목</option>
		                	<option id="user" class="btn btn-outline-dark" value = "writer">작성자</option>
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
 	          <td valign="middle">
	            <p align="center"><font color="black"><h6>카테고리</h6></font></p>
	        </td> 
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>제목</h6></font></p>
	        </td>
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>작성자</h6></font></p>
	        </td>
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>조회수</h6></font></p>
	        </td>
	        
	        <td valign="middle">
	            <p align="center"><font color="black"><h6>등록날짜</h6></font></p>
	    	</td>
	    </tr>
	
		<c:choose>
			<c:when test="${empty requestScope.normalList}">
				<tr>
					<td colspan="6">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 게시글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="normal" items="${normalList}">
					<tr onmouseover="this.style.background='#eaeaea'"
						onmouseout="this.style.background='white'">
	
						<!-- 번호 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${normal.boardNo}</span>
						</td>
	
						<!-- 카테고리 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${normal.normalCategory.normalCategoryName}</span>
						</td> 
	
						<!-- 제목 -->
						<td bgcolor="" align="center"><a href="${pageContext.request.contextPath}/board/normal/read/${normal.boardNo}"> <span
								style="font-size: 11pt;">${normal.title}</span>
						</a></td>
	
						<!-- 작성자 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${normal.member.name}</span>
						</td>
	
						<!-- 조회수 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${normal.viewCount}</span>
						</td>
	
						<!-- 등록날짜 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${normal.regdate}</span>
						</td>
	
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<hr>
	<div align=right>
		<button type="submit" class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/board/normal/registerForm'">글쓰기</button>
	</div>
</body>
</html>
