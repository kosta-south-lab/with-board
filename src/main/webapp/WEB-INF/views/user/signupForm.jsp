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
		
		if(frm.id.value == ""){  
			alert("아이디를 입력해주세요.");
			frm.id.focus(); // 제목이 입력되지 않은경우 경고창이 뜨고 포커스를 제목으로 가져다준다.
			return false;
		}
		
		if(frm.pw.value == ""){
			alert("비밀번호를 입력해주세요.");
			frm.pw.focus();
			return false;
		}
		
		if(frm.name.value == ""){
			alert("이름을 입력해주세요.");
			frm.name.focus();
			return false;
		}
		
		if(frm.nickname.value == ""){
			alert("닉네임을 입력해주세요.");
			frm.nickname.focus();
			return false;
		}
		
		if(frm.gender1.value == ""){
			alert("성별을 선택해주세요.");
			frm.gender1.focus();
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
		
		if(confirm("회원가입하시겠습니까?") == true){
			return true;
		}
	}
 
 </script>
  
  
 </head>
 <body>
 <!-- spring security POST 전송시 무조건 csrf 를 보내야한다. (GET은 안보내도됨 )  -->
 

 <form name="signupForm" method="post" onsubmit="return checkValid(this);"action="${pageContext.request.contextPath}/user/joinConfirm">

 	  <input type = hidden name = "key" value = "members">
      <input type = hidden name = "methodName" value = "joinMember">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id="signupForm">  
  
   <table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
        <tr>
         <th><label for="id">아이디</label></th>
         <td>
         	<input type="text" name="id" id="id" value="">
         	<c:if test="${!empty msg}">
         	<span style="color:red;margin-left:15px;">${msg}</span>
         	</c:if>
         </td>
       </tr>
        <tr>
         <th><label for="pw">비밀번호</label></th>
         <td><input type="password" name="pw" id="pw" value="${member.pw}"> </td> <!-- 영문/숫자포함 6자 이상 -->
       </tr>
      <tr>
         <th><label for="name"> 이름</label></th> <%--label을 사용할때 id값으로 지정해야한다. --%>
         <td><input type="text" name="name" id="name" value="${member.name}"></td>
      </tr>
      <tr>
         <th><label for="nickname">닉네임 </label></th>
         <td><input type="text" name="nickname" id="nickname" value="${member.nickname}"></td>
      </tr>
      <!--  <tr>
         <th>비밀번호 확인</th>
         <td><input type="password" name="pwcheck" > </td> 영문/숫자포함 6자 이상
       </tr> -->
    	<tr>
     	 <th><label for="gender1">성별</label></th>
		<td> 
     	<input type="radio" name="gender" id="gender1" value="male"${member.gender eq 'male' ? ' checked="checked"':''}/>
     		<label for="gender1">MEN</label> 
     	<input type="radio" name="gender" id="gender2" value="female"${member.gender eq 'female' ? ' checked="checked"':''}/>
     		<label for="gender2">WOMAN</label> 
		</td>
   		 </tr>
   		 <tr>
        <tr>
          <th><label for="email">이메일</label></th>
          <td>
            <input type='text' name="email" id="email" value="${member.email}">
           <!--  <input type='text' name="email2" id="email2">
              <select name="emailaddr">
                 <option value="">직접입력</option>
                 <option value="daum.net">daum.net</option>
                 <option value="empal.com">empal.com</option>
                 <option value="gmail.com">gmail.com</option>
                 <option value="hanmail.net">hanmail.net</option>
                 <option value="msn.com">msn.com</option>
                 <option value="naver.com">naver.com</option>
                 <option value="nate.com">nate.com</option>
              </select> -->
            </td>
         </tr>
         <tr>
           <th><label for="location">주소</label></th>
           <td>
             <input type="text" name="location" id="location" value="${member.location}"> - 
             <input type="text" name="location2" id="location2" value="${member.location2}">
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
