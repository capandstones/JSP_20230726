<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body bgcolor="#f5f5dc">
<div align=center>
<H2>login.jsp : 로그인</H2>
<HR>

<form method="post" action="Login_Proc.jsp" name="form1">
  <table width="250" border="1" align="center" cellspacing="0" cellpadding="5">
 
    <tr> 
    <td colspan="2" align="center">로그인</td>
  </tr>
  <tr> 
      <td>아이디</td>
      <td><input type="text" name="userid" size=10 placeholder="id"></td>
  </tr>
  <tr> 
      <td>비밀번호</td>
      <td><input type="password" name="passwd" size=10 placeholder="password"></td>
  </tr>
  <tr> 
    <td colspan="2" align="center"> 
        <input type="submit" name="Submit" value="로그인"></td>
  </tr>
</table>
</form>
</div>

</body>
</html>