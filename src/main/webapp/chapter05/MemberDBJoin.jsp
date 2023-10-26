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
<jsp:useBean id="mdao" class="model.MemberDAO"/>

<%
request.setCharacterEncoding("UTF-8");
String[] hobby = request.getParameterValues("hobby");

String texthobby="";

for(int i=0;i<hobby.length;i++){
	texthobby+=hobby[i]+" ";
}

// MemberDAO mdao = new MemberDAO();
mdto.setHobby(texthobby);
mdao.insetMember(mdto);

//  회원 가입 정보를 보여주는 페이지로 이동
response.sendRedirect("memberList.jsp");

%>





</head>
<body>

</body>
</html>