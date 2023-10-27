<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DBCP</title>
</head>
<body>
<sql:query var="rs" dataSource="jdbc/orcl">
select username, email from jdbc_test
</sql:query>

<h2>결과 출력</h2>
<hr/>

<c:forEach var="row" items="${rs.rows }">
이름 : ${row.username } <br>
이메일 : ${row.email } 
<hr/>
</c:forEach>

</body>
</html>