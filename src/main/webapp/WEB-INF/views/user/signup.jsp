<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<HTML>
      <HEAD>
            <TITLE>form 사용예제</TITLE>
      </HEAD>
      <BODY bgcolor="#FFFFFF" text="#000000">

  
<h2>회원가입 양식</h2><br>

<form method="post" action="form.php">
  <input type="hidden" name="subject" value="회원가입양식">
<table width="500" border="0" cellspacing="0">
    <tr>
      <td>아이디</td>
<td> 
     <input type="text" name="id" size="15" maxlength="20">
     영문,한글 ? 자리 이내.. (*중복체크)
</td>
    </tr>
    
<tr>
      <td>패스워드</td>
<td> 
     <input type="password" name="pw" size="20" maxlength="20">
     영문 ? ~ ? 자리미만 (*중복체크)
</td>
    </tr>
    
<tr>
      <td>이름</td>
<td> 
     <input type="text" name="Name" size="10">
</td>
    </tr>
    
<tr>
      <td>닉네임</td>
<td> 
     <input type="text" name="NickName" size="10">
     (*중복체크)
</td>
    </tr>    
    
<tr>
      <td>지역</td>
<td>
     <select name="select">
     	  <option>시/도</option>
          <option>서울특별시</option>
          <option>경기도</option>
          <option>경상북도</option>
     </select>
         <select name="select">
          <option>선택</option>
          <option>강남구</option>
     </select> 
   
</td>
    </tr>    
    
<tr>
      <td>성별</td>
<td> 
     <input type="radio" name="sex" value="male" checked>
     남     
     <input type="radio" name="sex" value="female">여
</td>
    </tr>
<tr>
      <td>생년월일</td>
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
      <td>이미지</td>
<td>
     <input type="image" name="image" value="첨부">       
</td>
    </tr>

<tr>
      <td>이메일</td>
<td> 
     <input type="email" name="email" size="10">@
     <select name="select">
     	  <option>직접선택</option>
          <option>naver.com</option>
          <option>hanmail.net</option>
          <option>gmail.com</option>
     </select> <p><p>
</td>

    </tr>
           
<tr align="center">
      <td colspan="2">
     <input type="submit" name="Submit" value="회원가입"> 
        
     <input type="reset" name="Cancel" value="취소하기">
</td>
    </tr>
  </table>
</form>
      </BODY>
</HTML>