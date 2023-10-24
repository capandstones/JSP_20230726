<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>4.Include 지시어</title>
</head>
<body>
	<div align="center">
		<h2>Include 지시어</h2>
		<hr />
		<%@ include file="menu.jsp"%>
		<p />
		<table border="0" cellpadding="5" cellspacing="1">
			<tr>
				<td><font size="-1"><%@include file="news.jsp"%></font>
				</td>
				<td width="20">&nbsp;</td>
				<td><font size="-1"> <%@include file="shopping.jsp"%>
				</font></td>
			</tr>
		</table>
	</div>
</body>
</html>