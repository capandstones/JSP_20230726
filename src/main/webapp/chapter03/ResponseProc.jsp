<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ResponseProc</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<%
	//고정으로 id값을 부여
	String dbid = "jmpark";
	String dbpass = "12345";
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	if (id.equals(dbid) && pass.equals(dbpass)) {
		session.setAttribute("id", id);//session 영역에 저장
		response.sendRedirect("ResponseLogin.jsp");
		//GET방식
		//response.sendRedirect("ResponseLogin.jsp?id=id&pass=pass");
	}else{
		%>
		<script type="text/javascript">
		alert("아이디가 틀립니다.")
		history.go(-1);
		</script>
		<%
		//response.sendRedirect("ResponseLogin.jsp");
	}
	%>
	
	나 이거 나올것 같아?
</body>
</html>