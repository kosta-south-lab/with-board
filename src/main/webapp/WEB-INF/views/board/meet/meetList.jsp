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
          <li><a href="index.html">board</a></li>
          <li>meet</li>
        </ol>
        <h2>meet</h2>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Pricing Section ======= -->
    <section id="portfolio" class="portfolio p-1 blog">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="<c:if test="${ meetCategoryNo == 1}">filter-active</c:if>" onclick="location.href='${pageContext.request.contextPath}/board/meet?meetCategoryNo=1'">정기모임모집</li>
              <li data-filter=".filter-app" class="<c:if test="${ meetCategoryNo == 2}">filter-active</c:if>" onclick="location.href='${pageContext.request.contextPath}/board/meet?meetCategoryNo=2'">정기모임후기</li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12 d-flex sidebar-item search-form justify-content-center">
            <form action="${pageContext.request.contextPath}/board/meet" method="get" class="d-flex">
              <input type="hidden" name="meetCategoryNo" value="${meetCategoryNo}">
              <select name = "searchOption" class="inputform mx-1">
                <option id="title" value = "title">제목</option>
                <option id="user" value = "nickname">작성자</option>
                <option id="user" value = "location">지역</option>
              </select>
              <div class="inputform mx-1">
                <input type="text" name="keyword">
                <button type="submit"><i class="bi bi-search"></i></button>
              </div>
            </form>
          
          </div>
        </div>
      </div>
    </section>
    <section id="pricing" class="pricing">
      <div class="container" style="position:relative;">
      	<input type="hidden" value="${sessionScope.member.id}" id="loginId">
      	<button id="gowrite">글쓰기</button>
        <div class="row">
          <c:choose>
			<c:when test="${empty requestScope.meetList}">
				<tr>
					<td colspan="6">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 게시글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="meet" items="${meetList.content}">
					<div class="col-lg-4 p-3">
			            <div class="box">
			              <h3>${meet.meetCategory.meetCategoryName}</h3>
			              <h4 id="title">${meet.title}<span>${meet.location2}</span></h4>
			              <ul>
			                <li><i class="bx bx-check"></i>글번호 : ${meet.boardNo}</li>
			                <li><i class="bx bx-check"></i>작성자 : ${meet.member.nickname}</li>
			                <li><i class="bx bx-check"></i> 조회수 : ${meet.viewCount}</li>
			                <fmt:parseDate value="${meet.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
			                <li><i class="bx bx-check"></i> 등록일 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedDateTime}"/></li>
			              </ul>
			              <a href="${pageContext.request.contextPath}/board/meet/read/${meet.boardNo}" class="buy-btn">상세보기</a>
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
	<nav class="pagination-container">
		<div class="pagination">
			<c:set var="doneLoop" value="false" />

			<c:if test="${(startPage-blockCount) > 0}">
				<!-- (-2) > 0  -->
				<a class="pagination-newer"
					href="${pageContext.request.contextPath}/board/meet?nowPage=${startPage-1}&meetCategoryNo=${meetCategoryNo}&searchOption=${searchOption}&keyword=${keyword}">-PREV-</a>
			</c:if>

			<span class="pagination-inner"> 
				<c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'>
					<c:if test="${(i-1)>=meetList.getTotalPages()}">
						<c:set var="doneLoop" value="true" />
					</c:if>

					<c:if test="${not doneLoop}">
						<a class="${i==nowPage?'pagination-active':page}"
							href="${pageContext.request.contextPath}/board/meet?nowPage=${i}&meetCategoryNo=${meetCategoryNo}&searchOption=${searchOption}&keyword=${keyword}">${i}</a>
					</c:if>
				</c:forEach>
			</span>

			<c:if test="${(startPage+blockCount)<=normalList.getTotalPages()}">
				<a class="pagination-older"
					href="${pageContext.request.contextPath}/board/meet?nowPage=${startPage+blockCount}&meetCategoryNo=${meetCategoryNo}&searchOption=${searchOption}&keyword=${keyword}">-NEXT-</a>
			</c:if>
		</div>
	</nav>
</main><!-- End #main -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
	$(function() {
		$('#gowrite').click(function() {
			if($('#loginId').val() == '') {
				alert('로그인 후 이용해주세요');
				location.href='${pageContext.request.contextPath}/user/loginForm';
			}else {
				location.href='${pageContext.request.contextPath}/board/meet/registerForm';
			}
		})
	})
</script>
</body>

</html>