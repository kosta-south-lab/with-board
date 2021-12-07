<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/header.jsp" />
 <head>
  <meta charset="UTF-8">
  
  <!--  csrf 토큰  -->
  <meta id="_csrf" name="csrf" context="${_csrf.token}"/>
  <meta id="_csrf_header" neme="_csrf_header" context="${_csrf.headerName}"/>
 
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#093040), to(#093040));
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
  
 <script src="../js/jquery-3.6.0.js"></script>
 
 <script type="text/javascript">


 function checkValid(frm){
		
		if(frm.id.value == ""){  
			alert("아이디를 입력해주세요.");
			frm.id.focus(); // 제목이 입력되지 않은경우 경고창이 뜨고 포커스를 제목으로 가져다준다.
			return false;
		}
		
		if(frm.pw.value == ""){
			alert("비밀번호를 입력해주세요.");
			frm.pw.focus();
			return false;
		}
		
		if(frm.name.value == ""){
			alert("이름을 입력해주세요.");
			frm.name.focus();
			return false;
		}
		
		if(frm.nickname.value == ""){
			alert("닉네임을 입력해주세요.");
			frm.nickname.focus();
			return false;
		}
		
		if(frm.gender1.value == ""){
			alert("성별을 선택해주세요.");
			frm.gender1.focus();
			return false;
		}
		
		if(frm.email.value == ""){
			alert("이메일을 입력해주세요.");
			frm.email.focus();
			return false;
		}
		
		if(frm.location.value == ""){
			alert("주소를 입력해주세요.");
			frm.location.focus();
			return false;
		}
		
		if(frm.location2.value == ""){
			alert("나머지 주소를 입력해주세요.");
			frm.location2.focus();
			return false;
		}
		
		if(confirm("회원가입하시겠습니까?") == true){
			return true;
		}
	}
 
 </script>
 
</head>
<body>

  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        
<form class="signupForm" novalidate name="signupForm" method="post" onsubmit="return checkValid(this);" action="${pageContext.request.contextPath}/user/joinConfirm">
        
      	<input type = hidden name = "key" value = "members">
      	<input type = hidden name = "methodName" value = "joinMember">
      
  		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id="signupForm">  
  
  		<div class="row">
            <div class="col-md-6 mb-3">
              <label for="id">ID</label>
              <input type="text" class="form-control" id="id" name="id" placeholder="" value="" required>
              <c:if test="${!empty msg}">
         	<span style="color:red;margin-left:15px;">${msg}</span>
         	</c:if>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="pw">PASSWORD</label>
              <input type="password" class="form-control" id="pw" name="pw" placeholder="" value="${member.pw}" required>
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="" value="${member.name}" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">닉네임</label>
              <input type="text" class="form-control" id="nickname" name="nickname" placeholder="" value="${member.nickname}" required>
              <div class="invalid-feedback">
                닉네임을 입력해주세요.
              </div>
            </div>
          </div>
            <div class="row">
            <div class="col-md-4 mb-2">
              <label for="gender1">성별</label><p>
              <input type="radio" class="form-control1" id="gender1" name="gender" value="male"${member.gender eq 'male' ? ' checked="checked"':''} />
               <label for="gender1">MEN</label> &nbsp &nbsp &nbsp
              <input type="radio" class="form-control2" id="gender2" name="gender" value="female"${member.gender eq 'female' ? ' checked="checked"':''}/>
               <label for="gender2">WOMAN</label>
              <div class="invalid-feedback">
            </div>
          </div>
         </div>
          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" value="${member.email}" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
			<div class="row">
            <div class="col-md-6 mb-3">
              <label for="location">주소</label>
              <input type="text" class="form-control" id="location" name="location" placeholder="ex) 서울특별시 " value="${member.location}" required>
              <div class="invalid-feedback">
                주소를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="location2">나머지 주소</label>
              <input type="text" class="form-control" id="location2" name="location2" placeholder="ex) 강남구" value="${member.location2}" required>
              <div class="invalid-feedback">
                나머지 주소를 입력해주세요.
              </div>
            </div>
          </div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입하기</button>
          
         <!-- <button class="btn btn-primary btn-lg btn-block" type="reset">취소</button> -->
          <!-- <input type="reset" onclick="cancel();" value="취소">  -->
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
  <!--   <p class="mb-1">&copy; 2022 YD</p> -->  
    </footer>
  </div>
</body>

</html>
<jsp:include page="../common/footer.jsp" />

