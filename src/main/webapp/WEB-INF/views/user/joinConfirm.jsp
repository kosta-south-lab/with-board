<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>이메일 인증</title>

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
     
      </div>
      
      <div class="social-links d-none d-md-flex align-items-center">
		
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
						<li><a href="${pageContext.request.contextPath}/sample/index">홈</a></li>
						<li><a href="${pageContext.request.contextPath}/sample/about">공지사항</a></li>
						<li><a
							href="${pageContext.request.contextPath}/sample/services">커뮤니티</a></li>
						<li><a
							href="${pageContext.request.contextPath}/sample/portfolio">정기 모임</a></li>
						<li><a href="${pageContext.request.contextPath}/sample/team">온 더 보드</a></li>
						<li class="dropdown"><a
							href="${pageContext.request.contextPath}/game/searchGameList"><span>보드
									게임</span> <i class="bi bi-chevron-down"></i></a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/game/searchGameList/filterSearch?keyword=1">가족 게임</a></li>
								<li><a href="${pageContext.request.contextPath}/game/searchGameList/filterSearch?keyword=2">어린이 게임</a></li>
								<li><a href="${pageContext.request.contextPath}/game/searchGameList/filterSearch?keyword=3">전략 게임</a></li>
								<li><a href="${pageContext.request.contextPath}/game/searchGameList/filterSearch?keyword=4">전쟁 게임</a></li>
								<li><a href="${pageContext.request.contextPath}/game/searchGameList/filterSearch?keyword=5">추상 게임</a></li>
								<li><a href="${pageContext.request.contextPath}/game/searchGameList/filterSearch?keyword=6">커스터마이징 게임</a></li>
								<li><a href="${pageContext.request.contextPath}/game/searchGameList/filterSearch?keyword=7">테마 게임</a></li>
								<li><a href="${pageContext.request.contextPath}/game/searchGameList/filterSearch?keyword=8">파티 게임</a></li>
							</ul></li>
					</ul>
					<i class="bi bi-list mobile-nav-toggle"></i>
				</nav>
				<!-- .navbar -->

			</div></header><!-- End Header -->

</head>
<body>
		<h3>${requestScope.member.nickname}님 회원가입을 축하드립니다</h3>
		<p>모든 서비스를 이용하기 위해 이메일 인증을 완료하여 주세요</p>
		<button onclick="sendEmail(event)">이메일 인증하기</button>

    <form id="email_form">
        <input type="hidden" name="username" value="${requestScope.member.id}">
        <input type="hidden" name="email" value="${requestScope.member.email}">
        <input type="hidden" name="emailConfirm" value="${requestScope.member.emailConfirm}">												

    </form>

		<script>
		function sendEmail(event,username, email, emailConfirm) {
			$.ajax({
				url : "${pageContext.request.contextPath}/user/email/send",
				type : "GET",
				data : $("#email_form").serialize(),
				success : function(data) {
					alert("이메일이 전송되었습니다.")
				},
				error : function(e) {
					console.log(e);
				}
			});
		}
		</script>
</body>
</html>
<jsp:include page="../common/footer.jsp" />