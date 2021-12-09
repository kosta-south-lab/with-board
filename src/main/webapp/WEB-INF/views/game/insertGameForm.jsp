<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/header.jsp" />
<head>

 <title>상세 정보 | 위보드</title>
 
 <script type="text/javascript">
 
 
 $(function(){
	 
/* 	 $('.content')
	 .on("dragover", dragOver)
	 .on("dragleave", dragOver)
	 .on("drop", uploadFiles); */
	 
	 $("input[value=등록]").click(function(){
			   				   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/game/insertGame");
		   $("#requestForm").submit();
		 
/* 		  console.debug("insertGameForm::socket>>", matchSocket)
		  if(matchSocket){
			  var socketMsg1 = "insertGame," + "${member.nickname}" + ",test200,123";
			 
			  console.debug("ssssssssssmsg>", socketMsg1);
			  matchSocket.send(socketMsg1); */
		  }
		  

	 });

 });

/* function dragOver(e){
 e.stopPropagation();
 e.preventDefault();
 if (e.type == "dragover") {
   $(e.target).css({
     "background-color": "black",
     "outline-offset": "-20px"
   });
 } else {
     $(e.target).css({
     "background-color": "gray",
     "outline-offset": "-10px"
   });
   }
}

function uploadFiles(e) {
   e.stopPropagation();
   e.preventDefault();
   dragOver(e);
 
   e.dataTransfer = e.originalEvent.dataTransfer;
   var files = e.target.files || e.dataTransfer.files;
   if (files.length > 1) {
       alert('한 칸에 한개씩만 올려주세요!');
       return;
   }
   if (files[0].type.match(/image.)) {
               $(e.target).css({
           "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
           "outline": "none",
           "background-size": "100% 100%"
       });
   }else{
     alert('이미지가 아닙니다.');
     return;
   } */
}
</script>
 
 <style type="text/css">
 .content{
    outline: 2px dashed #92b0b3 ;
    outline-offset:-10px;  
    text-align: center;
    transition: all .15s ease-in-out;
    width: 500px;
    height: 500px;
    background-color: gray;
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
    </section><!-- End Breadcrumbs -->

<form name="insertGameForm" method="post" action="${pageContext.request.contextPath}/game/insertGame">

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">
        <div class="row gy-4">
          <div class="col-lg-8">
			<h3>이미지 등록</h3>
			<input multiple="multiple"  type="file" name="filename" />
            <div class="video-url">
            	<h2>관련 동영상</h2>
           		<input type=text name="videoUrl" maxlength="50" size="30">
            </div>
            
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3>보드게임 이름<input type=text name="gameName" maxlength="50" size="30"></h3>
              
              <ul>
                <li><strong>장르 : </strong>
	             	<select name="gameCategory" id="gameCategory">
	             		<option selected disabled value = "0">--------------------</option>
						<option value = "1">가족 게임</option>
						<option value = "2">어린이 게임</option>
						<option value = "3">전략 게임</option>
						<option value = "4">전쟁 게임</option>
						<option value = "5">추상 게임</option>
						<option value = "6">커스터마이징 게임</option>
						<option value = "7">테마 게임</option>
						<option value = "8">파티 게임</option>
					</select>
                </li>
                <li><strong>테마</strong>: 여기에 테마</li>
                <li><strong>진행 방식</strong>: 여기에 진행 방식</li>
                <li><strong>플레이 타임</strong>: <input type=text name="gamePlaytimeMin" maxlength="4" size="4">분 ~ <input type=text name="gamePlaytimeMax" maxlength="4" size="4">분</li>
                <li><strong>플레이 인원 수</strong>: <input type=text name="playPersonnelMin" maxlength="2" size="4">명 ~ <input type=text name="playPersonnelMax" maxlength="2" size="4">명</li>
                <li><strong>연령</strong>: <input type=text name="age" maxlength="2" size="4">살+</li>                
              </ul>
            </div>
            <div class="portfolio-info">
              <h3>상세 설명</h3>
				<textarea rows = "10" cols = "40" name="gameDetail"></textarea>
            </div>
          </div>
        </div>
        
        <div></div>
        
      </div>
    </section><!-- End Portfolio Details Section -->
    
    <b><input type="button" value=등록> 
    <input type=reset value=다시쓰기></b>
  </form>
       
  </main><!-- End #main -->

</body>

</html>

<jsp:include page="../common/footer.jsp" />