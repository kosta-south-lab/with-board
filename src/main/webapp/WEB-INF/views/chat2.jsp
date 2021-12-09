<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating .me{
			color: #F6F6F6;
			text-align: left;
		}
		.chating .others{
			color: #FFE400;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			display: none;
		}
		#${member.getId()}{
		text-align: right;
		}
		
	</style>
</head>

<script type="text/javascript">
	var ws;
	var userName;

	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
		wsEvt();
	}

		
	function wsEvt() {
		ws.onopen = function(data){
			userName = document.getElementById("userName").value;
			let today = new Date(); 
			//소켓이 열리면 동작
			var option ={
					type: "message",
					roomNumber: $("#roomNumber").val(),
					sessionId : $("#sessionId").val(),
					userName : $("#userName").val(),
					msg : ""+today.toLocaleString()+" "+userName+"님 입장"
				}
				ws.send(JSON.stringify(option));
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me' id="+d.userName+">"+d.userName+" :" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others' id="+d.userName+">" + d.userName + " :" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	setTimeout(function() {
		userName = document.getElementById("userName").value;
	
		
		
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourMsg").show();
			
		}
	
		}, 100);
	

	function send() {//이것들을 세션에 저장해서 소켓 핸들러에서 가져가서 쓰자
		var option ={
			type: "message",
			roomNumber: $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val(),
			flag : "yes"
		}
		ws.send(JSON.stringify(option));
		setTimeout(function() {
		//	data= $(".me").detach();
		//	data= $(".others").detach();
			
		
			}, 100);
		
		

		$("#yourMsg").show();
		$('#chatting').val("");
	}
	//room번호랑 아이디 번호 저장하고 여기서 DB가져와서 써놓으면 되지 않을까
</script>
<body>

	<div id="container" class="container">
		<h1>${roomName}의 채팅방</h1>
		<h1>${roomNumber}의 채팅방</h1>
		<h1>${member.getMemberNo()}의 채팅방</h1>
		<input type="hidden" id="sessionId" value="">
		
		
		<div id="chating" class="chating">
		</div>
		
		
		<input type="hidden" name="userName" id="userName"value="${member.getId()}">
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					
					<th><input type="text" name="chatting" id="chatting"value=""></th>
					
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
					
				</tr>
			</table>
		</div>
	</div>
	<form action="${pageContext.request.contextPath}chat/insert" method="post" name="chatLog">
	<input type="hidden" id="roomNumber" value="${roomNumber}">
		<input type="hidden" id="joinMatchNo" name="joinMatchNo" value="${roomNumber}">
		<input type="hidden" name="chatLogContent" id="chatLogContent"value="">
	
	
	</form>
</body>
</html>