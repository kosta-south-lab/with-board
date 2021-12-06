<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/header.jsp" />
<head>

  <title>상세 정보 | 위보드</title>
  
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
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">
		<div>즐겨찾기 추가 버튼 이곳에</div>
        <div class="row gy-4">

          <div class="col-lg-8">
            <div class="portfolio-details-slider swiper">
              <div class="swiper-wrapper align-items-center">

                <div class="swiper-slide">
                  <img src="${pageContext.request.contextPath}/img/portfolio/portfolio-1.jpg" alt="">
                </div>

                <div class="swiper-slide">
                  <img src="${pageContext.request.contextPath}/img/portfolio/portfolio-2.jpg" alt="">
                </div>

                <div class="swiper-slide">
                  <img src="${pageContext.request.contextPath}/img/portfolio/portfolio-3.jpg" alt="">
                </div>

              </div>
              <div class="swiper-pagination"></div>
            </div>
            <div class="video-url">
            	<h2>관련 동영상</h2>
           	<iframe width="100%" height="600px" src="https://www.youtube.com/embed/tgbNymZ7vqY"></iframe>
            </div>
            
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3>여기에 보드게임 이름</h3>
              <ul>
                <li><strong>장르</strong>: 여기에 장르</li>
                <li><strong>테마</strong>: 여기에 테마</li>
                <li><strong>진행 방식</strong>: 여기에 진행 방식</li>
                <li><strong>플레이 타임</strong>: 여기에 최소 플레이 타임 ~ 여기에 최대 플레이 타임</li>
                <li><strong>플레이 인원 수</strong>: 여기에 최소 인원 수 ~ 여기에 최대 인원 수</li>
                <li><strong>유저 평점</strong>: 여기에 평균 평점</li>
                <li><strong>유저 난이도 평가</strong>: 여기에 평균 난이도 점수</li>               
              </ul>
            </div>
            <div class="portfolio-info">
              <h3>상세 설명</h3>
              <p>
                Autem ipsum nam porro corporis rerum. Quis eos dolorem eos itaque inventore commodi labore quia quia. Exercitationem repudiandae officiis neque suscipit non officia eaque itaque enim. Voluptatem officia accusantium nesciunt est omnis tempora consectetur dignissimos. Sequi nulla at esse enim cum deserunt eius.
              </p>
            </div>
                        <div class="portfolio-info">
              <h3>이 보드게임을 해보셨나요?<p>경험을 공유해 주세요!</p> </h3>
              <ul>
                <li><strong>평점</strong>: 별 모양 평점</li>
                <li><strong>난이도</strong>: 별 모양 난이도</li>           
              </ul>
            </div>
          </div>
        </div>
        
        <div></div>
        
      </div>
    </section><!-- End Portfolio Details Section -->
    
 <%--    	<c:choose>
		<c:when test="${empty commentDTO}"> --%>
			<!-- 댓글 없으면 댓글이 없습니다. 멘트 -->
			<form class="replyForm" name="replyForm" method="post" action="{pageContext.request.contextPath}/front" onSubmit='return checkValid()'>
				<input type="hidden" name="key" value="post" /> 
				<input type="hidden" name="methodName" value="insertComment"/>
				<input type="hidden" name="top" value="null"/>
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
													12월 6일&nbsp;&nbsp;&nbsp;<a href="#">{userDTO.nickName}</a>
													님 :
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
    
  </main><!-- End #main -->

</body>

</html>

<jsp:include page="../common/footer.jsp" />