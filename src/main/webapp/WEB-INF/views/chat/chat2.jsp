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
			background-color: #fff;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating p{
			color: #FFBB00;
			style=text-align:left
			
			}
		}
		.chating spen{
			color: #FFBB00;
			
			}
		}
		.chating p1{
			color: #fff;
			text-align: right;
			}
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			display: none;
		}
		#${member.getNickname()}{
		text-align: right;
		}
	</style>
</head>

<script type="text/javascript">
	var ws;
	var userName;
	var addArray2;
	
	
	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			var msg = data.data;
			var name2 = data.data;
			addArray2=name2.split(" : ");
			console.log(addArray2[0]);
			if(msg != null && msg.trim() != ''){
				$("#chating").append("<p id="+addArray2[0]+" >" + msg + "</p>");
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

	function send() {
		var uN = $("#userName").val();
		var msg = $("#chatting").val();
		ws.send(uN+" : "+msg);
		$('#chatting').val("");
		

	}
	
</script>
<body>
	<div id="container" class="container">
		<h1>채팅</h1>
		${member.getNickname()}
		<div id="chating" class="chating">
		</div>
		
	
					<input type="hidden" name="userName" id="userName"value="${member.getNickname()}">
					
			
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>