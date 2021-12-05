<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
    
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e29de4c11a6f2afe5e4be705d0f8389&libraries=services"></script>
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
	name2 = "${meet.location}";
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+addArray2[1]+'</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}, 100);





}); 
</script>

	<div>
		<b>제목</b> : ${meet.title}
	</div>
	<div>
		<b>조회수</b> : ${meet.viewCount}
	</div>
	<div>
		<b>작성자</b> : ${meet.member.name}
	</div>
	<div>
		<b>지역</b> : ${meet.location} / ${meet.location2}
	</div>
	<div>
		<b>카테고리</b> : ${meet.meetCategory.meetCategoryName}
	</div>
	<div>
		<b>대표게임</b> : ${meet.game.gameName}
	</div>
	<div>
		<div>
			<b>내용</b> : 
			${meet.content}
		</div>
	</div>
	<div>
	이미지 : 
		<c:forEach items="${meet.imageList}" var="image">
			<img src="${pageContext.request.contextPath}${image.imageUrl}">
		</c:forEach>
	</div>
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/meet/updateForm/${meet.boardNo}'">수정하기</button>
	</div>
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/meet/delete/${meet.boardNo}'">삭제하기</button>
	</div>
	<p>
	<h2>댓글 목록</h2>
	<c:forEach items="${meet.replyList}" var="reply">
		<b>${reply.replyContent}</b> <button onclick="location.href='${pageContext.request.contextPath}/board/reply/delete/${reply.replyNo}?boardType=meet&boardNo=${meet.boardNo}'">댓글삭제</button><br>
	</c:forEach>	
	<p>
	<form action="${pageContext.request.contextPath}/board/reply/insert" method = "post">
		
		<!-- 댓글달고 각각의 글 상세 페이지로 넘어오기 위함 -->
		<input type="hidden" name="boardNo" value="${meet.boardNo}">
		<input type="hidden" name="boardType" value="meet">
		댓글쓰기 <br>
		<textarea rows="5" cols="40" name="replyContent"></textarea>
		<input type="submit" value="댓글등록">
	</form>
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/meet'">리스트로 돌아가기</button>
	</div>
</body>
</html>