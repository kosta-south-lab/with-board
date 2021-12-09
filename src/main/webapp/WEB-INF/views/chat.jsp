<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Chating</title>
	<style>
		@charset "UTF-8";
*, *:before, *:after {
  box-sizing: border-box;
}
input {
  position: relative;
  display: inline-block;
  cursor: pointer;
  outline: none;
  border: 0;
  vertical-align: middle;
  text-decoration: none;
  font-size: inherit;
  font-family: inherit;
}
input.learn-more {
  font-weight: 600;
  color: #382b22;
  text-transform: uppercase;
  padding: 1.25em 2em;
  background: #fff0f0;
  border: 2px solid #b18597;
  border-radius: 0.75em;
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
  transition: background 150ms cubic-bezier(0, 0, 0.58, 1), -webkit-transform 150ms cubic-bezier(0, 0, 0.58, 1);
  transition: transform 150ms cubic-bezier(0, 0, 0.58, 1), background 150ms cubic-bezier(0, 0, 0.58, 1);
  transition: transform 150ms cubic-bezier(0, 0, 0.58, 1), background 150ms cubic-bezier(0, 0, 0.58, 1), -webkit-transform 150ms cubic-bezier(0, 0, 0.58, 1);
}
.container .input {
  float: left;
  width: 188px;
  height: 42px;
  padding: 0 15px;
  border: 1px solid var(--light);
  background-color: #eceff1;
  border-radius: 21px;
  font-family: "Source Sans Pro", sans-serif;
  font-weight: 400;
}
.container .input:focus {
  outline: none;
}
.container .search {
  display: block;
  float: left;
  width: 42px;
  height: 42px;
  margin-left: 10px;
  border: 1px solid var(--light);
  background-color: var(--blue);
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/name-type.png");
  background-repeat: no-repeat;
  background-position: top 12px left 14px;
  border-radius: 50%;
}
:root {

  --black: #000;
  --bg: #f8f8f8;
  --grey: #999;
  --dark: #1a1a1a;
  --light: #e6e6e6;
  --wrapper: 1000px;
  --blue: #00b0ff;
}

body {
-ms-overflow-style: none;
  background-color: var(--bg);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-rendering: optimizeLegibility;
  font-family: "Source Sans Pro", sans-serif;
  font-weight: 400;
	hight:500px;
  background-size: cover;
  background-repeat: none;
   background-color: #093040;
  font-family: 'InfinitySans-RegularA1';
}
::-webkit-scrollbar { display: none; } /*특정 부분 스크롤바 없애기*/ 
.box{ -ms-overflow-style: none; } 
.box::-webkit-scrollbar{ display:none; }

.wrapper {
  position: relative;
  left: 50%;
  width: var(--wrapper);
  height: 800px;
  transform: translate(-50%, 0);
}

.container {
  position: relative;
  top: 50%;
  left: 39%;
  width: 80%;
  height: 75%;
  background-color: var(--white);
  transform: translate(-50%, -50%);
}
.container .left {
  float: left;
  width: 37.6%;
  height: 100%;
  border: 1px solid var(--light);
  background-color: var(--white);
}
.container .left .top {
  position: relative;
  width: 100%;
  height: 96px;
  padding: 29px;
}
.container .left .top:after {
  position: absolute;
  bottom: 0;
  left: 50%;
  display: block;
  width: 80%;
  height: 1px;
  content: "";
  background-color: var(--light);
  transform: translate(-50%, 0);
}
.container .left input {
  float: left;
  width: 188px;
  height: 42px;
  padding: 0 15px;
  border: 1px solid var(--light);
  background-color: #eceff1;
  border-radius: 21px;
  font-family: "Source Sans Pro", sans-serif;
  font-weight: 400;
}
.container .left input:focus {
  outline: none;
}
.container .left a.search {
  display: block;
  float: left;
  width: 42px;
  height: 42px;
  margin-left: 10px;
  border: 1px solid var(--light);
  background-color: var(--blue);
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/name-type.png");
  background-repeat: no-repeat;
  background-position: top 12px left 14px;
  border-radius: 50%;
}
.container .left .people {
  margin-left: -1px;
  border-right: 1px solid var(--light);
  border-left: 1px solid var(--light);
  width: calc(100% + 2px);
}
.container .left .people .person {
  position: relative;
  width: 100%;
  padding: 12px 10% 16px;
  cursor: pointer;
  background-color: var(--white);
}
.container .left .people .person:after {
  position: absolute;
  bottom: 0;
  left: 50%;
  display: block;
  width: 80%;
  height: 1px;
  content: "";
  background-color: var(--light);
  transform: translate(-50%, 0);
}
.container .left .people .person img {
  float: left;
  width: 40px;
  height: 40px;
  margin-right: 12px;
  border-radius: 50%;
  -o-object-fit: cover;
     object-fit: cover;
}
.container .left .people .person .name {
  font-size: 14px;
  line-height: 22px;
  color: var(--dark);
  font-family: "Source Sans Pro", sans-serif;
  font-weight: 600;
}
.container .left .people .person .time {
  font-size: 14px;
  position: absolute;
  top: 16px;
  right: 10%;
  padding: 0 0 5px 5px;
  color: var(--grey);
  background-color: var(--white);
}
.container .left .people .person .preview {
  font-size: 14px;
  display: inline-block;
  overflow: hidden !important;
  width: 70%;
  white-space: nowrap;
  text-overflow: ellipsis;
  color: var(--grey);
}
.container .left .people .person.active, .container .left .people .person:hover {
  margin-top: -1px;
  margin-left: -1px;
  padding-top: 13px;
  border: 0;
  background-color: var(--blue);
  width: calc(100% + 2px);
  padding-left: calc(10% + 1px);
}
.container .left .people .person.active span, .container .left .people .person:hover span {
  color: var(--white);
  background: transparent;
}
.container .left .people .person.active:after, .container .left .people .person:hover:after {
  display: none;
}
.container .chating {
  position: relative;
  float: left;
  width: 720px;
  height: auto;
  top:50%;
  left:15px;
}
.container .chating .top {
  width: 100%;
  height: 47px;
  padding: 15px 29px;
  background-color: #eceff1;
}
.container .chating .top span {
  font-size: 15px;
  color: var(--grey);
}
.container .chating .top span .name {
  color: var(--dark);
  font-family: "Source Sans Pro", sans-serif;
  font-weight: 600;
}
.container .chating .chat {
  position: relative;
  display: none;
  overflow: hidden;
  padding: 0 35px 92px;
  border-width: 1px 1px 1px 0;
  border-style: solid;
  border-color: var(--light);
  height: calc(100% - 48px);
  justify-content: flex-end;
  flex-direction: column;
}
.container .chating .chat.active-chat {
  display: block;
  display: flex;
}
.container .chating .chat.active-chat .bubble {
  transition-timing-function: cubic-bezier(0.4, -0.04, 1, 1);
}
.container .chating .chat.active-chat .bubble:nth-of-type(1) {
  -webkit-animation-duration: 0.15s;
          animation-duration: 0.15s;
}
.container .chating .chat.active-chat .bubble:nth-of-type(2) {
  -webkit-animation-duration: 0.3s;
          animation-duration: 0.3s;
}
.container .chating .chat.active-chat .bubble:nth-of-type(3) {
  -webkit-animation-duration: 0.45s;
          animation-duration: 0.45s;
}
.container .chating .chat.active-chat .bubble:nth-of-type(4) {
  -webkit-animation-duration: 0.6s;
          animation-duration: 0.6s;
}
.container .chating .chat.active-chat .bubble:nth-of-type(5) {
  -webkit-animation-duration: 0.75s;
          animation-duration: 0.75s;
}
.container .chating .chat.active-chat .bubble:nth-of-type(6) {
  -webkit-animation-duration: 0.9s;
          animation-duration: 0.9s;
}
.container .chating .chat.active-chat .bubble:nth-of-type(7) {
  -webkit-animation-duration: 1.05s;
          animation-duration: 1.05s;
}
.container .chating .chat.active-chat .bubble:nth-of-type(8) {
  -webkit-animation-duration: 1.2s;
          animation-duration: 1.2s;
}
.container .chating .chat.active-chat .bubble:nth-of-type(9) {
  -webkit-animation-duration: 1.35s;
          animation-duration: 1.35s;
}
.container .chating .chat.active-chat .bubble:nth-of-type(10) {
  -webkit-animation-duration: 1.5s;
          animation-duration: 1.5s;
}
.container .chating .write {
  position: absolute;
  bottom: 29px;
  left: 30px;
  height: 42px;
  padding-left: 8px;
  border: 1px solid var(--light);
  background-color: #eceff1;
  width: calc(100% - 58px);
  border-radius: 5px;
}
.container .chating .write input {
  font-size: 16px;
  float: left;
  width: 347px;
  height: 40px;
  padding: 0 10px;
  color: var(--dark);
  border: 0;
  outline: none;
  background-color: #eceff1;
  font-family: "Source Sans Pro", sans-serif;
  font-weight: 400;
}
.container .chating .write .write-link.attach:before {
  display: inline-block;
  float: left;
  width: 20px;
  height: 42px;
  content: "";
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/attachment.png");
  background-repeat: no-repeat;
  background-position: center;
}
.container .chating .write .write-link.smiley:before {
  display: inline-block;
  float: left;
  width: 20px;
  height: 42px;
  content: "";
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/smiley.png");
  background-repeat: no-repeat;
  background-position: center;
}
.container .chating .write .write-link.send:before {
  display: inline-block;
  float: left;
  width: 20px;
  height: 42px;
  margin-left: 11px;
  content: "";
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/send.png");
  background-repeat: no-repeat;
  background-position: center;
}
.container .chating .bubble {
  font-size: 16px;
  position: relative;
  display: inline-block;
  clear: both;
  margin-bottom: 8px;
  padding: 13px 14px;
  vertical-align: top;
  border-radius: 5px;
}
.container .chating .bubble:before {
  position: absolute;
  top: 19px;
  display: block;
  width: 8px;
  height: 6px;
  content: " ";
  transform: rotate(29deg) skew(-35deg);
}
.container .chating .bubble.you {
  float: left;
  color: var(--white);
  background-color: #d9d2b0;
  align-self: flex-start;
  -webkit-animation-name: slideFromLeft;
          animation-name: slideFromLeft;
}
.container .chating .bubble.you:before {
  left: -3px;
  background-color: #d9d2b0;
}
.container .chating .bubble.me {
  float: right;
  color: var(--dark);
  background-color: #eceff1;
  align-self: flex-end;
  -webkit-animation-name: slideFromRight;
          animation-name: slideFromRight;
}
.container .chating .bubble.me:before {
  right: -3px;
  background-color: #eceff1;
}
.container .chating .conversation-start {
  position: relative;
  width: 100%;
  margin-bottom: 27px;
  text-align: center;
}
.container .chating .conversation-start span {
  font-size: 14px;
  display: inline-block;
  color: var(--grey);
}
.container .chating .conversation-start span:before, .container .right .conversation-start span:after {
  position: absolute;
  top: 10px;
  display: inline-block;
  width: 30%;
  height: 1px;
  content: "";
  background-color: var(--light);
}
.container .chating .conversation-start span:before {
  left: 0;
}
.container .chating .conversation-start span:after {
  right: 0;
}

@keyframes slideFromLeft {
  0% {
    margin-left: -200px;
    opacity: 0;
  }
  100% {
    margin-left: 0;
    opacity: 1;
  }
}
@-webkit-keyframes slideFromLeft {
  0% {
    margin-left: -200px;
    opacity: 0;
  }
  100% {
    margin-left: 0;
    opacity: 1;
  }
}
@keyframes slideFromRight {
  0% {
    margin-right: -200px;
    opacity: 0;
  }
  100% {
    margin-right: 0;
    opacity: 1;
  }
}
@-webkit-keyframes slideFromRight {
  0% {
    margin-right: -200px;
    opacity: 0;
  }
  100% {
    margin-right: 0;
    opacity: 1;
  }
  
}
		#${member.getId()}{
		  float: right;
  color: var(--dark);
  background-color: #eceff1;
  align-self: flex-end;
  -webkit-animation-name: slideFromRight;
          animation-name: slideFromRight;
		}

	</style>
</head>

<script type="text/javascript">
$('html, body').css({'overflow': 'hidden', 'height': '100%'});
$('#element').on('scroll touchmove mousewheel', function(event) {
  event.preventDefault();
  event.stopPropagation();
  return false;
});

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
						
						$("#chating").append(" <div class='bubble me' id="+d.userName+">"+d.userName+" :" + d.msg + "</div>");	
					}else{
						$("#chating").append("<div class='bubble you' id="+d.userName+">" + d.userName + " :" + d.msg + "</div>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
			var divdiv = document.getElementById("box");
			divdiv.scrollTop = divdiv.scrollHeight;
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	setTimeout(function() {
		userName = document.getElementById("userName").value;
		$('#chating').scrollTop($('#chating')[0].scrollHeight);
		
		
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourMsg").show();
			
		}
	
		}, 10);
	

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
	document.querySelector('.chat[data-chat=person2]').classList.add('active-chat');
	document.querySelector('.person[data-chat=person2]').classList.add('active');

	let friends = {
	  list: document.querySelector('ul.people'),
	  all: document.querySelectorAll('.left .person'),
	  name: '' },

	chat = {
	  container: document.querySelector('.container .right'),
	  current: null,
	  person: null,
	  name: document.querySelector('.container .right .top .name') };


	friends.all.forEach(f => {
	  f.addEventListener('mousedown', () => {
	    f.classList.contains('active') || setAciveChat(f);
	  });
	});

	function setAciveChat(f) {
	  friends.list.querySelector('.active').classList.remove('active');
	  f.classList.add('active');
	  chat.current = chat.container.querySelector('.active-chat');
	  chat.person = f.getAttribute('data-chat');
	  chat.current.classList.remove('active-chat');
	  chat.container.querySelector('[data-chat="' + chat.person + '"]').classList.add('active-chat');
	  friends.name = f.querySelector('.name').innerText;
	  chat.name.innerHTML = friends.name;
	}
	
	//room번호랑 아이디 번호 저장하고 여기서 DB가져와서 써놓으면 되지 않을까
</script>
<body>


	<div id="container" class="container" style="top:50px;">
	
		<input type="hidden" id="sessionId" value="">
		
		<div style="overflow:auto; width:730px; height:1180px;" id="box">
		<div id="chating" class="chating">
		
	
		</div></div>
		
		
		<input type="hidden" name="userName" id="userName"value="${member.getId()}">
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					
					
					<th><input class="learn-more" type="text" name="chatting" id="chatting"value="" style="width:300px;height:50px;"></th>
					
					<th><button class="search" onclick="send()" id="sendBtn"></button></th>
					
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