<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
		<h3>${requestScope.member.nickname}님 회원가입을 축하드립니다</h3>
		<p>모든 서비스를 이용하기 위해 이메일 인증을 완료하여 주세요</p>
		<button onclick="sendEmail(event)">이메일 인증하기</button>

    <form id="email_form">
        <input type="text" name="username" value="${requestScope.member.id}">
        <input type="text" name="email" value="${requestScope.member.email}">
        <input type="text" name="emailConfirm" value="${requestScope.member.emailConfirm}">												

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