<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>일반게시판 목록</title>
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
  <link href="${pageContext.request.contextPath}/css/board/normal/normalList.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Eterna - v4.7.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
   <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
  <script>
	$(function() {
		$('#gowrite').click(function() {
			if($('#loginId').val() == '') {
				alert('로그인 후 이용해주세요');
				location.href='${pageContext.request.contextPath}/user/loginForm';
			}else {
				location.href='${pageContext.request.contextPath}/board/normal/registerForm';
			}
		})
	})
</script>
  
</head>

<body>
  
  <jsp:include page="/WEB-INF/views/common/header.jsp" />

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <ol>
          <li><a href="${pageContext.request.contextPath}/index">홈</a></li>
          <li>일반게시판</li>
        </ol>
        <h2>일반게시판 목록</h2>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Pricing Section ======= -->
    <section id="portfolio" class="portfolio p-1 blog">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="<c:if test="${ normalCategoryNo == 1}">filter-active</c:if>" onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList?normalCategoryNo=1'">자유</li>
              <li data-filter=".filter-app" class="<c:if test="${ normalCategoryNo == 2}">filter-active</c:if>" onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList?normalCategoryNo=2'">공략</li>
              <li data-filter=".filter-app" class="<c:if test="${ normalCategoryNo == 3}">filter-active</c:if>" onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList?normalCategoryNo=3'">Q&A</li>
              <li data-filter=".filter-app" class="<c:if test="${ normalCategoryNo == 4}">filter-active</c:if>" onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList?normalCategoryNo=4'">정보</li>
              <li data-filter=".filter-app" class="<c:if test="${ normalCategoryNo == 5}">filter-active</c:if>" onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList?normalCategoryNo=5'">예판/핫딜</li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12 d-flex sidebar-item search-form justify-content-center">
            <form action="${pageContext.request.contextPath}/board/normal/normalList" method="get" class="d-flex">
            <input type="hidden" name="normalCategoryNo" value="${normalCategoryNo}">
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
      <input type="hidden" value="${sessionScope.member.id}" id="loginId">
      	<button id="gowrite">글쓰기</button>
        <div class="row">
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
				<c:forEach var="normal" items="${normalList.content}">
					<div class="col-lg-4 p-3">
			            <div class="box">
			              <h3>${normal.normalCategory.normalCategoryName}</h3>
			              <h4>${normal.title}</h4>
			              <ul>
			                <li><i class="bx bx-check"></i>글번호 : ${normal.boardNo}</li>
			                <li><i class="bx bx-check"></i>작성자 : ${normal.member.nickname}</li>
			                <li><i class="bx bx-check"></i> 조회수 : ${normal.viewCount}</li>
			                <fmt:parseDate value="${normal.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
			                <li><i class="bx bx-check"></i> 등록일 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedDateTime}"/></li>
			              </ul>
			              <a href="${pageContext.request.contextPath}/board/normal/read/${normal.boardNo}" class="buy-btn">상세보기</a>
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
					href="${pageContext.request.contextPath}/board/normal/normalList?nowPage=${startPage-1}&normalCategoryNo=${normalCategoryNo}&searchOption=${searchOption}&keyword=${keyword}">-PREV-</a>
		  </c:if>
		  
				<span class="pagination-inner"> 
				  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
				  
					 <c:if test="${(i-1)>=normalList.getTotalPages()}">
					       <c:set var="doneLoop" value="true"/>
					    </c:if>    
				    
				  <c:if test="${not doneLoop}" >
				         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/board/normal/normalList?nowPage=${i}&normalCategoryNo=${normalCategoryNo}&searchOption=${searchOption}&keyword=${keyword}">${i}</a> 
				  </c:if>
				   
				</c:forEach>
				</span> 

				 <c:if test="${(startPage+blockCount)<=normalList.getTotalPages()}">
				     <a class="pagination-older" href="${pageContext.request.contextPath}/board/normal/normalList?nowPage=${startPage+blockCount}&normalCategoryNo=${normalCategoryNo}&searchOption=${searchOption}&keyword=${keyword}">-NEXT-</a>
				 </c:if>
		</div>
    </nav>

  </main><!-- End #main -->

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  

</body>

</html>