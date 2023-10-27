<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Redirect</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
%>
<body bgcolor="#FFFFcc">
<h3>&lt;c:redirect&gt;</h3>
<c:url value="6_choose.jsp" var="target">
	<c:param name="sel1">밀크티</c:param> <!-- 식별자?  -->
	<c:param name="sel2">아메리카노</c:param> <!-- 식별자&  -->
</c:url>
<hr/>

단순 출력 : ${target } <br>
링크 출력 : <a href="${target}">상품목록</a> <br>
</body>
</html>