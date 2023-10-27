<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstl Test</title>
</head>
<body>
<c:if test="${4>3}">
안녕하세요 <br>
</c:if>
------------------------------------------------------- <p>
<!-- 변수선언 -->
<c:set var="i" value="4"> <%--   <%request.setAttribute("i", 4); %>  와 같음--%>
</c:set>

<c:if test="${i>3 }">
안녕하세요 <br>
</c:if>

--------------------------------------------- <p>

<!-- 반복문 -->
<c:forEach begin="1" end="10">
7교시 입니다 <br>
</c:forEach>

--------------------------------------------- <p>

<!-- 반복문(1~10) var 활용 -->
<c:forEach var="i" begin="1" end="10">
<c:set var="sum" value="${sum = sum+i }"/>
</c:forEach>
sum : ${sum } <br>

--------------------------------------------- <p>

<!-- 반복문(1~10) step활용 -->
<c:forEach var="j" begin="1" end="10" step="${j=j+2 }">
<c:set var="sum2" value="${sum2 = sum2+j }"/>
</c:forEach>
sum : ${sum2 }

</body>
</html>