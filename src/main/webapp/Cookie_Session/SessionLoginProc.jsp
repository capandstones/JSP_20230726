<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

//내장객체를 사용할 경우
String id = request.getParameter("id");
String pass = request.getParameter("pass");

//-------------------------------------
//내장객체인 session을 잉용해서 ㅇ아이디 처리
session.setAttribute("id",id);
session.setAttribute("pass",pass);

session.setMaxInactiveInterval(60);//1분을 의미

response.sendRedirect("IncludeTest.jsp");
%>
	<center>
		<h1>세션 로그인 처리 2</h1>
		넘어온 페이지....<br>
		<hr>
		<h2>
			<%=id%>님 방갑습니다.
		</h2>

	</center>
</body>
</html>