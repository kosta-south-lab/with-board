<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
 
  <title>회원가입 form</title>
 </head>
 <body>
 <form name="write_form_member" method="post">
   <table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
      <tr>
         <th> 이름</th>
         <td><input type="text" name="mbname"></td>
      </tr>
      <tr>
         <th> 닉네임</th>
         <td><input type="text" name="nickbname"></td>
      </tr>
       <tr>
         <th>아이디</th>
         <td>
         <input type="text" name="cursor:pointer">
         <a href='#' style='cursor:help'> </a>
         </td>
       </tr>
       <tr>
         <th>비밀번호</th>
         <td><input type="password" name="mbpw"> </td> <!-- 영문/숫자포함 6자 이상 -->
       </tr>
       <tr>
         <th>비밀번호 확인</th>
         <td><input type="password" name="mbpw_re"></td>
       </tr>
		    
		<tr>
     	 <th>성별</th>
		<td> 
     	<input type="radio" name="sex" value="male" checked>
     	남     
     	<input type="radio" name="sex" value="female">여
		</td>
   		 </tr>
   		 <tr>
      	<th>생년월일</th>
		<td>
  		<!--    <select name="select">
          <option>  </option>
          <option>  </option>
          <option>  </option>
     		</select> -->
          <input type="text" name="year" size="4">년
     	  <input type="text" name="month" size="2">월
     	  <input type="text" name="day" size="2">일
		</td>
   	 </tr>
        <tr>
          <th>이메일</th>
          <td>
            <input type='text' name="email">@
            <input type='text' name="email_dns">
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
             <input type="text" name="zip_h_1"> - 
             <input type="text" name="zip_h_2">
             <br>

           </td>
         </tr>
        <tr>
      <th>이미지</th>
		<td>
   		  <input type="image" name="image" value="첨부">       
		</td>
   		 </tr>
 
           <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
           <tr>
             <td colspan="2" align="center">
               <input type="submit" value="회원가입">
               <input type="reset" value="취소">
            </td>
           </tr>
           </table>
          </form>
 </body>
</html>
