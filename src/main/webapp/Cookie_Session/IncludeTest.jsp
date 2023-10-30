<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IncludeTest</title>
<style>
/* 테이블에 대한 스타일 */
table {
	border-collapse: collapse; /* 테두리선을 한 줄로 합치기 */
}

</style>
</head>
<body>
	<%
	String campurl = "";
	String camping = request.getParameter("camping");

	if (camping == null) {
		campurl = "Choan_camping.jsp";
	} else {

		if (camping.equals("1"))
			campurl = "Choan_camping.jsp";
		else if (camping.equals("2"))
			campurl = "CampingInTheCity.jsp";
		else if (camping.equals("3"))
			campurl = "Choan_camping.jsp";
		else if (camping.equals("4"))
			campurl = "CampingInTheCity.jsp";
		else if (camping.equals("5"))
			campurl = "Choan_camping.jsp";
		else if (camping.equals("6"))
			campurl = "CampingInTheCity.jsp";
		else if (camping.equals("7"))
			campurl = "SessionLoginForm.jsp";
	}
	%>
	<center>
		<table width="1200" border="0">
			<!-- Top 부분 -->
			<tr height="100">
				<td colspan="2" align="center"><jsp:include page="Top.jsp"></jsp:include>
				</td>
			</tr>
			<!-- ------------------------------------------------------------------------------------- -->
			<tr height="500">
				<!-- Left 부분 -->
				<td width="250" align="center"><jsp:include page="Left.jsp" />
				</td>
				<!-- Center 부분  -->
				<td width="900" align="center"><jsp:include page="<%=campurl%>"></jsp:include>
				</td>
			</tr>
			<!-- ------------------------------------------------------------------------------------- -->
			<!-- Bottom 부분 -->
			<tr height="100">
				<td align="center" colspan="2"><jsp:include page="Bottom.jsp" />
				</td>
			</tr>
		</table>
	</center>
</body>
</html>