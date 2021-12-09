<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp" />
<head>
<meta charset="UTF-8">
 <script type="text/javascript">
		
  		
  		$("#email").focusout(function(){
	     if($('#email').val() == ""){
	   		$('#check').text('이메일을 입력해주세요');
	   	  	$('#check').css('color', 'red');
	     }else{
	    	 $('#check').hide();
	     }
	     });
  
  </script>
  <style type="text/css">
    @font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

  	body{
  		font-family: 'IBMPlexSansKR-Regular';
  		background-color: #093040;
		argin: 0 auto;
  	}
  	
  	.card-body{
  		 display: inline-block;
          text-align: center;
  	}
  </style>
<title>아이디/비밀번호 찾기</title>
</head>
<body>
		
		<div class="card-body">
      <form class="form-signin" method="POST" action="${pageContext.request.contextPath}/check/findPw/sendEmail">
        <input type="userEmail" name="userEmail" id="userEmail" class="form-control" placeholder="등록된 이메일을 입력하세요." required><br>
        <input type="userName" name="userName" id="userName" class="form-control" placeholder="등록된 아이디를 입력하세요." required><br>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">이메일로 비밀번호 찾기 메일 받기</button>
      
      </form>
        
		</div>
</body>
</html>
<jsp:include page="../common/footer.jsp" />