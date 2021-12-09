<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp" />
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<!-- 부트스트랩 css 사용 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<!--  부트스트랩 js 사용 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<style>
@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

	body {
	font-family: 'IBMPlexSansKR-Regular';
    background: #093040;
}

.form-control:focus {
    box-shadow: none;
    border-color: #BA68C8
}

.profile-button {
    background: #093040;
    box-shadow: none;
    border: none
}

.profile-button:hover {
    background: #093040;
}

.profile-button:focus {
    background: #093040;
    box-shadow: none
}

.profile-button:active {
    background: #093040;
    box-shadow: none
}

.back:hover {
    color: #682773;
    cursor: pointer
}

.labels {
    font-size: 11px
}

.add-experience:hover {
    background: #BA68C8;
    color: #fff;
    cursor: pointer;
    border: solid 1px #BA68C8
}
a:link {
  color: #093040;
  text-decoration: none;
}
a:visited {
  color: #114559;
  text-decoration: none;
}
a:hover {
  color: #BFAF8F;
  text-decoration: underline;
}

</style>
</head>
<body>
<form name="updateInfo" method="post" action="${pageContext.request.contextPath}/user/changeInfo" enctype="multipart/form-data">

<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            <img class="rounded-circle mt-5" width="150px" src="${member.image}"> 
             <!-- 프로필 사진 -->
			<div class="form-group">
			<label for="profile"></label> 
			<input type="image" class="form-control-file border" name="image" />
			<p>${member.image}</p>
			</div>
		<button id="update--submit" class="btn btn-dark">수정</button>
            
            <input class="font-weight-bold" type="text" readonly="readonly" id="id" name="id" value="${member.id}">
            <input class="text-black-50" type="text" readonly="readonly" id="email" name="email" value="${member.email}">
            <p style="color: red;">아이디와 이메일은 수정할 수 없습니다.</p>
           
            <span>  <a href="${pageContext.request.contextPath}/user/mypage">마이페이지로 돌아가기</a> 
            <br>
            <a href="../index">Home</a> </span>     
  			 
            
            </div>
    
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">닉네임</label><input type="text" id="nickname" name="nickname" value="${member.nickname}" class="form-control"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-4 mb-2">   
              <label for="gender1">성별</label><p>
              <input type="radio" readonly="readonly" class="form-control1" id="gender1" name="gender" value="male"${member.gender eq 'male' ? ' checked="checked"':''} />
               <label for="gender1">MEN</label> 
              <input type="radio" readonly="readonly" class="form-control2" id="gender2" name="gender" value="female"${member.gender eq 'female' ? ' checked="checked"':''}/>
               <label for="gender2">WOMAN</label>
              <div class="invalid-feedback">
            </div>
          </div>
                    <div class="col-md-12"><label class="labels">지역</label><input type="text" id="location" name="location" class="form-control" value="${member.location}"></div>
                    <div class="col-md-12"><input type="text" id="location2" name="location2" class="form-control" value="${member.location2}"></div>
                   </div>
      
                <div class="mt-5 text-center">
                <button class="btn btn-primary profile-button" type="submit">Save</button>
                </div>
            </div>
        </div>
       
    </div>
</div>
</form>



</body>
</html>
<jsp:include page="../common/footer.jsp" />