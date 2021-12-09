<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    
</head>
<body>

<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8afbfd30a8d5aef8be386257a994cf&libraries=services"></script>
<script>
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
	name2 = document.getElementById("location").value;
	addArray2=name2.split(' / ');
	document.getElementById('shopname').innerHTML = addArray2[1];
	document.getElementById('location1').innerHTML = addArray2[0];
	
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+addArray2[1]+'</div>'
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
	location.href="/moveChating?roomName="+name+"&"+"roomNumber="+number;
}

</script>
<input type = "hidden" id = "location" value="${matchBoard.location}">
<div>
		<b>제목</b> : ${matchBoard.title}
	</div>
	<div>
		<b>매칭 상태</b> : ${matchBoard.status}
	</div>
	<div>
		<b>작성자</b> : ${matchBoard.member.name}
	</div>
	<div>
		<b>지역</b> :  ${matchBoard.location2}
	</div>
	<div>
		<b>가게 이름</b> : <b id="shopname"></b>
	</div>
	<div>
		<b>주소</b> : <b id="location1"></b>
	</div>
	<div>
		<b>게임</b> : ${matchBoard.game}
	</div>
	<div>
		<b>게임 카테고리</b> : ${matchBoard.gameCategory}
	</div>
	<div>
		<b>최대 인원</b> : ${matchBoard.headCount}
	</div>
	<div>
		<div>
			<b>내용</b> : 
			${matchBoard.content}
		</div>
		<div>
			<b>조건</b> : 
			${matchBoard.etc}
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/room/insert" method="post" name="registerForm">
	<div class="container">
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
				<th><input type="hidden" name="roomNum" id="roomNum" value="${roomNum}"></th>
					
					<th><button >채팅방 생성</button></th>
					
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
	<input type="submit" value="채팅방 이동" >
	
</form>

	<div>
	<button onclick="goRoom()">방장이 아닌 다른 사람들</button>
		<button onclick="location.href='${pageContext.request.contextPath}/board/matchBoard/updateForm/${matchBoard.boardNo}'">수정하기</button>
	</div>
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/matchBoard/matchBoardList'">리스트로 돌아가기</button>
	</div>
</body>
</html>