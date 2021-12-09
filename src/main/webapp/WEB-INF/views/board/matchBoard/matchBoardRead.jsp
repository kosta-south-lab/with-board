<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    
</head>
<body>
 <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<input type = "hidden" id = "location" value="${matchBoard.location}">
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Contact - Eterna Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/img/apple-touch-icon.png" rel="apple-touch-icon">
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/meet/meetRead.css">
  <style>
  #.map{
		
			height:425px;
		
		}
  </style>
</head>

<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="${pageContext.request.contextPath}/board/matchBoard">Board</a></li>
          <li>MatchBoard</li>
        </ol>
        <h2>글 상세보기</h2>
		
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact pricing">
      <div class="container">
        <div class="row">

          <div class="col-lg-6 ">
         	<div class="mb-4 mb-lg-0" id="map" style="border:0; width: 100%; height: 600px;"></div>
          </div>

          <div class="col-lg-6">
              <div class="box">
                <h4>${matchBoard.title}<span>${matchBoard.location2}</span></h4>
                <ul>
                
                  <li><i class="bx bx-check"></i>글번호 : ${matchBoard.boardNo}</li>
                  <li><i class="bx bx-check"></i> 조회수 : ${matchBoard.viewCount}</li>
                  <li><i class="bx bx-check"></i>작성자 : ${matchBoard.member.name}</li>
                  <li><i class="bx bx-check"></i> 대표게임 : ${matchBoard.game.gameName}</li>
                  <fmt:parseDate value="${matchBoard.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                  <li><i class="bx bx-check"></i> 등록일 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedDateTime}"/></li>
               
                  <li><i class="bx bx-check"></i> 조건 : ${matchBoard.etc}</li>
                  <li><i class="bx bx-check"></i> 내용 : ${matchBoard.content}</li>
                </ul>
                <c:if test="${matchBoard.member.id == sessionScope.member.id}">
	                <button class="bottom-btn" onclick="location.href='${pageContext.request.contextPath}/board/matchBoard/updateForm/${matchBoard.boardNo}'">수정</button>
    	            <button class="bottom-btn" onclick="location.href='${pageContext.request.contextPath}/board/matchBoard/delete/${matchBoard.boardNo}'">삭제</button>
    	            	<br><br>
    	            	<form action="${pageContext.request.contextPath}/room/insert" method="post" name="registerForm">
	<div class="container">
	<div style="background-color: #093040;">_</div>
	<br>
		<h1>채팅방</h1>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
		<div>
		</div>
		<div>
			
			<table class="inputTable">
				<tr>
				<th><input type="hidden" name="joinMatchTitle" id="joinMatchTitle" value="l매칭l ${matchBoard.title} l ${matchBoard.location2}"></input></th>
				<th><input type="hidden" name="boardNo" id="boardNo" value="${matchBoard.boardNo}"></th>
				<th><input type="hidden" name="roomNum" id="roomNum" value="${matchBoard.roomNum}"></th>
					
				
					
					<button class="bottom-btn" >채팅방 생성</button>
				
					
					
		
				</tr>
			</table>
		</div>
		
		
		
	</div>
	</form>
	<form action="${pageContext.request.contextPath}/board/matchBoard/updates" method="post" name="registerForm">
	<input type="hidden" name="boardNo" value="${matchBoard.boardNo}">
	
	<input type="hidden" name="title" value="${matchBoard.title}"> 
	
	<!--  value 1인거 나중에 값 제대로 가져와서 넣어줘야함 -->
	<input type="hidden"  name="game" value="1">
		
	
	
	<input type="hidden" name="gameCategory" value="1">
	
	
	 <input type="hidden" id = "location" name="location" value="${matchBoard.location}">
	 <input type="hidden" name="location2" id = "location2" value="${matchBoard.location2}">
	
	<input type="hidden" name="content" value="${matchBoard.content}"></input>
	
	<input type="hidden"  name="etc" value="${matchBoard.etc}"></input><p>
	<input type="hidden" name="roomNum" id="roomNum" value="${roomNum}"></input><p>
	<input type="hidden"name="headCount" value="${matchBoard.headCount}"></input>
	
	<input type="hidden"id="name" value="l매칭l ${matchBoard.title} l ${matchBoard.location2}"></input>
	<input type="hidden"id="number" value="${matchBoard.roomNum}"></input>
	
					
	<input type="submit" class="bottom-btn" value="채팅방 이동" >
	
</form>
</c:if>
<c:if test="${matchBoard.member.id != sessionScope.member.id}">
	<div>
	
	<button  class="bottom-btn" onclick="goRoom()">채팅방 접속하기</button>
	</div></c:if>
	<br><br>
	
                
              </div>
          </div>
        </div>

      </div>
    </section><!-- End Contact Section -->
    <section id="portfolio" class="portfolio clients" style="padding-bottom: 10px;">
      
    </section><!-- End Portfolio Section -->
    <!-- ======= Blog Single Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">
        <div class="row">
          <div class="col-lg-8 entries">
            <div class="blog-comments">
              <h4 class="comments-count">
              <c:choose>
              	<c:when test="${empty matchBoard.replyList}">0</c:when>
              	<c:otherwise>
              		${fn:length(matchBoard.replyList)}
              	</c:otherwise>
              </c:choose>
			  개의 댓글이 달렸어요
			  </h4>
       
              <c:forEach items="${matchBoard.replyList}" var="reply">
	              <div id="comment-1" class="comment">
	                <div class="d-flex">
	                  <div class="comment-img"><img src="${pageContext.request.contextPath}/resources/images/profile/profile.png" alt="프로필이미지"></div>
	                  <div>
	                    <h5 class="d-flex justify-content-between">
	                    	<a href="">${matchBoard.member.name}</a>
	                    	<c:if test="${matchBoard.member.id == sessionScope.member.id}">
		                    	<button type="submit" class="btn btn-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/board/reply/delete/${reply.replyNo}?boardType=matchBoard&boardNo=${matchBoard.boardNo}'">삭제</button>
	                    	</c:if>
	                    </h5>
	                    <fmt:parseDate value="${reply.replyDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedReplyDateTime" type="both"/>
	                    <time><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedReplyDateTime}"/></time>
	                    <p>
	                      ${reply.replyContent}
	                    </p>
	                  </div>
	                </div>
	              </div><!-- End comment #1 -->
			  </c:forEach>
			  
			
              <div class="reply-form">
				<c:if test="${!empty sessionScope.member.id}">
	                <h4>댓글을 남겨주세요!</h4>
	                <form action="${pageContext.request.contextPath}/board/reply/insert" method = "post">
	              
	                  <!-- 댓글달고 각각의 글 상세 페이지로 넘어오기 위함 -->
					  <input type="hidden" name="boardNo" value="${matchBoard.boardNo}">
					  <input type="hidden" name="boardType" value="matchBoard">
					  
	                  <div class="row">
	                    <div class="col form-group">
	                      <textarea name="replyContent" class="form-control" placeholder="댓글 내용"></textarea>
	                    </div>
	                  </div>
	                  <button type="submit" class="btn btn-primary">댓글 달기</button>
	
	                </form>
	                <p>
				</c:if>
			   	<div>
					<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/matchBoard/matchBoardList'">리스트로 돌아가기</button>
				</div>
              </div>

            </div><!-- End blog comments -->

          </div><!-- End blog entries list -->
        </div>

      </div>
    </section><!-- End Blog Single Section -->

  </main><!-- End #main -->

  

	
</body>
<div id="map" style="width:100%;height:350px;"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8afbfd30a8d5aef8be386257a994cf&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	var name2="";
	var addArray2="";
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	setTimeout(function() {
		name2 = "${matchBoard.location}";
		addArray2=name2.split(' / ');
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addArray2[0], function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="background-color: #000000; width:150px;text-align:center;padding:6px 0;">'+addArray2[1]+'</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		}, 100);
	
	
	
	
	
	}); 
	

function goRoom(){
	var number = document.getElementById("number").value;
	var name = document.getElementById("name").value;
	//location.href="/moveChating?roomName="+name+"&"+"roomNumber="+number;
	var post="/moveChating?roomName="+name+"&"+"roomNumber="+number;
	sessionStorage.setItem("goRoom", post );
	location.href="/multiView";
	

}

</script>
</html>