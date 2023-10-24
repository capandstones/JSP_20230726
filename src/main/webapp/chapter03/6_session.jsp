<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Session</title>
</head>
<body>
<div align="center">
<h2>session 예제</h2>
<%
	if(session.isNew()){
		out.println("<script> alert('인증키가 재전송 됩니다.') </script>");
		session.setAttribute("Auth", "A#S12345");
	}
%>

# <%= session.getAttribute("Auth")%> 인증 성공 !!
<hr>
1. 세션 ID : <%= session.getId() %> <br>
<% session.setMaxInactiveInterval(5); %> <%-- 세션최대유지시간 설정(초단위) --%>
2. 세션 유지시간 : <%= session.getMaxInactiveInterval() %>
</div>
</body>
</html>