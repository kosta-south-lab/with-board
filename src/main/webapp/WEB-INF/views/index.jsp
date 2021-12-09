<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="common/header.jsp" />
<html lang="en">

<head>

<title>위보드 | 함께하는 즐거운 보드게임 커뮤니티</title>

<style type="text/css">

#main_comment{

color : #093040;

}

</style>

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
                <h2 class="animate__animated animate__fadeInDown">함께하는 즐거운 보드게임 커뮤니티 <span>위보드</span></h2>
                <p class="animate__animated animate__fadeInUp" id="main_comment">위보드 (with Board)는 보드게임을 사랑하는 사람들과 함께하는 
					보드게임 커뮤니티를 지향하고자 시작된 프로젝트입니다.
					다양한 정보와 커뮤니케이션을 제공하여 보드게임 플레이의 경험 유무와 상관없이 
					누구나 쉽게 접목하고 즐길 수 있는 보드게임 문화를 가꾸어 나가는 것을 목표로 삼고 있습니다.
					</p>
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
              <h3><a href="">보드게임에 대한 즐거움을 알려 드립니다!</a></h3>
              <p>새로운 취미가 필요하신 분들께 보드게임을 소개해 드리고자 합니다!</p>
            </div>
          </div>
          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="icon-box">
              <i class="bi bi-bar-chart"></i>
              <h3><a href="">정보 부족에 대한 해소를 위보드에서!</a></h3>
              <p>회원 가입을 통해 더 많은 보드게임 정보와 커뮤니티를 이용해 보세요!</p>
            </div>
          </div>
          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="icon-box">
              <i class="bi bi-binoculars"></i>
              <h3><a href="">보다 더 큰 즐거움을 다 같이!</a></h3>
              <p>온 더 보드 게시판을 이용해 원하는 때와 장소에서 함께 보드게임을 즐겨요!</p>
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
              <p>※위보드 공지사항※</p>
            </div>
          </div>
	
          <div class="col-lg-4 col-md-6  mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon"><img class="icon_img" src ="${pageContext.request.contextPath}/img/indexlogo/normallogo.png"/></div>
              <h4><a href="${pageContext.request.contextPath}/board/normal/normalList">일반 게시판</a></h4>
              <p>※자유/공략/Q&A/정보/핫딜※</p>
            </div>
          </div>

          <div id="featured_icon_container" class="col-lg-4 col-md-6  mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon"><img class="icon_img" src ="${pageContext.request.contextPath}/img/indexlogo/gamelogo.png"/></div>
              <h4><a href="${pageContext.request.contextPath}/game/searchGameList">보드게임 목록</a></h4>
              <p>※테마별 보드게임※</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6  mt-4">
            <div class="icon-box">
              <div class="icon"><img class="icon_img" src ="${pageContext.request.contextPath}/img/indexlogo/meetlogo.png"/></div>
              <h4><a href="${pageContext.request.contextPath}/board/meet">정기 모임</a></h4>
              <p>※Every week with board※</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6  mt-4">
            <div class="icon-box">
              <div class="icon"><img class="icon_img" src ="${pageContext.request.contextPath}/img/indexlogo/matchlogo.png"/></div>
              <h4><a href="${pageContext.request.contextPath}/board/matchBoard/matchBoardList">매칭 게시판</a></h4>
              <p>※Right now with board※</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6  mt-4">
            <div class="icon-box">
              <div class="icon"><img class="icon_img" src ="${pageContext.request.contextPath}/img/indexlogo/04logo.png"/></div>
              <h4>서비스 준비중</h4>
              <p>※중고거래 게시판※</p>
            </div>
          </div>


        </div>

      </div>
    </section><!-- End Services Section -->

  </main><!-- End #main -->

</body>

</html>
<jsp:include page="common/footer.jsp" />