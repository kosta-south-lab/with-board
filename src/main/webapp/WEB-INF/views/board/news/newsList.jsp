<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>공지게시판 목록</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/css/board/news/newsList.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Eterna - v4.7.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <jsp:include page="/WEB-INF/views/common/header.jsp" />

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <ol>
          <li><a href="index.html">board</a></li>
          <li>공지게시판</li>
        </ol>
        <h2>공지게시판</h2>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Pricing Section ======= -->

        <div class="row">
          <div class="col-lg-12 d-flex sidebar-item search-form justify-content-center">
            <form action="${pageContext.request.contextPath}/board/news/newsList" method="get" class="d-flex">
              <select name = "searchOption" class="inputform mx-1">
                <option id="title" value = "title">제목</option>
                <option id="user" value = "nickname">작성자</option>
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
      	<button id="gowrite" onClick="location.href='${pageContext.request.contextPath}/board/news/registerForm'">글쓰기</button>
        <div class="row">
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
					<div class="col-lg-4 p-3">
			            <div class="box">
			              <h4>${news.title}</h4>
			              <ul>
			                <li><i class="bx bx-check"></i>글번호 : ${news.boardNo}</li>
			                <li><i class="bx bx-check"></i>작성자 : ${news.member.nickname}</li>
			                <li><i class="bx bx-check"></i> 조회수 : ${news.viewCount}</li>
			                <li><i class="bx bx-check"></i> 등록일 : ${news.regdate}</li>
			              </ul>
			              <a href="${pageContext.request.contextPath}/board/news/read/${news.boardNo}" class="buy-btn">상세보기</a>
			            </div>
			        </div>
				</c:forEach>
			</c:otherwise>
		 </c:choose>       
        </div>
      </div>
    </section><!-- End Pricing Section -->
    
    <!-- 이전, 다음 표시 하기 (한블럭당 페이지 개수 제한)  -->
 <c:set var="doneLoop" value="false"/>
 
		<!--  블럭당  -->
<!--  <nav class="pagination-container"> -->
<nav class="pagination-container">
	<div class="pagination">
	<c:set var="doneLoop" value="false"/>
		
		  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
		      <a class="pagination-newer"
					href="${pageContext.request.contextPath}/board/news/newsList?nowPage=${startPage-1}&searchOption=${searchOption}&keyword=${keyword}">-PREV-</a>
		  </c:if>
		  
				<span class="pagination-inner"> 
				  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
				  
					 <c:if test="${(i-1)>=normalList.getTotalPages()}">
					       <c:set var="doneLoop" value="true"/>
					    </c:if>    
				    
				  <c:if test="${not doneLoop}" >
				         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/board/news/newsList?nowPage=${i}&searchOption=${searchOption}&keyword=${keyword}">${i}</a> 
				  </c:if>
				   
				</c:forEach>
				</span> 

				 <c:if test="${(startPage+blockCount)<=normalList.getTotalPages()}">
				     <a class="pagination-older" href="${pageContext.request.contextPath}/board/news/newsList?nowPage=${startPage+blockCount}&searchOption=${searchOption}&keyword=${keyword}">-NEXT-</a>
				 </c:if>
		</div>
    </nav>

  </main><!-- End #main -->

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>