package jspbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Bank2Bean {

	private int aid;
	private String aname;
	private int balance;

	// 데이터베이스 관련 객체 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;

	// JNDI
	public void connect() {

		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/orcl");
			conn = ds.getConnection();
		}

		catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}

	}// connect()

	// connection 연결종료
	public void disconnect() {
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		System.out.println("close");
	}// disconnect()

	// bank2 테이블 데이터 가져오는 메서드
	public void getData() {
		connect();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from bank2");
			rs.next();
			aid = rs.getInt("aid");
			aname = rs.getString("aname");
			balance = rs.getInt("balance");
		} catch (Exception e) {
			System.out.println(aid + aname + balance);
			System.out.println(e);
		} finally {
			disconnect();
		}
	}

}
