<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
</head>

<body>
  
   <script type="text/javascript">
    
    var socket = null;
    
    $(function(){
    	
    	connectWS();
    	    	
    });
    
    function connectWS(){
    	
        var ws = new WebSocket("ws://localhost:9999/alarmEcho");
        
        socket = ws;


        ws.onopen = function () {
            console.log('Info: connection opened.');

        };


        ws.onmessage = function (event) {
            console.log("ReceiveMessage : ", event.data+'\n');
        };


        ws.onclose = function (event) { 
        	
        	console.log('Info: connection closed.'); 
            setTimeout( function(){ connect(); }, 1000); // retry connection!!
        };
       
        ws.onerror = function (err) { console.log('error:' + err); };
        


    };     
    
    </script>
      
</body>

</html>