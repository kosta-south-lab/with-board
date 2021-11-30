<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
<caption>검색 결과 LIST</caption>
	<colgroup>
		<col width="15%"/>
		<col width="30%"/>
		<col width="16%"/>
		<col width="16%"/>
		<col width="7%"/>
		<col width="7%"/>
		<col width="7%"/>
	</colgroup>
	<tr>
        <td bgcolor="#00cc00">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">번호</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">보드게임 이름</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">장르</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">테마</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">난이도</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">평점</span></b></font></p>
        </td>
    </tr>
    <c:choose>
    	<c:when test="${empty requestScope.gameList}">
	<tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">검색 된 결과가 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.gameList.content}" var="game">
		    <tr onmouseover="this.style.background='#eaeaea'" onmouseout="this.style.background='white'">
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${game.gameNo}</span></p>
		        </td>
		        <td bgcolor="">
					<p><span style="font-size:9pt;">
					<a href="${pageContext.request.contextPath}/game/readGame/${game.gameNo}">
					  ${game.gameName}</b>
					</a>
					</span></p>
		        </td>
		        		       
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${game.gameCategory.gameCategoryName}</span></p>
		        </td>
		         	        
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${game.gameTheme.themeName}</span></p>
		        </td>
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
</table>
<hr>
${pageList.hasPrevious()}  /  ${pageList.hasNext()}
<div style="text-align: center">
<!-- 페이징 처리 -->
 <c:forEach begin="0" end="${gameList.totalPages-1}" var="i">
   <c:choose>
     <c:when test="${gameList.number==i}">
         <a href="${pageContext.request.contextPath}/board/list?nowPage=${i}" style="color:red"> [ ${i+1} ] </a>
     </c:when>
     <c:otherwise>
         <a href="${pageContext.request.contextPath}/board/list?nowPage=${i}"> [ ${i+1} ] </a>
     </c:otherwise>
   </c:choose>
 </c:forEach>
</div>

 
 <!-- 이전, 다음 표시 하기 (한블럭당 페이지 개수 제한)  -->
 <c:set var="doneLoop" value="false"/>
	\${doneLoop} = ${doneLoop}<p>
		<!--  블럭당  -->
<!--  <nav class="pagination-container"> -->
	<div class="pagination">
	<c:set var="doneLoop" value="false"/>
		
		  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
		      <a class="pagination-newer" href="${pageContext.request.contextPath}/game/list?nowPage=${startPage-1}">PREV</a>
		  </c:if>
		  
				<span class="pagination-inner"> 
				  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
				  
					 <c:if test="${(i-1)>=gameList.getTotalPages()}">
					       <c:set var="doneLoop" value="true"/>
					    </c:if>    
				    
				  <c:if test="${not doneLoop}" >
				         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/game/list?nowPage=${i}">${i}</a> 
				  </c:if>
				   
				</c:forEach>
				</span> 

				 <c:if test="${(startPage+blockCount)<=gameList.getTotalPages()}">
				     <a class="pagination-older" href="${pageContext.request.contextPath}/game/list?nowPage=${startPage+blockCount}">NEXT</a>
				 </c:if>
				 
			
		
		</div>
<!-- 	</nav>   -->
	\${doneLoop} = ${doneLoop}<p>
 
 
 <!--  -->

</body>
</html>