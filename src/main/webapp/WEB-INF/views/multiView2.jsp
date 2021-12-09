<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>




setTimeout(function() {
	
	var goroom = sessionStorage.getItem("goRoom");
	console.log(goroom);
	if(goroom!=null)
	top.reg.location.href=goroom;
	storage.removeItem("goRoom");

	}, 2000);

</script>
</head>
<body>


<table style="background-color: #D8E6E7;left:300px;font-family: 'Do Hyeon', sans-serif;"   border="1" width="1500" height="700"  >
  <jsp:include page="common/header.jsp" />



<tr>
	
	<tr>
	<td><iframe src="/room2"  name="reg2" frameborder="0" width="100%" height="100%"></iframe></td>

	<td><iframe src="/chat"  name="reg" frameborder="0" width="100%" height="100%"></iframe></td>
</tr>





</table>

<jsp:include page="common/footer.jsp" />
	



</body>
</html>