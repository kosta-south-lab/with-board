<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    
</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
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

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(${matchBoard.location}, function(result, status) {

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
}); ${matchBoard.location}
var name2 = document.registerForm.location.value;
var addArray2=name2.split(' / ');

</script>
<input type="hidden" name="location" value=${matchBoard.location}>
<div>
		<b>제목</b> : ${matchBoard.title}
	</div>
	<div>
		<b>조회수</b> : ${matchBoard.viewCount}
	</div>
	<div>
		<b>작성자</b> : ${matchBoard.member.name}
	</div>
	<div>
		<b>지역</b> :  ${matchBoard.location2}
	</div>
	<div>
		<b>가게 이름</b> : addArray2[1]
	</div>
	<div>
		<b>주소</b> : addArray2[0]
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
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/matchBoard/updateForm/${matchBoard.boardNo}'">수정하기</button>
	</div>
	<div>
		<button onclick="location.href='${pageContext.request.contextPath}/board/matchBoard'">리스트로 돌아가기</button>
	</div>
</body>
</html>