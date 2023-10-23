<%@page import="java.util.Date"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html";  charset="UTF-8">
<title>1_HelloWorld</title>
</head>
<body>
<div align="center">
<h2>Hello World</h2>
<hr>
<%-- JSP의 자바 출력 : <%= %> --%>
현재 날짜와 시간 : <%=new Date() %>
</div>
</body>
</html>


<%-- import가 없으면 <%= new java.util.Date() %>으로 사용 가능 --%>