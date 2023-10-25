<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberDBJoin.jsp</title>
<jsp:useBean id="mdto" class="model.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>

<%
request.setCharacterEncoding("UTF-8");
String[] hobby = request.getParameterValues("hobby");

String texthobby="";

for(int i=0;i<hobby.length;i++){
	texthobby+=hobby[i]+" ";
}

MemberDAO mdao = new MemberDAO();
mdao.insetMember(mdto);
%>
입력 성공~!
</head>
<body>

</body>
</html>