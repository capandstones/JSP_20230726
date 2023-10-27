<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>out</title>
</head>
<body bgcolor="#ffffff">
	<center>
		<h3>&lt;c:set&gt;</h3>
<!-- 		set의 기본 문법  -->
		<c:set value="Hello World" var="msg" />
		msg : ${msg } <br> 
		msg : <%=pageContext.getAttribute("msg")%> <br>
		<hr/>
		<p />
		Member name : ${member.name } <br>
		Member email : ${member.email } <br>
		<hr/>
		<p/>
<!-- 		set의 화용 문법  -->
		<c:set target="${member }" property="name" value="이선균"/>
		<c:set target="${member }" property="email" value="change@test.com"/>
		Member Changed name : ${member.name } <br>
		Member Changed email : ${member.email } <br>
	</center>
</body>
</html>





<!-- escapeXml 속성을 "flase"로 주면 html이 escape되지 않고 그대로 출력 -->