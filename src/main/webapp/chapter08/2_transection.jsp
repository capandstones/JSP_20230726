<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>트랜섹션 뱅크</title>
<jsp:useBean class="jspbook.Bank1Bean" id="bb1" scope="page" />
<jsp:useBean class="jspbook.Bank2Bean" id="bb2" scope="page" />
</head>
<body>
	<%
	if (request.getMethod().equals("POST")) {
		if (bb1.transfer(Integer.parseInt(request.getParameter("bal")))) {
			out.println("<script>alert('정상 이체처리 되었습니다') </script>");
		} else {
			out.println("<script>alert('수용한도 초과입니다') </script>");
		}
	}

	bb1.getData();
	bb2.getData();
	%>
	<div align="center">
		<h3>계좌이체</h3>
		<hr />
		<table border="1" cellpadding="5" cellspacing="0">
			<tr>
				<td>Bank1</td>
				<td>이름 : <%=bb1.getAname()%></td>
				<td>잔액 : <%=bb1.getBalance()%></td>
			</tr>

			<tr>
				<td>Bank2</td>
				<td>이름 : <%=bb2.getAname()%></td>
				<td>잔액 : <%=bb2.getBalance()%></td>
			</tr>
		</table>
		<hr />
		<form method="post">
			이체금액 : <input type="text" name="bal" width="200" size="5" /> <input
				type="submit" value="이체실행" name="B1" /> <input type="reset"
				value="다시입력" name="B2" />
		</form>

	</div>
</body>
</html>