<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h3>현재 접속중인 아이디 : ${member.id}</h3>
	<div>
		받을사람 : <input type="text" name="receiveId"> <br>
		제목 : <input type="text" name="title"> <br>
		내용 : <textarea rows="10" cols="40"></textarea> <br>
		<button>보내기</button>
	</div>
	
	<div>
		<a href="${pageContext.request.contextPath}/pm/pmList">쪽지 목록으로 이동...</a>
	</div>
	
	<script type="text/javascript">
		var webSocket;
		$(function() {
			function connect() {
				alert("11");
				webSocket = new WebSocket("ws://localhost:9999/postMessage");
				webSocket.onmessage = onMessage;
			}
			
			function onMessage(e) {
				alert(e.data);
			}
			
			function send() {
				console.log(webSocket);
				let message = JSON.stringify({receiveId:$('input[name=receiveId]').val(), title: $('input[name=title]').val(), content: $('textarea').val()})
				webSocket.send(message);
			}
			
			$('button').click(send);
			connect();
		})
	</script>
</body>
</html>