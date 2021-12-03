<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
</head>

<body>
  
   <script type="text/javascript">
    
    var matchSocket = null;
    var pmSocket = null;
    
    $(function(){
    	
    	connectWS();
    	    	
    });
    
    function connectWS(){
    	
        var ws = new WebSocket("ws://localhost:9999/alarmEcho"); //매칭 게시글 생성 알림용 웹소켓   
        matchSocket = ws;
        
        var ws2 = new WebSocket("ws://localhost:9999/postMessage"); //쪽지 도착 알림용 웹소켓
        pmSocket = ws2;
		
        //ws관련 메소드
        ws.onopen = function () {
            console.log('Info: matchSocket connection opened.');
        };

        ws.onmessage = function (event) {
            console.log("ReceiveMessage : ", event.data+'\n');
            alert(event.data);
        };

        ws.onclose = function (event) {        	
        	console.log('Info: matchSocket connection closed.'); 
            setTimeout( function(){ connect(); }, 1000); // retry connection!!
        };
       
        ws.onerror = function (err) { console.log('error:' + err); };
        
        
        //ws2관련 메소드
        ws2.onopen = function() {
        	console.log('Info: pmSocket connection opened.');
        }
        
        ws2.onmessage = function(event) {
        	console.log("ReceiveMessage : ", event.data+'\n');
        	alert(event.data);
        }
        
        ws2.onclose = function() {
        	console.log('Info: pmSocket connection closed.'); 
        }
		
        ws2.onerror = function (err) { console.log('error:' + err); };
        
    };     
    
    </script>
      
</body>

</html>