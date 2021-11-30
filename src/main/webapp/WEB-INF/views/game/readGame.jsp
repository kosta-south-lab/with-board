<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 보드게임 정보</title>

<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	$(function(){
		
		   $("input[value=수정하기]").click(function(){
			   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
			   
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/game/updateGameForm");
			   $("#requestForm").submit();
		   });
		   
		   
		   $("input[value=삭제하기]").click(function(){
	
				   $("#requestForm").attr("action", "${pageContext.request.contextPath}/game/deleteGame");
				   $("#requestForm").submit();
			   }
		   });
		   
	});
</script>
</head>
<body>

<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b>
             보드게임 상세 정보</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">번호</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${game.gameNo}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="300" height="20">
        	<span style="font-size:9pt;"><b>${requestScope.game.gameName}</b></span>
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">최대 인원 수</span></b></p>
		</td>
        <td width="100" height="20">
			<p><b><span style="font-size:9pt;"></span>${requestScope.game.playPersonnelMax}</b></p>
		</td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">최소 인원 수</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${requestScope.game.playPersonnelMin}</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">최대 플레이타임</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.gamePlaytimeMax}</pre></b></span></td>
    </tr>
    
        <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">최대 플레이타임</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.gamePlaytimeMax}</pre></b></span></td>
    </tr>
    
        <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">비디오 링크</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.videoUrl}</pre></b></span></td>
    </tr>
    
        <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">진행 방식</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.gameProcess}</pre></b></span></td>
    </tr>
    
            <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">테마</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.gameTheme}</pre></b></span></td>
    </tr>
    
            <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">장르</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.gameCategory}</pre></b></span></td>
    </tr>
   
   
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
			<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
			<form name="requestForm" method="post" id="requestForm">
				<input type=hidden name="gameNo" value="${game.gameNo}">
				<input type=button value="수정하기">
				<input type=button value="삭제하기">
			</form>
		</td>
    </tr>   

</table>

</body>
</html>