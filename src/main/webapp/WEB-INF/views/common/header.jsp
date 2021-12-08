<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="description">
  <meta content="" name="keywords">
  
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
  <script type="text/javascript">
  
  
  

  function logout(){ //취소하기 눌렀을때
  		if(confirm("로그아웃 하시겠습니까?") == true){
  			parent.location.href = "/user/loginForm";
  		 }
  	}

</script>

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
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Eterna - v4.7.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

 <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
      <c:if test="${!empty sessionScope.member.nickname}">
        <i class="bi bi-envelope d-flex align-items-center">
        <a href="${pageContext.request.contextPath}/user/mypage">${sessionScope.member.id} 님 환영합니다!</a>
        </i>
       </c:if>
      </div>
      
      <div class="social-links d-none d-md-flex align-items-center">
		<c:if test="${!empty sessionScope.member.nickname}">
		<a href="/user/logout2" onclick="logout();">로그아웃</a>
		</c:if>
		<c:if test="${empty sessionScope.member.nickname}">
		<a href="/user/loginForm">로그인</a>
		</c:if>
		<c:if test="${empty sessionScope.member.nickname}">
        <a href="${pageContext.request.contextPath}/user/signupForm" class="signup">회원가입</a>
        </c:if>
        <c:if test="${!empty sessionScope.member.nickname}">
        <a href="#" class="signup"></a>
        </c:if>
        
        <c:if test="${!empty sessionScope.member.nickname}">
        <a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a>
        <c:if test="${empty sessionScope.member.nickname}">
		<a href="#"></a>
		</c:if>
        </c:if>
      </div>
    </div>
  </section>

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between align-items-center">

      <div class="logo">
		<a href="/index"><img src="${pageContext.request.contextPath}/img/withboard_logo_basic.png" alt="withBoard" width="30%" height="30%"></a>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="${pageContext.request.contextPath}/sample/index">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/sample/about">About</a></li>
          <li><a href="${pageContext.request.contextPath}/sample/services">Services</a></li>
          <li><a href="${pageContext.request.contextPath}/sample/portfolio">Portfolio</a></li>
          <li><a href="${pageContext.request.contextPath}/sample/team">Team</a></li>
          <li><a href="${pageContext.request.contextPath}/sample/pricing">Pricing</a></li>
          <li><a class="active" href="${pageContext.request.contextPath}/sample/blog">Blog</a></li>
          <li class="dropdown"><a href="${pageContext.request.contextPath}/game/gameList"><span>보드 게임</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="${pageContext.request.contextPath}/game/searchGameList"><span>보드 게임</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          <li><a href="${pageContext.request.contextPath}/sample/contact">Contact</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->



</body>

</html>