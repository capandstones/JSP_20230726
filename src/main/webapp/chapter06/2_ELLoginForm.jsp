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
	<center>
		<h2>로그인</h2>
		<form action="ElLoginProc.jsp" method="post">
			<table width="300" border="1">
				<tr height="40">
					<td width="120">아이디</td>
					<td width="180"><input type="text" name="id" style="border: none; outline: none;">
					</td>
				</tr>
				<tr height="40">
					<td width="120">패스워드</td>
					<td width="180"><input type="password" name="password" style="border: none; outline: none;">
					</td>
				</tr>
				<tr height="40">
					<td align="center" colspan="2"><input type="submit" value="로그인" style="border: none; outline: none;">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>