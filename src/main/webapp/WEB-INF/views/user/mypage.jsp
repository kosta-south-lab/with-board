<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	body {
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
</style>
</head>
<body>
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            <img class="rounded-circle mt-5" width="150px" src="${member.image}">
            <span class="font-weight-bold">ID : ${member.id}</span>
            <span class="text-black-50">Email : ${member.email}</span><p><p>
            <span> <a href="${pageContext.request.contextPath}/user/updateInfo">수정하기</a> <a href="/index">Home</a> </span>
            </div>
    
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">닉네임</label><input type="text" readonly="readonly" class="form-control" value="${member.nickname}"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">성별</label><input type="text" readonly="readonly" class="form-control" value="${member.gender}"></div>
                    <div class="col-md-12"><label class="labels">지역</label><input type="text" readonly="readonly" class="form-control" value="${member.location}"></div>
                    <div class="col-md-12"><input type="text" readonly="readonly" class="form-control" value="${member.location2}"></div>
                   </div>
      
                <!-- <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Save Profile</button></div> -->
            </div>
        </div>
       
    </div>
</div>




</body>
</html>
<jsp:include page="../common/footer.jsp" />