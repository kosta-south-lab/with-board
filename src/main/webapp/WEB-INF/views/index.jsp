<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="common/header.jsp" />
<html lang="en">

<head>

<title>위보드 | 함께하는 즐거운 보드게임 커뮤니티</title>

</head>

<body>

  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
      <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

        <div class="carousel-inner" role="listbox">

          <!-- Slide 1 -->
          <div class="carousel-item active" style="background: url(${pageContext.request.contextPath}/img/slide/main.png)">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">Welcome to <span>Eterna</span></h2>
                <p class="animate__animated animate__fadeInUp">Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea voluptatem. Esse doloremque accusamus repellendus deleniti vel. Minus et tempore modi architecto.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Featured Section ======= -->
    <section id="featured" class="featured">
      <div class="container">

        <div class="row">
          <div class="col-lg-4">
            <div class="icon-box">
              <i class="bi bi-card-checklist"></i>
              <h3><a href="">Lorem Ipsum</a></h3>
              <p>Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
            </div>
          </div>
          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="icon-box">
              <i class="bi bi-bar-chart"></i>
              <h3><a href="">Dolor Sitema</a></h3>
              <p>Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
            </div>
          </div>
          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="icon-box">
              <i class="bi bi-binoculars"></i>
              <h3><a href="">Sed ut perspiciatis</a></h3>
              <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Featured Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="row">
        
          <div id="featured_icon_container" class="col-lg-4 col-md-6 ">
            <div class="icon-box">
              <div class="icon"><img class="icon_img" src ="${pageContext.request.contextPath}/img/indexlogo/newslogo.png"/></div>
              <h4><a href="${pageContext.request.contextPath}/board/news/newsList">공지사항</a></h4>
              <p>공지사항</p>
            </div>
          </div>
	
          <div class="col-lg-4 col-md-6  mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon"><img class="icon_img" src ="${pageContext.request.contextPath}/img/indexlogo/normallogo.png"/></div>
              <h4><a href="">일반 게시판</a></h4>
              <p></p>
            </div>
          </div>

          <div id="featured_icon_container" class="col-lg-4 col-md-6  mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon"><img class="icon_img" src ="${pageContext.request.contextPath}/img/indexlogo/gamelogo.png"/></div>
              <h4><a href="">게임</a></h4>
              <p></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6  mt-4">
            <div class="icon-box">
              <div class="icon"><img class="icon_img" src ="${pageContext.request.contextPath}/img/indexlogo/meetlogo.png"/></div>
              <h4><a href="">정기 모임</a></h4>
              <p></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6  mt-4">
            <div class="icon-box">
              <div class="icon"><img class="icon_img" src ="${pageContext.request.contextPath}/img/indexlogo/matchlogo.png"/></div>
              <h4><a href="">매칭 게시판</a></h4>
              <p></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6  mt-4">
            <div class="icon-box">
              <div class="icon"><img class="icon_img" src ="${pageContext.request.contextPath}/img/indexlogo/04logo.png"/></div>
              <h4>서비스 준비중</h4>
              <p>아아아아아아아아아아</p>
            </div>
          </div>


        </div>

      </div>
    </section><!-- End Services Section -->

  </main><!-- End #main -->

</body>

</html>
<jsp:include page="common/footer.jsp" />