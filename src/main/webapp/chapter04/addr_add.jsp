<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록 목록</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="addr" class="jspbook.AddrBean" />
	<jsp:setProperty property="*" name="addr" />
	<jsp:useBean id="am" class="jspbook.AddrManager" scope="application" />
	<%
	am.add(addr); //주소록에 등록
	%>
	
	<center>
	<h2>등록 내용</h2>
	이름 : <jsp:getProperty property="username" name="addr"/> <br>
	전화번호 : <jsp:getProperty property="tel" name="addr"/> <br>
	이메일 : <jsp:getProperty property="email" name="addr"/> <br>
	성별 : <jsp:getProperty property="gender" name="addr"/> <br>
	<hr/>
	<a href="addr_list.jsp">목록보기</a>
	</center>
</body>
</html>