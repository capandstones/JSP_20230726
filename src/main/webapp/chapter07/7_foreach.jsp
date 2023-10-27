<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Foreach</title>
</head>
<body bgcolor="#FFFFFF">
<h3>&lt;c:choose&gt;</h3>
<c:forEach var="i" items="${members }" begin="0" varStatus="status" end="5">
index : ${status.index } <br>
count : ${status.count } <br>
name : ${i.name} <br>
email : ${i.email} <br>
<hr/>
</c:forEach>
<p/>
<c:forTokens var="sel" items="이상주, 010-1234-5678, 서울" delims=",">
${sel} <br>
</c:forTokens>
<hr/>
<!-- Formatting 태그  -->
<fmt:formatNumber value="3.141592" pattern="#.00" />
</body>
</html>