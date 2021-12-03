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
		<input type="button" value=등록> 
	</div>
	
	<div>
		<a href="${pageContext.request.contextPath}/pm/pmList">쪽지 목록으로 이동...</a>
	</div>
	
	<script type="text/javascript">
		var webSocket;
		$(function() {
			function send() {
				let message = JSON.stringify({receiveId:$('input[name=receiveId]').val(), title: $('input[name=title]').val(), content: $('textarea').val()})
				pmSocket.send(message);
			}			
			$('button').click(send);
			
			$("input[value=등록]").click(function(){
				   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
				   				   
				  console.debug("insertGameForm::socket>>", matchSocket)
				  if(matchSocket){
					  // websocket에 보내기(insertGame, 게시글 작성자, 게시글 작성자, 글번호)
					  var socketMsg1 = "insertGame," + "${member.nickname}" + ",test200,123";
					 
					  console.debug("ssssssssssmsg>", socketMsg1);
					  matchSocket.send(socketMsg1);
				  }
			});
		})
		
	</script>
</body>
<jsp:include page="../common/footer.jsp" />
</html>