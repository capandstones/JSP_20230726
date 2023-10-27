<%@ page contentType="text/html;charset=utf-8" import="javax.sql.*,java.sql.*, javax.naming.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   // 데이터베이스 연결관련 변수 선언
   Connection conn = null;
   PreparedStatement pstmt = null;
   
   try{
        //서버환경설정 클래스 진입
        Context initContext = new InitialContext();
        //환경설정 객체생성
        Context envContext = (Context)initContext.lookup("java:/comp/env");
        //DBCP의 환경설정 정보 읽어옴
        DataSource ds = (DataSource)envContext.lookup("jdbc/orcl");
        
        // 커넥션 얻기
         conn = ds.getConnection();

      // username 값을 입력한 경우 sql 문장을 수행.
      if(request.getParameter("username") != null) {
         // Connection 클래스의 인스턴스로 부터 SQL  문 작성을 위한 Statement 준비
         String sql = "insert into jdbc_test values(?,?)";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,request.getParameter("username"));
         pstmt.setString(2,request.getParameter("email"));
         pstmt.executeUpdate();
      }
   }
   catch(Exception e) {
      e.printStackTrace();
   }
%>
<HTML>
<HEAD><TITLE>ch12 : JDBC 테스트 </TITLE></HEAD>
<BODY>
<center>
<H2>dbcptest.jsp</H2>
<HR>

<form method=post action=1_dbcptest.jsp>
등록이름 : <input type=text name=username>
email주소 : <input type=text name=email size=20>
<input type=submit value="등록">
</form>
<HR>
<a href="dbcp_orcl.jsp">목록보기</a>
</center>
</BODY>
</HTML>