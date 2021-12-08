<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/header.jsp" />
  <head>
    <title>Login</title>
    <style type="text/css">
    @font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

    	body {
    	font-family: 'IBMPlexSansKR-Regular';
		  background-color: #093040;
		  margin: 0 auto;
		}
		
		.container{
          display: inline-block;
          text-align: center;
		}
		
		.form-control{
      
      margin-top: 30px;
      padding: 15px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	text-align: center;
		}
		
		a:link {
  color: #D9D2B0;
  text-decoration: none;
}
a:visited {
  color: #D9D2B0;
  text-decoration: none;
}
a:hover {
  color: #D9D2B0;
  text-decoration: underline;
}
		
    </style>
   </head>
  <body>
     <div class="container" style="padding:35px;">
      <form class="form-signin" method="post" action="/loginProcess2">
        <h2 class="form-signin-heading">로그인</h2>
        <p>
          <label for="username" class="sr-only">id</label>
          <input type="text" id="username" name="id" class="form-control" placeholder="아이디를 입력하세요." required autofocus>
        </p>
        <p>
          <label for="password" class="sr-only">Password</label>
          <input type="password" id="password" name="pw" class="form-control" placeholder="비밀번호를 입력하세요" required>
        </p>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
      
      <a href = ${pageContext.request.contextPath}/user/searchId >아이디/비밀번호 찾기</a>
</div>
</body>
</html>
<jsp:include page="../common/footer.jsp" />