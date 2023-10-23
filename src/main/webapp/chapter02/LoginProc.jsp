<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoginProc</title>
</head>
<body>
<%
//한글깨짐 방지
request.setCharacterEncoding("UTF-8");

String id=request.getParameter("id");                             
String pass=request.getParameter("pass");

%>

환영합니다. id=<%=id %>이고 패스워드는  <%=pass %>입니다.
</body>
</html>