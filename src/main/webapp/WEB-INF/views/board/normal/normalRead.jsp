<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세페이지</title>
</head>
<body>

<div>
		<b>제목</b> : ${normal.title}
	</div>
	<div>
		<b>조회수</b> : ${normal.viewCount}
	</div>
	<div>
		<b>작성자</b> : ${normal.member.name}
	</div>

	<div>
		<b>카테고리</b> : ${normal.normalCategory.normalCategoryName}
	</div>
	<div>
		<div>
			<b>내용</b> : 
			${normal.content}
		</div>
	</div>
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/normal/updateForm/${normal.boardNo}'">수정하기</button>
	</div>
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList'">리스트로 돌아가기</button>
	</div>
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/normal/delete/${normal.boardNo}'">삭제</button>
	</div>

</body>
</html>