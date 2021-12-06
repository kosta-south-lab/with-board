<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<title>Insert title here</title>
</head>
<body>
		
		<div class="card-body">
      <form class="form-signin" method="POST" action="${pageContext.request.contextPath}/user/searchId2">
        <input type="email" name="email" id="email" class="form-control" placeholder="이메일" required><br>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">아 이 디 찾 기</button>
      
      </form>
        
		</div>
</body>
</html>