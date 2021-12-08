<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>게시물 상세</title>
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
  <link href="${pageContext.request.contextPath}/css/board/normal/normalRead.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Eterna - v4.6.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
     
  
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
        <h2>글 상세보기</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Contact Section =======class="contact pricing"   class="container rounded bg-white mt-5 mb-5"-->
    <section id="contact" class="container rounded bg-white mt-5 mb-5">
      <div class="container">
        <div class="row">

          <div class="col-lg-6">
              <div class="box" >
                <h4>${normal.title}
                <ul>
                  <li><i class="bx bx-check"></i>글번호 : ${normal.boardNo}</li>
                  <li><i class="bx bx-check"></i> 조회수 : ${normal.viewCount}</li>
                  <li><i class="bx bx-check"></i>작성자 : ${normal.member.name}</li>
                  <li><i class="bx bx-check"></i> 카테고리 : ${normal.normalCategory.normalCategoryName}</li>
                  <fmt:parseDate value="${normal.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                  <li><i class="bx bx-check"></i> 등록일 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedDateTime}"/></li>
                  <li>${normal.content}</li>
                </ul>
                <c:if test="${normal.member.id == sessionScope.member.id}">
	                <button class="bottom-btn" onclick="location.href='${pageContext.request.contextPath}/board/normal/updateForm/${normal.boardNo}'">수정</button>
    	            <button class="bottom-btn" onclick="location.href='${pageContext.request.contextPath}/board/normal/delete/${normal.boardNo}'">삭제</button>
                </c:if>
              </div>
          </div>
        </div>

      </div>
    </section><!-- End Contact Section -->
    <section id="portfolio" class="portfolio clients" style="padding-bottom: 10px;">
      <div class="container">
        <div class="section-title">
          <h2>Photos</h2>
        </div>

        <div class="row portfolio-container">
		  <c:forEach items="${normal.imageList}" var="image">
          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${pageContext.request.contextPath}${image.imageUrl}" class="img-fluid" alt="" style="width:100%">
              <div class="portfolio-info">
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath}${image.imageUrl}" data-gallery="portfolioGallery" class="portfolio-lightbox" title=""><i class="bx bx-plus"></i></a>
                </div>
              </div>
            </div>
          </div>
          </c:forEach>

        </div>

      </div>
    </section><!-- End Portfolio Section -->
    <!-- ======= Blog Single Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">
        <div class="row">
          <div class="col-lg-8 entries">
            <div class="blog-comments">
              <h4 class="comments-count">
              <c:choose>
              	<c:when test="${empty normal.replyList}">0</c:when>
              	<c:otherwise>
              		${fn:length(normal.replyList)}
              	</c:otherwise>
              </c:choose>
			  개의 댓글이 달렸어요
			  </h4>
       
              <c:forEach items="${normal.replyList}" var="reply">
	              <div id="comment-1" class="comment">
	                <div class="d-flex">
	                  <div class="comment-img"><img src="${pageContext.request.contextPath}/resources/images/profile/profile.png" alt="프로필이미지"></div>
	                  <div>
	                    <h5 class="d-flex justify-content-between">
	                    	<a href="">${reply.member.name}</a>
	                    	<c:if test="${reply.member.id == sessionScope.member.id}">
		                    	<button type="submit" class="btn btn-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/board/reply/delete/${reply.replyNo}?boardType=normal&boardNo=${normal.boardNo}'">삭제</button>
	                    	</c:if>
	                    </h5>
	                    <fmt:parseDate value="${reply.replyDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedReplyDateTime" type="both"/>
	                    <time><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedReplyDateTime}"/></time>
	                    <p>
	                      ${reply.replyContent}
	                    </p>
	                  </div>
	                </div>
	              </div><!-- End comment #1 -->
			  </c:forEach>
			  
			  

              <div class="reply-form">
              <c:if test="${!empty sessionScope.member.id}">
                <h4>댓글을 남겨주세요!</h4>
                <form action="${pageContext.request.contextPath}/board/reply/insert" method = "post">
              
                  <!-- 댓글달고 각각의 글 상세 페이지로 넘어오기 위함 -->
				  <input type="hidden" name="boardNo" value="${normal.boardNo}">
				  <input type="hidden" name="boardType" value="normal">
				  
                  <div class="row">
                    <div class="col form-group">
                      <textarea name="replyContent" class="form-control" placeholder="댓글 내용"></textarea>
                    </div>
                  </div>
                  <button type="submit" class="btn btn-primary">댓글 달기</button>
               </form>
	                <p>
				</c:if>
			   	<div>
					<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/normal/normalList'">리스트로 돌아가기</button>
				</div>
              </div>

            </div><!-- End blog comments -->

          </div><!-- End blog entries list -->
        </div>

      </div>
    </section><!-- End Blog Single Section -->

  </main><!-- End #main -->

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>