package boardModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public void getCon() {

		try {

			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/orcl");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// ====================================================
	//#1 전체 게시글 갯수
	public int getallCount() {
	      
	      getCon();
	      int count=0;
	      try {
	         //쿼리
	         String sql="select count(*) from board";
	         pstmt=con.prepareStatement(sql);
	         //쿼리 결과 받기
	         rs=pstmt.executeQuery();
	         
	         if(rs.next()) {
	            count=rs.getInt(1);
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }      
	      return count;
	   }
	
	//#2. 전체 게시글 가져오기
	public Vector<BoardDTO> getAllBoard(int startRow,int endRow){
		getCon();
		Vector<BoardDTO> v = new Vector<BoardDTO>();
		try {
	         //Rownum : 오라클에만 존재하는 컬럼으로 최상위 30%이내의 값을 추출함 
	         String sql="SELECT * FROM (SELECT A.* ,Rownum Rnum FROM (SELECT * FROM board ORDER BY ref desc, re_step asc) A) WHERE Rnum >= ? and Rnum <= ?";
	         
	         pstmt=con.prepareStatement(sql);
	         pstmt.setInt(1,startRow);
	         pstmt.setInt(2,endRow);
	         rs=pstmt.executeQuery();
	         
	         while(rs.next()) {
	            //오라클에서 데이터를 가져와서 DTO에 저장
	            BoardDTO bean=new BoardDTO();
	            bean.setNum(rs.getInt(1));
	            bean.setWriter(rs.getString(2));
	            bean.setEmail(rs.getString(3));
	            bean.setSubject(rs.getString(4));
	            bean.setPassword(rs.getString(5));
	            bean.setReg_date(rs.getDate(6).toString());
	            bean.setRef(rs.getInt(7));
	            bean.setRe_step(rs.getInt(8));
	            bean.setRe_level(rs.getInt(9));
	            bean.setReadcount(rs.getInt(10));
	            bean.setContent(rs.getString(11));
	            //저장된 객체를 벡터배열방에 담기
	            v.add(bean);
	         }
	         con.close();   
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
		return v;
	}
	
	
}