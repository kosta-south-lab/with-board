<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  
  <!--  csrf 토큰  -->
  <meta id="_csrf" name="csrf" context="${_csrf.token}"/>
  <meta id="_csrf_header" neme="_csrf_header" context="${_csrf.headerName}"/>
 

  <title>회원가입 form</title>
  
 <style type="">
 
 </style>
 <script src="../js/jquery-3.6.0.js"></script>
 <script type="text/javascript">
 
 
 function cancel(){ //취소하기 눌렀을때
		if(confirm("취소하시겠습니까?") == true){
			parent.location.href = "/home";
		 }
}

 function checkValid(frm){
		
		if(frm.name.value == ""){ //boardTitle 는 id값이다 , ""은 = 공백일경우 
			alert("이름을 입력해주세요.");
			frm.name.focus(); // 제목이 입력되지 않은경우 경고창이 뜨고 포커스를 제목으로 가져다준다.
			return false;
		}
		
		if(frm.nickname.value == ""){
			alert("닉네임을 입력해주세요.");
			frm.nickname.focus();
			return false;
		}
		
		if(frm.id.value == ""){
			alert("아이디를 입력해주세요.");
			frm.id.focus();
			return false;
		}
		
		if(frm.pw.value == ""){
			alert("패스워드를 입력해주세요.");
			frm.pw.focus();
			return false;
		}
		
		if(frm.gender.value == ""){
			alert("성별을 선택해주세요.");
			frm.gender.focus();
			return false;
		}
		if(frm.email.value == ""){
			alert("이메일을 입력해주세요.");
			frm.email.focus();
			return false;
		}
		if(frm.location.value == ""){
			alert("주소를 입력해주세요.");
			frm.location.focus();
			return false;
		}
		if(frm.location2.value == ""){
			alert("나머지 주소를 입력해주세요.");
			frm.location2.focus();
			return false;
		}
		
	}
 
 
 
 
 </script>
  
  
 </head>
 <body>
 <!-- spring security POST 전송시 무조건 csrf 를 보내야한다. (GET은 안보내도됨 )  -->
 

 <form name="signupForm" method="post" onsubmit="return checkValid(this);" action="${pageContext.request.contextPath}/user/join">
 	  <input type = hidden name = "key" value = "members">
      <input type = hidden name = "methodName" value = "joinMember">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id="signupForm">  
  
   <table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
      <tr>
         <th> 이름</th>
         <td><input type="text" name="name" id="name"></td>
      </tr>
      <tr>
         <th> 닉네임</th>
         <td><input type="text" name="nickname" id="nickname"></td>
      </tr>
       <tr>
         <th>아이디</th>
         <td>
         <input type="text" name="id" id="id">
         </td>
       </tr>
       <tr>
         <th>비밀번호</th>
         <td><input type="password" name="pw" id="pw"> </td> <!-- 영문/숫자포함 6자 이상 -->
       </tr>
    	<tr>
     	 <th>성별</th>
		<td> 
     	<input type="radio" name="gender" id=" gender" value="male" >
     		MEN  
     	<input type="radio" name="gender" id=" gender" value="female">WOMAN
		</td>
   		 </tr>
   		 <tr>
        <tr>
          <th>이메일</th>
          <td>
            <input type='text' name="email" id="email">@
            <input type='text' name="email2" id="email2">
              <select name="emailaddr">
                 <option value="">직접입력</option>
                 <option value="daum.net">daum.net</option>
                 <option value="empal.com">empal.com</option>
                 <option value="gmail.com">gmail.com</option>
                 <option value="hanmail.net">hanmail.net</option>
                 <option value="msn.com">msn.com</option>
                 <option value="naver.com">naver.com</option>
                 <option value="nate.com">nate.com</option>
              </select>
            </td>
         </tr>
         <tr>
           <th>주소</th>
           <td>
             <input type="text" name="location" id="location"> - 
             <input type="text" name="location2" id="location2">
             <br>

           </td>
         </tr>
        <tr>
      <th>이미지</th>
		<td>
   		  <input type="image" name="image" id="image" value="첨부">       
		</td>
   		 </tr>
 
           <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
           <tr>
             <td colspan="2" align="center">
               <input type="submit" value="가입하기">
               <input type="reset" onclick="cancel();" value="취소">
            </td>
           </tr>
           </table>
          </form>
 </body>
</html>
