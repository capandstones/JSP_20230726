<%@page import="jspbook.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login_Proc</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="lbean" class="jspbook.LoginBean" scope="page">
<jsp:setProperty name="lbean" property="*" />
</jsp:useBean>
<center>
<h2>로그인</h2>
<hr/>
<%
if(!lbean.checkUser()){
	out.println("로그인 실패");
} else out.println("로그인 성공");
%>
<hr/>

<h2>당신의 아이디는 <jsp:getProperty property="userid" name="lbean"/> </h2>
<h2>당신의 패스워드는 <jsp:getProperty property="passwd" name="lbean"/> </h2>

</center>
</body>
</html>