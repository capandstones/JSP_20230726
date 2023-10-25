<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("UTF-8");
%>
<%
Connection conn = null;
PreparedStatement pstmt = null; //String -> SQL

//데이터베이스 연결정보
String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";

try {
	//JDBC 드라입 로드
	Class.forName(jdbc_driver);

	//데이터베이스 정보 연결
	conn = DriverManager.getConnection(jdbc_url, "system", "12345");

	//sql 작성
	String sql = "insert into jdbc_test values(?,?)";
	pstmt = conn.prepareStatement(sql); //String => SQL 형변환
	pstmt.setString(1, request.getParameter("username"));
	pstmt.setString(2, request.getParameter("email"));

	if (request.getParameter("username") != null) {
		pstmt.executeUpdate();

	}

} catch (Exception e) {
	e.printStackTrace();
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JDBC 테스트</title>
</head>
<body>
	<div align="center">
		<h2>이벤트 등록</h2>
		<hr>
		<form action="jdbctest.jsp" method="post" name="form1">
			등록이름 : <input type="text" name="username"> <br> 메일주소 : <input
				type="text" name="email" size="20"> <br> <br> <input
				type="submit" value="등록">
		</form>
	</div>
	# 등록확인
	<p>
		<%
		try {
			String sql = "select username, email from jdbc_test";
			pstmt = conn.prepareStatement(sql);

			//select를 수행해서 가져온 데이터정보는 ResultSet 클래스의 인스턴스 변수(객체)에 받는다
			ResultSet rs = pstmt.executeQuery();
			
			int i = 1;
			
			//마지막까지 데이터 반복
			while(rs.next()){
				out.println(i+" : "+rs.getString(1)+", "+rs.getString("email")+"<br />");
				i++;
			}
			
			//자원반납
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		%>
	
</body>
</html>









