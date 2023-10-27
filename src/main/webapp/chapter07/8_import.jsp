<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Import</title>
</head>
<body bgcolor="#FFFFcc">
<h3>&lt;c:import&gt;</h3>
<!-- import를 이용하여 포함한 결과 -->
<hr/>
<c:import url="2_set.jsp" var="myurl"/>
<c:out value="${myurl }" escapeXml="false"/>
<hr/>
<p/>
<center>
<h3>import:www.daum.net</h3>
<c:import url="https://soldesk.com" var="myurl2"/>
<c:out value="${myurl2 }" escapeXml="false"></c:out>
</center>
</body>
</html>