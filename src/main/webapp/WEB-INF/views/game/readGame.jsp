<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b>
             ������� �� ����</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">��ȣ</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${game.gameNo}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">����</span></b></p>
        </td>
        <td width="300" height="20">
        	<span style="font-size:9pt;"><b>${requestScope.game.gameName}</b></span>
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">�ִ� �ο� ��</span></b></p>
		</td>
        <td width="100" height="20">
			<p><b><span style="font-size:9pt;"></span>${requestScope.game.playPersonnelMax}</b></p>
		</td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">�ּ� �ο� ��</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${requestScope.game.playPersonnelMin}</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">�ִ� �÷���Ÿ��</span></b></p>
        </td>
		<!-- �������� �� ������ �ѷ��� ���� ���๮��(\n)�� <br>�±׷� ��ȯ�� ���ڿ��� ������� �Ѵ�. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.gamePlaytimeMax}</pre></b></span></td>
    </tr>
    
        <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">�ִ� �÷���Ÿ��</span></b></p>
        </td>
		<!-- �������� �� ������ �ѷ��� ���� ���๮��(\n)�� <br>�±׷� ��ȯ�� ���ڿ��� ������� �Ѵ�. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.gamePlaytimeMax}</pre></b></span></td>
    </tr>
    
        <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">���� ��ũ</span></b></p>
        </td>
		<!-- �������� �� ������ �ѷ��� ���� ���๮��(\n)�� <br>�±׷� ��ȯ�� ���ڿ��� ������� �Ѵ�. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.videoUrl}</pre></b></span></td>
    </tr>
    
        <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">���� ���</span></b></p>
        </td>
		<!-- �������� �� ������ �ѷ��� ���� ���๮��(\n)�� <br>�±׷� ��ȯ�� ���ڿ��� ������� �Ѵ�. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.gameProcess}</pre></b></span></td>
    </tr>
    
            <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">�׸�</span></b></p>
        </td>
		<!-- �������� �� ������ �ѷ��� ���� ���๮��(\n)�� <br>�±׷� ��ȯ�� ���ڿ��� ������� �Ѵ�. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.gameTheme}</pre></b></span></td>
    </tr>
    
            <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">�帣</span></b></p>
        </td>
		<!-- �������� �� ������ �ѷ��� ���� ���๮��(\n)�� <br>�±׷� ��ȯ�� ���ڿ��� ������� �Ѵ�. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.game.gameCategory}</pre></b></span></td>
    </tr>
    
 
<%--  <c:if test="${���ǿ� ���ִ� ������ �������ͽ��� ������ ���}>
   
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
			<!-- ������ �ʿ��� �����͵��� hidden���� ���ܳ��� �� �����ͷ� �����ش�. -->
			<form name="requestForm" method="post" id="requestForm">
				<input type=hidden name="bno" value="${game.gameNo}">
				<input type=button value="�����ϱ�" >
				<input type=button value="�����ϱ�" >
			</form>
		</td>
    </tr>   
  </c:if>     --%> 
</table>

</body>
</html>