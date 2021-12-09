<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>게시물 등록</title>
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
  <link href="${pageContext.request.contextPath}/css/board/normal/normalregister.css" rel="stylesheet">

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
          <li><a href="${pageContext.request.contextPath}/index">홈</a></li>
          <li>커뮤니티</li>
        </ol>
        <h2>게시물 등록</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">
        <div class="row">

		  

		  <div class="col-lg-6" style="text-align: center; margin: 0 auto">
            <form action="${pageContext.request.contextPath}/board/normal/insert" method="post" enctype="multipart/form-data" name="registerForm" class="php-email-form" >
              <div class="form-group">
                <input type="text" class="form-control" name="title" placeholder="제목" required>
              </div>
              <div class="form-group mt-3">
                <select class="form-control" name="normalCategoryNo" style="font-size:14px; color:gray;">
                  <option value="0">카테고리 선택</option>
                  <option value="1">자유</option>
				  <option value="2">공략</option>
				  <option value="3">Q&A</option>
				  <option value="4">정보</option>
				  <option value="5">예판/핫딜</option>
                </select>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="content" rows="10" placeholder="내용을 입력하세요" required></textarea>
              </div>
              <div class="form-group mt-3">
                <input class="form-control" type="file" name="filename" multiple style="font-size:14px; color:gray;">
              </div>
              <div class="text-center mt-3"><input type="submit" value="등록하기"></div>
            </form>
          </div>
                  </div>

      </div>

    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>
</html>