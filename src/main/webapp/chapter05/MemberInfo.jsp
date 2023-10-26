<%@page import="model.MemberDTO"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세정보</title>
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
	String id = request.getParameter("id");
	MemberDAO mdao = new MemberDAO();
	MemberDTO bean = mdao.oneSelectMember(id);
	%>

	<center>
		<h1>회원정보 보기</h1>
		<table width="400" border="1">
		<tr height="40">
		<td align="center" width="150" bgcolor="powderblue">아이디</td>
		<td width="250" bgcolor="Moccasin"><%=bean.getId() %></td>
		</tr>
		<tr height="40">
		<td align="center" width="150" bgcolor="powderblue">이메일</td>
		<td width="250" bgcolor="Moccasin"><%=bean.getEmail() %></td>
		</tr>
		<tr height="40">
		<td align="center" width="150" bgcolor="powderblue">전화번호</td>
		<td width="250" bgcolor="Moccasin"><%=bean.getPhone() %></td>
		</tr>
		<tr height="40">
		<td align="center" width="150" bgcolor="powderblue">취미</td>
		<td width="250" bgcolor="Moccasin"><%=bean.getHobby() %></td>
		</tr>
		<tr height="40">
		<td align="center" width="150" bgcolor="powderblue">나이</td>
		<td width="250" bgcolor="Moccasin"><%=bean.getAge() %></td>
		</tr>
		<tr height="40">
		<td align="center" width="150" bgcolor="powderblue">기타정보</td>
		<td width="250" bgcolor="Moccasin"><%=bean.getInfo() %></td>
		</tr>
		
		<tr height="40">
		<td align="center" colspan="2" bgcolor="skyblue">
		<input type="button" value="수정" onclick="location.href='MemberUpdate.jsp?id=<%=bean.getId()%>'"/>
		<input type="button" value="삭제" onclick="location.href='MemberDelete.jsp?id=<%=bean.getId()%>'"/>
		<input type="button" value="전체목록보기" onclick="location.href='memberList.jsp'"/>
		<input type="button" value="회원가입" onclick="location.href='2_member.jsp'"/>
		</td>
		</tr>

		</table>
	</center>
</body>
</html>