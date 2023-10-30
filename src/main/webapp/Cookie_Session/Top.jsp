<%@page import="org.eclipse.jdt.internal.compiler.IDebugRequestor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<%


//세션을 통해서 id를 읽어드림
String id = (String)session.getAttribute("id");
//로그인이 안된 상태면 session에 null처리를 해주고 id변수에 Guest를 저장
if(id==null)id="Guest";


//로그아웃 클릭시 파라미터를 통해서 로그아웃 여부 판단
String logout=request.getParameter("logout");

if(logout !=null){//로그인 된 상태(1)
	//id에 null 값을 부여하여 로그아웃 수행
	session.setAttribute("id", null);
	session.setMaxInactiveInterval(0);
}



%>
<table width="1200">
<tr height="100">
<td colspan="2" align="center" width="220">
<img src="./img/logo.jpg" width="200" height="70">
</td> 
<td align="center" colspan="4" ><font size="10" color="orange">My Own Spring Camp</font></td>
</tr>
<tr height="50">
<td width="130" align="center"> <a href="IncludeTest.jsp?camping=1" style="text-decoration: none;">Tent</a> </td>
<td width="130" align="center"> <a href="IncludeTest.jsp?camping=2" style="text-decoration: none;">Chair</a> </td>
<td width="130" align="center"> <a href="IncludeTest.jsp?camping=3" style="text-decoration: none;">Dishware</a> </td>
<td width="130" align="center"> <a href="IncludeTest.jsp?camping=4" style="text-decoration: none;">Slepping Bag</a> </td>
<td width="130" align="center"> <a href="IncludeTest.jsp?camping=5" style="text-decoration: none;">Lantern</a> </td>
<td width="130" align="center"> <a href="IncludeTest.jsp?camping=6" style="text-decoration: none;">Table</a> </td>
<td width="170" align="center">
<%
if(id.equals("Guest")){
	%>
	<%=id %>님 <button onclick="location.href='IncludeTest.jsp?camping=7'">로그인</button>
	<%
    }else{
    %>
    <%=id %>님 <button onclick="location.href='IncludeTest.jsp?logout=1'">로그아웃</button>
	<%
}
%>
</td>
</tr>
</table>
</center>
</body>
</html>