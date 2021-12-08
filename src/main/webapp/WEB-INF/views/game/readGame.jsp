<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	   
	   $("input:radio[name=score]").click(function(){
               alert(111)
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/game/insertRating");
		   $("#requestForm").submit();
	   
   	   });	
	   
	   $("input:radio[name=levelScore]").click(function(){

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

/*-----------------------------------------------*/


.blog-comment::before, .blog-comment::after, .blog-comment-form::before,
	.blog-comment-form::after {
	content: "";
	display: table;
	clear: both;
}

.blog-comment {
	padding-left: 15%;
	padding-right: 15%;
}

.blog-comment ul {
	list-style-type: none;
	padding: 0;
}

.blog-comment img {
	opacity: 1;
	filter: Alpha(opacity = 100);
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
}

.blog-comment img.avatar {
	position: relative;
	float: left;
	margin-left: 0;
	margin-top: 0;
	width: 65px;
	height: 65px;
}

.blog-comment .post-comments {
	border: 1px solid #eee;
	margin-bottom: 20px;
	margin-left: 85px;
	margin-right: 0px;
	padding: 10px 20px;
	position: relative;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	background: #fff;
	color: #6b6e80;
	position: relative;
}

.blog-comment .meta {
	font-size: 13px;
	color: #aaaaaa;
	padding-bottom: 8px;
	margin-bottom: 10px !important;
	border-bottom: 1px solid #eee;
}

.blog-comment ul.comments ul {
	list-style-type: none;
	padding: 0;
	margin-left: 85px;
}

.blog-comment-form {
	padding-left: 15%;
	padding-right: 15%;
	padding-top: 40px;
}

.blog-comment h3, .blog-comment-form h3 {
	margin-bottom: 40px;
	font-size: 26px;
	line-height: 30px;
	font-weight: 800;
}

#boardContent {
	text-align: center;
}

.success {
	width: 100px;
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
				<form name="insertFavorites" method="post" action="${pageContext.request.contextPath}/favorites/insert">
				<input type=hidden name="gameNo" value="${game.gameNo}">
				<input type=hidden name="memberNo" value="${member.memberNo}">
					<button>즐겨찾기 추가</button>
				</form>
				<form name="deleteFavorites" method="post" action="${pageContext.request.contextPath}/favorites/delete">
				<input type=hidden name="gameNo" value="${game.gameNo}">
				<input type=hidden name="memberNo" value="${member.memberNo}">
					<button>즐겨찾기 해제</button>
				</form>
				<div class="row gy-4">

					<div class="col-lg-8">
						<div class="portfolio-details-slider swiper">
							<div class="swiper-wrapper align-items-center">
								<c:forEach items="${game.imageList}" var="image">
								<div class="swiper-slide">
									<img
										src="${pageContext.request.contextPath}${image.imageUrl}"
										alt="">
								</div>
								</c:forEach>
							</div>
							<div class="swiper-pagination"></div>
						</div>
						<div class="video-url">
							<h2>관련 동영상</h2>
							<iframe width="100%" height="600px"
								src="${game.videoUrl}"></iframe>
						</div>

					</div>

					<div class="col-lg-4">
						<div class="portfolio-info">
							<h3>${game.gameName}</h3>
							<ul>
								<li><strong>장르</strong>:
									${game.gameCategory.gameCategoryName}</li>
								<li><strong>테마</strong>:
									${game.gameTheme.themeName}</li>
								<li><strong>진행 방식</strong>:
									${game.gameProcess.processName}</li>
								<li><strong>플레이 타임</strong>:
									${game.gamePlaytimeMin} ~
									${game.gamePlaytimeMax}</li>
								<li><strong>플레이 인원 수</strong>:
									${game.playPersonnelMin} ~
									${game.playPersonnelMax}</li>
								<li><strong>유저 평점</strong>: 여기에 평균 평점</li>
								<li><strong>유저 난이도 평가</strong>: 여기에 평균 난이도 점수</li>
							</ul>
						</div>
						<div class="portfolio-info">
							<h3>상세 설명</h3>
							<p>${game.gameDetail}</p>
						</div>
						<div class="portfolio-info">
								<form name="gameRating" id="gameRating" method="post">
								    <fieldset>
								        <legend>?이 보드게임을 해보셨나요<p>!경험을 공유해 주세요</p><p>평점</p></legend>
								        	<input type=hidden name="gameNo" value="${game.gameNo}">
								        	<input type=hidden name="memberNo" value="${member.memberNo}">
									        <input type="radio" name="score" value="5" id="gameRating1"><label for="gameRating1">⭐</label>
									        <input type="radio" name="score" value="4" id="gameRating2"><label for="gameRating2">⭐</label>
									        <input type="radio" name="score" value="3" id="gameRating3"><label for="gameRating3">⭐</label>
									        <input type="radio" name="score" value="2" id="gameRating4"><label for="gameRating4">⭐</label>
									        <input type="radio" name="score" value="1" id="gameRating5"><label for="gameRating5">⭐</label>
								    </fieldset>
								</form>
								<form name="gameLevel" id="gameLevel" method="post">
								    <fieldset>
								        <legend>난이도</legend>
								        	<input type=hidden name="gameNo" value="${game.gameNo}">
								        	<input type=hidden name="memberNo" value="${member.memberNo}">
									        <input type="radio" name="levelScore" value="5" id="gameLevel1"><label for="gameLevel1">⭐</label>
									        <input type="radio" name="levelScore" value="4" id="gameLevel2"><label for="gameLevel2">⭐</label>
									        <input type="radio" name="levelScore" value="3" id="gameLevel3"><label for="gameLevel3">⭐</label>
									        <input type="radio" name="levelScore" value="2" id="gameLevel4"><label for="gameLevel4">⭐</label>
									        <input type="radio" name="levelScore" value="1" id="gameLevel5"><label for="gameLevel5">⭐</label>
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

	   	<c:choose>
		<c:when test="${empty game.gameCommentList}">
		<!-- 댓글 없으면 댓글이 없습니다. 멘트 -->
		<form class="replyForm" name="replyForm" method="post"
			action="${pageContext.request.contextPath}/game/insertComment">
			<input type="hidden" name="gameNo" value="${game.gameNo}" /> 
			<input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}" /> 
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
											<textarea class="form-control" name="gameCommentContents"
												placeholder="메세지를 입력해주세요."></textarea>
										</div>
									</div>
								</div>
								<div class="commentButton" style="text-align: right">
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
								<span>댓글이 없습니다! 댓글을 달아 플레이 경험을 공유 해보는 것은 어떨까요?</span>
								<hr>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
			
		<c:otherwise>
			<c:if test="${sessionScope.member != null}">
			<form action="${pageContext.request.contextPath}/game/insertComment" method="post">
			<input type="hidden" name="gameNo" value="${game.gameNo}" /> 
			<input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}" /> 	
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
													<a href="#">${member.nickname}</a> 님 : 
												</p>
												<textarea class="form-control" id="gameCommentContents" 
													placeholder="메세지를 입력해주세요." name="gameCommentContents"></textarea>
											</div>
										</div>
									</div>
									<div class="commentButton" style="text-align: right">
										<button type="submit" class="btn delicious-small-btn btn-3">등록</button>
									</div>
								</div>
							</div>
						</div>
					</div>

				</fieldset>
			</form>
			</c:if>
			<c:forEach items="${game.gameCommentList}" var="gameComment">
				<!-- 돌려서 댓글을 꺼낸다. -->
				<form action="${pageContext.request.contextPath}/game/insertComment" method="post">
				
				<input type="hidden" name="gameNo" value="${game.gameNo}" /> 
				<input type="hidden" name="memberNo" value="${member.memberNo}" /> 
				

					<div class="blog-comment">
					<div class="comments">
						<div class="post-comments">
							<p class="meta">
								${gameComment.commentDate}
								<a href="#">${gameComment.member.nickname}</a> 님 :
							</p>
							<p>${gameComment.gameCommentContents}</p>
						<c:if test="${(gameComment.member.nickname == sessionScope.member.nickname) or (gameComment.member.status == 10)}">
							<a href="${pageContext.request.contextPath}/game/deleteComment/${gameComment.commentNo}/${game.gameNo}"><small>삭제</small></a>
						</c:if>
						</div>
						</div>
						</div>				
				</form>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	    <!-- ======= Blog Single Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">
        <div class="row">
          <div class="col-lg-8 entries">
            <div class="blog-comments">
              <h4 class="comments-count">
              <c:choose>
              	<c:when test="${empty game.gameCommentList}">0</c:when>
              	<c:otherwise>
              		${fn:length(game.gameCommentList)}
              	</c:otherwise>
              </c:choose>
			  개의 댓글이 달렸어요
			  </h4>
       
              <c:forEach items="${game.gameCommentList}" var="gameComment">
	              <div id="comment-1" class="comment">
	                <div class="d-flex">
	                  <div class="comment-img"><img src="${pageContext.request.contextPath}/resources/images/profile/profile.png" alt="프로필이미지"></div>
	                  <div>
	                    <h5 class="d-flex justify-content-between">
	                    	<a href="">${gameComment.member.name}</a>
	                    	<c:if test="${gameComment.member.id == sessionScope.member.id}">
		                    	<button type="submit" class="btn btn-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/board/reply/delete/${gameComment.commentNo}?boardType=meet&boardNo=${meet.boardNo}'">삭제</button>
	                    	</c:if>
	                    </h5>
	                    <fmt:parseDate value="${gameComment.commentDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedReplyDateTime" type="both"/>
	                    <time><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedReplyDateTime}"/></time>
	                    <p>
	                      ${gameComment.gameCommentContents}
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

	</main>
	<!-- End #main -->

</body>

</html>

<jsp:include page="../common/footer.jsp" />