<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberDeleteProc</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="mdto" class="model.MemberDTO" />
	<jsp:setProperty property="*" name="mdto" />
	<%
	MemberDAO mdao = new MemberDAO();
	String id = mdto.getId();
	mdao.deleteMember(id);
    	
	response.sendRedirect("memberList.jsp");
	%>
</body>
</html>