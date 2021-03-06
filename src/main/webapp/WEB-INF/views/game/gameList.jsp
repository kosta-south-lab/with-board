<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/header.jsp" />
<head>
<title>검색 결과 | 위보드</title>
  
</head>

<body>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="${pageContext.request.contextPath}/sample/index">홈</a></li>
          <li><a href="${pageContext.request.contextPath}/sample/blog">검색</a></li>
        </ol>
        <h2>검색 결과</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Single Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row">

          <div class="col-lg-8 entries">

			   <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-1">가족</li>
              <li data-filter=".filter-2">어린이</li>
              <li data-filter=".filter-3">전략</li>
            </ul>
          </div>
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter=".filter-4">전쟁</li>
              <li data-filter=".filter-5">추상</li>
              <li data-filter=".filter-6">커스터마이징</li>
              <li data-filter=".filter-7">테마</li>
              <li data-filter=".filter-8">파티</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container">
	
		<c:choose>
		<c:when test="${empty requestScope.gameList}">
 			<d2>검색 결과에 해당하는 게임이 없습니다.</d2>
          </c:when>
          
          <c:otherwise>
            <c:forEach items="${gameList.content}" var="game">
            <c:forEach items="${game.imageList}" var="image">
            <div class="col-lg-4 col-md-6 portfolio-item filter-${game.gameCategory.gameCategoryNo}">        
            <div class="portfolio-wrap">                    
              <img src="${pageContext.request.contextPath}${image.imageUrl}" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>${game.gameName}</h4>
                <p>${game.gameCategory.gameCategoryName}</p>
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath}${image.imageUrl}" data-gallery="portfolioGallery" class="portfolio-lightbox" title="보드게임 이미지 확대"><i class="bx bx-plus"></i></a>
                  <a href="${pageContext.request.contextPath}/game/readGame/${game.gameNo}" title="상세 페이지로 가기"><i class="bx bx-link"></i></a>
                </div>

              </div>
            </div>
          </div>
	           </c:forEach>
	  		</c:forEach> 
          </c:otherwise>
		</c:choose>
        </div>

<!--  블럭당  -->
	<!--  <nav class="pagination-container"> -->
 <nav class="pagination-container">
	<div class="pagination">
	<c:set var="doneLoop" value="false"/>
		
		  <c:if test="${gameList.hasPrevious()}"> <!-- (-2) > 0  -->
		      <a class="pagination-newer" href="${pageContext.request.contextPath}/game/gameList?nowPage=${startPage-1}">PREV</a>
		  </c:if>
		  
				<span class="pagination-inner"> 
				  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
				  
					    <c:if test="${(i-1)>=gameList.getTotalPages()}">
					       <c:set var="doneLoop" value="true"/>
					    </c:if> 
				    
				  <c:if test="${gameList.hasNext()}" >
				         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/game/gameList?nowPage=${i}">${i}</a> 
				  </c:if>
				   
				</c:forEach>
				</span> 
				 <c:if test="${(startPage+blockCount)<=gameList.getTotalPages()}">
				     <a class="pagination-older" href="${pageContext.request.contextPath}/game/gameList?nowPage=${startPage+blockCount}">NEXT</a>
				 </c:if>		
		</div>
	</nav>  

      </div>
    </section><!-- End Portfolio Section -->


          </div><!-- End of col-lg-8 -->

          <div class="col-lg-4">

            <div class="sidebar">

              <h3 class="sidebar-title">보드게임 검색</h3>
              <div class="sidebar-item search-form">
                <form action="${pageContext.request.contextPath}/game/searchGameList">
                  <input name="keyword" type="text">
                  <button type="submit"><i class="bi bi-search"></i></button>
                </form>
              </div><!-- End sidebar search formn-->

              <h3 class="sidebar-title">속성별 검색</h3>
              <div class="sidebar-item categories">
                <ul>
                  <li><a href="#">General <span>(25)</span></a></li>
                  <li><a href="#">Lifestyle <span>(12)</span></a></li>
                  <li><a href="#">Travel <span>(5)</span></a></li>
                  <li><a href="#">Design <span>(22)</span></a></li>
                  <li><a href="#">난이도 <span>(8)</span></a></li>
                  <li><a href="#">평점 <span>(14)</span></a></li>
                </ul>
              </div><!-- End sidebar categories-->

              <h3 class="sidebar-title">최근 출시 된 보드게임</h3>
              <div class="sidebar-item recent-posts">
                <div class="post-item clearfix">
                  <img src="${pageContext.request.contextPath}/img/blog/blog-recent-1.jpg" alt="">
                  <h4><a href="blog-single.html">Nihil blanditiis at in nihil autem</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="${pageContext.request.contextPath}/img/blog/blog-recent-2.jpg" alt="">
                  <h4><a href="blog-single.html">Quidem autem et impedit</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="${pageContext.request.contextPath}/img/blog/blog-recent-3.jpg" alt="">
                  <h4><a href="blog-single.html">Id quia et et ut maxime similique occaecati ut</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="${pageContext.request.contextPath}/img/blog/blog-recent-4.jpg" alt="">
                  <h4><a href="blog-single.html">Laborum corporis quo dara net para</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="${pageContext.request.contextPath}/img/blog/blog-recent-5.jpg" alt="">
                  <h4><a href="blog-single.html">Et dolores corrupti quae illo quod dolor</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

              </div><!-- End sidebar recent posts-->

            </div><!-- End sidebar -->

          </div><!-- End blog sidebar -->

        </div>

      </div>
    </section><!-- End Blog Single Section -->

  </main><!-- End #main -->

</body>

</html>

<jsp:include page="../common/footer.jsp" />