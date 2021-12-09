<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp" />
<head>
<meta charset="UTF-8">
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
</style>
<title>아이디 찾기 결과</title>
</head>
<body>
<h1>아이디 찾기 결과입니다. </h1>
<p>찾은 id : ${sessionScope.member.id}</p>


</body>
</html>
<jsp:include page="../common/footer.jsp" />