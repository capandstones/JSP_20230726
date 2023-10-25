package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

public class MemberDAO {

	// 오라클 접속 소스
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pass = "12345";

	Connection con;//접근 설정
	PreparedStatement pstmt; //쿼리로 형변환
	ResultSet rs;//결과값 리턴
	
	//----------------------------------------------------------------------
	public void getCon() {
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(url, user,pass);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//getCon()
	
	//#1.데이터베이스에 한사람의 회원 정보를 저장해주는 메소드
	public void insetMember(MemberDTO mDTO) {
		
		try {
			getCon();
			String sql="insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			//?매핑
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPass1());
			pstmt.setString(3, mDTO.getPass2());
			pstmt.setString(4, mDTO.getEmail());
			pstmt.setString(5, mDTO.getGender());
			pstmt.setString(6, mDTO.getAddress());
			pstmt.setString(7, mDTO.getPhone());
			pstmt.setString(8, mDTO.getHobby());
			pstmt.setString(9, mDTO.getJob());
			pstmt.setString(10, mDTO.getAge());
			pstmt.setString(11, mDTO.getInfo());
			
			pstmt.executeUpdate();
			
			con.close();
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
