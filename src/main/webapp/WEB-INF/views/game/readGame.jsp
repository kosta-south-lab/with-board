<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/header.jsp" />
<head>

<title>상세 정보 | 위보드</title>

<script type="text/javascript">
	$(function(){
		
	   $("input[value=수정하기]").click(function(){
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/game/updateGameForm");
		   $("#requestForm").submit();
	   });
	   
	   
	   $("input[value=삭제하기]").click(function(){

			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/game/deleteGame");
			   $("#requestForm").submit();
		   
	   });
	   
	   $("input[id=gameRating]").click(function(){

		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/game/insertRating");
		   $("#requestForm").submit();
	   
   	   });	
	   
	   $("input[id=gameLevel]").click(function(){

		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/game/insertLevel");
		   $("#requestForm").submit();
	   
       });	
	});
</script>

<style type="text/css">


#gameRating fieldset {
	width : 356px;
	height : 196px;
	display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
	direction: rtl; /* 이모지 순서 반전 */
	border: 0; /* 필드셋 테두리 제거 */
}

#gameRating fieldset legend {
	text-align: left;
}

#gameRating input[type=radio] {
	display: none; /* 라디오박스 감춤 */
}

#gameRating label {
	font-size: 2em; /* 이모지 크기 */
	color: transparent; /* 기존 이모지 컬러 제거 */
	text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

#gameRating label:hover {
	text-shadow: 0 0 0 #F2AC57; /* 마우스 호버 */
}

#gameRating label:hover ~ label {
	text-shadow: 0 0 0 #F2AC57; /* 마우스 호버 뒤에오는 이모지들 */
}

#gameRating input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 #F2AC57; /* 마우스 클릭 체크 */
}

#gameLevel fieldset {
	width : 356px;
	height : 196px;
	display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
	direction: rtl; /* 이모지 순서 반전 */
	border: 0; /* 필드셋 테두리 제거 */
}

#gameLevel fieldset legend {
	text-align: left;
}

#gameLevel input[type=radio] {
	display: none; /* 라디오박스 감춤 */
}

#gameLevel label {
	font-size: 2em; /* 이모지 크기 */
	color: transparent; /* 기존 이모지 컬러 제거 */
	text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

#gameLevel label:hover {
	text-shadow: 0 0 0 #F2AC57; /* 마우스 호버 */
}

#gameLevel label:hover ~ label {
	text-shadow: 0 0 0 #F2AC57; /* 마우스 호버 뒤에오는 이모지들 */
}

#gameLevel input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 #F2AC57; /* 마우스 클릭 체크 */
}
</style>

</head>

<body>

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="${pageContext.request.contextPath}/sample/index">홈</a></li>
					<li>보드게임 상세 정보</li>
				</ol>
				<h2>보드게임 상세 정보</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Portfolio Details Section ======= -->
		<section id="portfolio-details" class="portfolio-details">
			<div class="container">
				<form action="${pageContext.request.contextPath}/favorites/insert">
					<button>즐겨찾기 추가</button>
				</form>
				<form action="${pageContext.request.contextPath}/favorites/delete">
					<button>즐겨찾기 해제</button>
				</form>
				<div class="row gy-4">

					<div class="col-lg-8">
						<div class="portfolio-details-slider swiper">
							<div class="swiper-wrapper align-items-center">

								<div class="swiper-slide">
									<img
										src="${pageContext.request.contextPath}/img/portfolio/portfolio-1.jpg"
										alt="">
								</div>

								<div class="swiper-slide">
									<img
										src="${pageContext.request.contextPath}/img/portfolio/portfolio-2.jpg"
										alt="">
								</div>

								<div class="swiper-slide">
									<img
										src="${pageContext.request.contextPath}/img/portfolio/portfolio-3.jpg"
										alt="">
								</div>

							</div>
							<div class="swiper-pagination"></div>
						</div>
						<div class="video-url">
							<h2>관련 동영상</h2>
							<iframe width="100%" height="600px"
								src="https://www.youtube.com/embed/tgbNymZ7vqY"></iframe>
						</div>

					</div>

					<div class="col-lg-4">
						<div class="portfolio-info">
							<h3>${requestScope.game.gameName}</h3>
							<ul>
								<li><strong>장르</strong>:
									${requestScope.game.gameCategory.gameCategoryName}</li>
								<li><strong>테마</strong>:
									${requestScope.game.gameTheme.themeName}</li>
								<li><strong>진행 방식</strong>:
									${requestScope.game.gameProcess.processName}</li>
								<li><strong>플레이 타임</strong>:
									${requestScope.game.gamePlaytimeMin} ~
									${requestScope.game.gamePlaytimeMax}</li>
								<li><strong>플레이 인원 수</strong>:
									${requestScope.game.playPersonnelMin} ~
									${requestScope.game.playPersonnelMax}</li>
								<li><strong>유저 평점</strong>: 여기에 평균 평점</li>
								<li><strong>유저 난이도 평가</strong>: 여기에 평균 난이도 점수</li>
							</ul>
						</div>
						<div class="portfolio-info">
							<h3>상세 설명</h3>
							<p>${requestScope.game.gameDetail}</p>
						</div>
						<div class="portfolio-info">
								<form name="gameRating" id="gameRating" method="post">
								    <fieldset>
								        <legend>?이 보드게임을 해보셨나요<p>!경험을 공유해 주세요</p><p>평점</p></legend>
									        <input type="radio" name="gameRating" value="5" id="gameRating1"><label for="gameRating1">⭐</label>
									        <input type="radio" name="gameRating" value="4" id="gameRating2"><label for="gameRating2">⭐</label>
									        <input type="radio" name="gameRating" value="3" id="gameRating3"><label for="gameRating3">⭐</label>
									        <input type="radio" name="gameRating" value="2" id="gameRating4"><label for="gameRating4">⭐</label>
									        <input type="radio" name="gameRating" value="1" id="gameRating5"><label for="gameRating5">⭐</label>
								    </fieldset>
								</form>
								<form name="gameLevel" id="gameLevel" method="post">
								    <fieldset>
								        <legend>난이도</legend>
									        <input type="radio" name="gameLevel" value="5" id="gameLevel1"><label for="gameLevel1">⭐</label>
									        <input type="radio" name="gameLevel" value="4" id="gameLevel2"><label for="gameLevel2">⭐</label>
									        <input type="radio" name="gameLevel" value="3" id="gameLevel3"><label for="gameLevel3">⭐</label>
									        <input type="radio" name="gameLevel" value="2" id="gameLevel4"><label for="gameLevel4">⭐</label>
									        <input type="radio" name="gameLevel" value="1" id="gameLevel5"><label for="gameLevel5">⭐</label>
								    </fieldset>
								</form>
								
						</div>
						<div>
							<form name="requestForm" method="post" id="requestForm">
								<input type=hidden name="gameNo" value="${game.gameNo}">
								<input type=button value="수정하기"> <input type=button
									value="삭제하기">
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Portfolio Details Section -->

		<%--    	<c:choose>
		<c:when test="${empty commentDTO}"> --%>
		<!-- 댓글 없으면 댓글이 없습니다. 멘트 -->
		<form class="replyForm" name="replyForm" method="post"
			action="{pageContext.request.contextPath}/front"
			onSubmit='return checkValid()'>
			<input type="hidden" name="key" value="post" /> <input type="hidden"
				name="methodName" value="insertComment" /> <input type="hidden"
				name="top" value="null" />
			<fieldset>
				<div class="container bootstrap snippets bootdey">
					<div class="row">
						<div class="col-md-12">
							<div class="blog-comment">
								<hr>
								<div class="comments">
									<div class="clearfix">
										<div class="post-comments">
											<p class="meta">
												12월 6일&nbsp;&nbsp;&nbsp;<a href="#">${member.nickname}</a> 님
												:
											</p>
											<textarea class="form-control" name="content"
												placeholder="메세지를 입력해주세요."></textarea>
										</div>
									</div>
								</div>
								<div class="replyButton" style="text-align: right">
									<button type="submit" class="btn delicious-small-btn btn-3">등록</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</fieldset>
		</form>
		<div class="container bootstrap snippets bootdey">
			<div class="row">
				<div class="col-md-12">
					<div class="blog-comment">
						<hr>
						<div class="comments">
							<div class="clearfix" style="text-align: center">
								<span>한줄평이 없습니다! 한줄평을 달아 플레이 경험을 공유 해보는 것은 어떨까요?</span>
								<hr>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- 		</c:when> --%>



		<%-- 	
		<c:otherwise>
		
			<form action="{pageContext.request.contextPath}/front?key=post&methodName=insertComment" method="post">
			<input type="hidden" name="user" value="{sessionScope.userDTO.no}">
			<input type="hidden" name="postNo" value="{postDTO.no}">
			<input type="hidden" name="top" value="0">
			
			

				<fieldset>
					<div class="container bootstrap snippets bootdey">
						<div class="row">
							<div class="col-md-12">
								<div class="blog-comment">
									<hr>
									<div class="comments">
										<div class="clearfix">
											<div class="post-comments">
												<p class="meta">
													<a href="#">${userDTO.nickName}</a> 님 : 
												</p>
												<textarea class="form-control" id="message" 
													placeholder="메세지를 입력해주세요." name="comments"></textarea>
											</div>
										</div>
									</div>
									<div class="replyButton" style="text-align: right">
										<button type="submit" class="btn delicious-small-btn btn-3">등록</button>
									</div>
								</div>
							</div>
						</div>
					</div>

				</fieldset>
			</form>
			
			<c:forEach items="${commentDTO}" var="reply">
				<!-- 돌려서 댓글을 꺼낸다. -->
				<form action="${pageContext.request.contextPath}/front?key=post&methodName=insertComment" method="post">
				<input type="hidden" name="user" value="${sessionScope.userDTO.no}">
				<input type="hidden" name="postNo" value="${postDTO.no}">
				<input type="hidden" name="top" value="1">
				
				<c:if test="${(reply.userNickName == userDTO.nickName) or (userDTO.status == 10)}">
					<li class="clearfix">
						<div class="post-comments">
							<p class="meta">
								${reply.date}
								<a href="#">${reply.userNickName}</a> 님 : <i class="pull-right"><a
									href="#"><small>댓글 추가</small></a></i>
							</p>
							<p>${reply.content}</p>
							<a href="#"><small>수정</small></a> <a href="#"><small>삭제</small></a>
						</div>
					</li>
				</c:if>
				</form>
				
				<form action="${pageContext.request.contextPath}/front?key=post&methodName=insertComment" method="post">
				<input type="hidden" name="user" value="${sessionScope.userDTO.no}">
				<input type="hidden" name="postNo" value="${postDTO.no}">
				<input type="text" name="top" value="2">
				<c:if test="${(reply.userNickName != userDTO.nickName) or (userDTO.status != 10)}">
					<li class="clearfix">
						<div class="post-comments">
							<p class="meta">
								날짜 : ${reply.date} <a href="#">${reply.userNickName}</a> 님 : <i class="pull-right"><a href="#"><small>댓글 추가</small></a></i>
							</p>
							<p>${reply.content}</p>
						</div>
					</li>
				</c:if>
				</form>
			</c:forEach>
		</c:otherwise>
	</c:choose> --%>

	</main>
	<!-- End #main -->

</body>

</html>

<jsp:include page="../common/footer.jsp" />