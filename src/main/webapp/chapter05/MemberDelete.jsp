<%@page import="model.MemberDTO"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/* 테이블에 대한 스타일 */
table {
	border-collapse: collapse; /* 테두리선을 한 줄로 합치기 */
}

/* 테이블의 각 셀에 대한 스타일 */
table td, table th {
	border: 1px solid black; /* 검은색 1px 두께의 테두리 적용 */
}
</style>
</head>
<body>
<%
//방법1
String id = request.getParameter("id");
MemberDAO mdao = new MemberDAO();
MemberDTO mdto = mdao.oneSelectMember(id);


//방법2
// String email = request.getParameter("email");
// String phone = request.getParameter("phone");

%>

<center>
<h1> 회원 정보 삭제하기 </h1>
<form action="MemberDeleteProc.jsp" method="post">
<table  width="400" border="1">
<tr height="40">
<td align="center" width="150">아이디</td>
<td width="250"><%=mdto.getId() %></td>
</tr>

<tr height="40">
<td align="center" width="150">이메일</td>
<td width="250"><%=mdto.getEmail() %></td>
</tr>

<tr height="40" >
<td align="center" width="150">전화번호</td>
<td width="250"><%=mdto.getPhone() %></td>
</tr>

<tr height="40" >
<td align="center" width="150">패스워드</td>
<td width="250"><%=mdto.getPass1() %></td>
</tr>

<tr height="40" >
<td align="center" colspan="2">
<input type="hidden" name="id"  value="<%=id %>">
<input type="submit" value="삭제" >
</td>
</tr>
</table>
</form>
</center>
</body>
</html>