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
			<td colspan="5">
				<form action="${pageContext.request.contextPath}/board/news/newsList" method="get">
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
			<c:when test="${empty requestScope.newsList}">
				<tr>
					<td colspan="6">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 게시글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="news" items="${newsList.content}">
					<tr onmouseover="this.style.background='#eaeaea'"
						onmouseout="this.style.background='white'">
	
						<!-- 번호 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${news.boardNo}</span>
						</td>
	
						<!-- 제목 -->
						<td bgcolor="" align="center"><a href="${pageContext.request.contextPath}/board/news/read/${news.boardNo}"> <span
								style="font-size: 11pt;">${news.title}</span>
						</a></td>
	
						<!-- 작성자 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${news.member.name}</span>
						</td>
	
						<!-- 조회수 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${news.viewCount}</span>
						</td>
	
						<!-- 등록날짜 -->
						<td bgcolor="" align="center"><span style="font-size: 11pt;">${news.regdate}</span>
						</td>
	
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<hr>
	
	${newsList.hasPrevious()}  /  ${newsList.hasNext()}
<div style="text-align: center">
<!-- 페이징 처리 -->
 <c:forEach begin="0" end="${newsList.totalPages-1}" var="i">
   <c:choose>
     <c:when test="${newsList.number==i}">
         <a href="${pageContext.request.contextPath}/board/news/newsList?nowPage=${i}" style="color:red"> [ ${i+1} ] </a>
     </c:when>
     <c:otherwise>
         <a href="${pageContext.request.contextPath}/board/news/newsList?nowPage=${i}"> [ ${i+1} ] </a>
     </c:otherwise>
   </c:choose>
 </c:forEach>
</div>
	
<!-- 이전, 다음 표시 하기 (한블럭당 페이지 개수 제한)  -->
 <c:set var="doneLoop" value="false"/>
	\${doneLoop} = ${doneLoop}<p>
		<!--  블럭당  -->
<!--  <nav class="pagination-container"> -->
	<div class="pagination">
	<c:set var="doneLoop" value="false"/>
		
		  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
		      <a class="pagination-newer" href="${pageContext.request.contextPath}/board/news/newsList?nowPage=${startPage-1}">PREV</a>
		  </c:if>
		  
				<span class="pagination-inner"> 
				  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
				  
					 <c:if test="${(i-1)>=newsList.getTotalPages()}">
					       <c:set var="doneLoop" value="true"/>
					    </c:if>    
				    
				  <c:if test="${not doneLoop}" >
				         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/board/news/newsList?nowPage=${i}">${i}</a> 
				  </c:if>
				   
				</c:forEach>
				</span> 

				 <c:if test="${(startPage+blockCount)<=newsList.getTotalPages()}">
				     <a class="pagination-older" href="${pageContext.request.contextPath}/board/news/newsList?nowPage=${startPage+blockCount}">NEXT</a>
				 </c:if>
				 
			
		
		</div>
<!-- 	</nav>   -->
	\${doneLoop} = ${doneLoop}<p>
	
	<div align=right>
		<button type="submit" class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/board/news/registerForm'">글쓰기</button>
	</div>
</body>
</html>
