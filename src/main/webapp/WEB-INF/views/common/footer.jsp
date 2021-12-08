<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
</head>

<body>

 <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Eterna</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/vendor/purecounter/purecounter.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/waypoints/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/js/main.js"></script>
  
  
  
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