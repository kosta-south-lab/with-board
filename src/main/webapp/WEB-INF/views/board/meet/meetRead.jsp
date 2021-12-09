<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>게시물 상세</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/img/apple-touch-icon.png" rel="apple-touch-icon">
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/meet/meetRead.css">
</head>

<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="/index">홈</a></li>
          <li>정기모임</li>
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
                <h4>${meet.title}<span>${meet.location2}</span></h4>
                <ul>
                  <li><i class="bx bx-check"></i>글번호 : ${meet.boardNo}</li>
                  <li><i class="bx bx-check"></i> 조회수 : ${meet.viewCount}</li>
                  <li><i class="bx bx-check"></i>작성자 : ${meet.member.name}</li>
                  <li><i class="bx bx-check"></i> 카테고리 : ${meet.meetCategory.meetCategoryName}</li>
                  <li><i class="bx bx-check"></i> 대표게임 : ${meet.game.gameName}</li>
                  <fmt:parseDate value="${meet.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                  <li><i class="bx bx-check"></i> 등록일 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedDateTime}"/></li>
                  <li>${meet.content}</li>
                </ul>
                <c:if test="${meet.member.id == sessionScope.member.id}">
	                <button class="bottom-btn" onclick="location.href='${pageContext.request.contextPath}/board/meet/updateForm/${meet.boardNo}'">수정</button>
    	            <button class="bottom-btn" onclick="location.href='${pageContext.request.contextPath}/board/meet/delete/${meet.boardNo}'">삭제</button>
                </c:if>
              </div>
          </div>
        </div>

      </div>
    </section><!-- End Contact Section -->
    <section id="portfolio" class="portfolio clients" style="padding-bottom: 10px;">
      <div class="container">
        <div class="section-title">
          <h2>Photos</h2>
        </div>

        <div class="row portfolio-container">
		  <c:forEach items="${meet.imageList}" var="image">
          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${pageContext.request.contextPath}${image.imageUrl}" class="img-fluid" alt="" style="width:100%">
              <div class="portfolio-info">
                <h4>App 1</h4>
                <p>App</p>
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath}${image.imageUrl}" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                </div>
              </div>
            </div>
          </div>
          </c:forEach>

        </div>

      </div>
    </section><!-- End Portfolio Section -->
    <!-- ======= Blog Single Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">
        <div class="row">
          <div class="col-lg-8 entries">
            <div class="blog-comments">
              <h4 class="comments-count">
              <c:choose>
              	<c:when test="${empty meet.replyList}">0</c:when>
              	<c:otherwise>
              		${fn:length(meet.replyList)}
              	</c:otherwise>
              </c:choose>
			  개의 댓글이 달렸어요
			  </h4>
       
              <c:forEach items="${meet.replyList}" var="reply">
	              <div id="comment-1" class="comment">
	                <div class="d-flex">
	                  <div class="comment-img"><img src="${pageContext.request.contextPath}/resources/images/profile/profile.png" alt="프로필이미지"></div>
	                  <div>
	                    <h5 class="d-flex justify-content-between">
	                    	<a href="">${reply.member.name}</a>
	                    	<c:if test="${reply.member.id == sessionScope.member.id}">
		                    	<button type="submit" class="btn btn-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/board/reply/delete/${reply.replyNo}?boardType=meet&boardNo=${meet.boardNo}'">삭제</button>
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
					  <input type="hidden" name="boardNo" value="${meet.boardNo}">
					  <input type="hidden" name="boardType" value="meet">
					  
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
					<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/meet'">리스트로 돌아가기</button>
				</div>
              </div>

            </div><!-- End blog comments -->

          </div><!-- End blog entries list -->
        </div>

      </div>
    </section><!-- End Blog Single Section -->

  </main><!-- End #main -->

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  
  <!-- 지도 api -->
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
		            content: '<div style="background-color: #000000; width:150px;text-align:center;padding:6px 0;">'+addArray2[1]+'</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		}, 100);
	
	
	
	
	
	}); 
	</script>

</body>

</html>