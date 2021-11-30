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
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('${meet.location} ${meet.location2}', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();


        displayMarker(data[0]);    
        bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
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
		<b>지역</b> : ${meet.location} ${meet.location2}
	</div>
	<div>
		<b>카테고리</b> : ${meet.meetCategory.meetCategoryName}
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
		<button onclick="location.href='${pageContext.request.contextPath}/board/meet'">리스트로 돌아가기</button>
	</div>
</body>
</html>