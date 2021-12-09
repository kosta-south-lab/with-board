<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>meetList</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <link href="${pageContext.request.contextPath}/css/board/meet/meetList.css" rel="stylesheet">
</head>

<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <ol>
          <li><a href="${pageContext.request.contextPath}/board/matchBoard/matchBoardList">board</a></li>
          <li>matchboard</li>
        </ol>
        <h2>On The Board</h2>
      </div>
    </section><!-- End Breadcrumbs -->

  
 
    <section id="pricing" class="pricing">
      <div class="container" style="position:relative;">
      	<input type="hidden" value="${sessionScope.member.id}" id="loginId">
      	<button id="gowrite" >글쓰기</button>
        <div class="row">
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
					<div class="col-lg-4 p-3">
			            <div class="box">
			              <h3>${matchBoard.location}</h3>
			              <h4>${matchBoard.title}<span>${matchBoard.location2}</span></h4>
			              <ul>
			                <li><i class="bx bx-check"></i>글번호 : ${matchBoard.boardNo}</li>
			                <li><i class="bx bx-check"></i>작성자 : ${matchBoard.member.nickname}</li>
			                <li><i class="bx bx-check"></i> 조회수 : ${matchBoard.viewCount}</li>
			                <fmt:parseDate value="${matchBoard.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
			                <li><i class="bx bx-check"></i> 등록일 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedDateTime}"/></li>
			              </ul>
			              <a href="${pageContext.request.contextPath}/board/matchBoard/read/${matchBoard.boardNo}" class="buy-btn">상세보기</a>
			            </div>
			            </div>
				</c:forEach>
			</c:otherwise>
		 </c:choose>       
        </div>
      </div>
   </section><!-- End Pricing Section -->
	<!-- 이전, 다음 표시 하기 (한블럭당 페이지 개수 제한)  -->
	<c:set var="doneLoop" value="false" />

	<!--  블럭당  -->
	<!--  <nav class="pagination-container"> -->
	
</main><!-- End #main -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
	$(function() {
		$('#gowrite').click(function() {
			if($('#loginId').val() == '') {
				alert('로그인 후 이용해주세요');
				location.href='${pageContext.request.contextPath}/user/loginForm';
			}else {
				location.href='${pageContext.request.contextPath}/board/matchBoard/registerForm';
			}
		})
	})
</script>
</body>

</html>