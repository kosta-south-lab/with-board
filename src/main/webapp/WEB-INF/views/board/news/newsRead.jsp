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

<div>
		<b>제목</b> : ${news.title}
	</div>
	<div>
		<b>조회수</b> : ${news.viewCount}
	</div>
	<div>
		<b>작성자</b> : ${news.member.name}
	</div>

	<div>
		<div>
			<b>내용</b> : 
			${news.content}
		</div>
	<div>
	이미지 : 
		<c:forEach items="${news.imageList}" var="image">
			<img src="${pageContext.request.contextPath}${image.imageUrl}">
		</c:forEach>
	</div>
	</div>
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/news/updateForm/${news.boardNo}'">수정하기</button>
	</div>
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/news/delete/${news.boardNo}'">삭제</button>
	</div>
	
		<h2>댓글 목록</h2>
	<c:forEach items="${news.replyList}" var="reply">
		<b>${reply.replyContent}</b> <button onclick="location.href='${pageContext.request.contextPath}/board/reply/delete/${reply.replyNo}?boardType=news&boardNo=${news.boardNo}'">댓글삭제</button><br>
	</c:forEach>	
	<p>
	<form action="${pageContext.request.contextPath}/board/reply/insert" method = "post">
		
		<!-- 댓글달고 각각의 글 상세 페이지로 넘어오기 위함 -->
		<input type="hidden" name="boardNo" value="${news.boardNo}">
		<input type="hidden" name="boardType" value="news">
		댓글쓰기 <br>
		<textarea rows="5" cols="40" name="replyContent"></textarea>
		<input type="submit" value="댓글등록">
	</form>
	
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/news/newsList'">리스트로 돌아가기</button>
	</div>

</body>
</html>