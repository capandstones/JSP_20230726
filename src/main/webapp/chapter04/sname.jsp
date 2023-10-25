<%@page import="jspbook.AddrBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SerchName</title>
<jsp:useBean id="am" class="jspbook.AddrManager" scope="application" />
<%
request.setCharacterEncoding("UTF-8");
AddrBean addr = am.getAdd(request.getParameter("sname"));
%>
</head>
<body>
	<div align="center">
		<h2>상세등록내용</h2>
		이름 : <%=addr.getUsername()%> <p>
		전화번호 : <%=addr.getTel()%> <p>
		이메일 : <%=addr.getEmail()%> <p>
		성별 : <%=addr.getGender()%> <p>
		<hr />
		<a href="addr_list.jsp">전체 목록 보기</a>
	</div>
</body>
</html>