<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Apllication 영역</title>
</head>
<body>
<div align="center">
<h2>Application 영역</h2>
<hr/>
1.서버정보 :<%= application.getServerInfo() %> <br>
2.서블릿 API 버전 정보 : <%= application.getMajorVersion() %> <br>
3.application.jsp 파일의 실제경로 : <%= application.getRealPath("8_application.jsp") %>
<hr/>

<%
application.setAttribute("username", "박정민");
application.log("username=박정민");
application.setAttribute("count", 0);//count 변수에 초기화
%>

<a href="application_result.jsp">확인하기</a>
</div>
</body>
</html>