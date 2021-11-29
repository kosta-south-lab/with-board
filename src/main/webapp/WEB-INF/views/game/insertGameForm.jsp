<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드 게임 등록 페이지</title>

<script type="text/javascript">



</script>

</head>
<body>

<form name="insertGameForm" method="post" action="${pageContext.request.contextPath}/game/insertGame">

<table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 보드게임 등록 </b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="gameName" size="30"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">카테고리</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<select name="gameCategory" id="gameCategory">
			<option value = "1">가족 게임</option>
			<option value = "2">어린이 게임</option>
			<option value = "3">전략 게임</option>
			<option value = "4">전쟁 게임</option>
			<option value = "5">추상 게임</option>
			<option value = "6">커스터마이징 게임</option>
			<option value = "7">테마 게임</option>
			<option value = "8">파티 게임</option>
		</select>
		</span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">테마</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="gameTheme"  rows="20" cols="20"></textarea></span></b></td>
    </tr>
    
        <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">최대 인원 수</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="playPersonnelMax"  rows="20" cols="20"></textarea></span></b></td>
    </tr>
    
        <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">최소 인원 수</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="playPersonnelMin"  rows="20" cols="20"></textarea></span></b></td>
    </tr>
    
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">최대 플레이타임</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="gamePlaytimeMax"  rows="20" cols="20"></textarea></span></b></td>
    </tr>
    
     <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">최소 플레이타임</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="gamePlaytimeMin"  rows="20" cols="20"></textarea></span></b></td>
    </tr>
    
             <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">비디오 링크 등록</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="videoUrl"  rows="20" cols="20"></textarea></span></b></td>
    </tr>
    
   
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">연령</span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type=text name="age" size="2">
        	   </span></b>
        </td>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=글쓰기> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>

</form>

<form name="insertGameImage" method="post" action="${pageContext.request.contextPath}/image/insertGameImage">

    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">프로필 사진 등록</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="gamePlaytimeMin"  rows="20" cols="20"></textarea></span></b></td>
    </tr>
    
</form>

<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/board/list">리스트로 돌아가기</a>&gt;</span></div>

</body>
</html>