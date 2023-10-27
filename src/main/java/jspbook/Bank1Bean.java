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
public class Bank1Bean {

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

	// bank1테이블 데이터 가져오는 메서드
	public void getData() {
		connect();
		try {

			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from bank1");
			rs.next();
			aid = rs.getInt("aid");
			aname = rs.getString("aname");
			balance = rs.getInt("balance");

		} catch (Exception e) {
			System.out.println(aid + aname + balance);
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}// getData

	public boolean transfer(int bal) {

		connect();
		try {
			// 출금
			// auto commit 모드 true일때 : update 또는 delete를 수행시 즉시 완료
			conn.setAutoCommit(false);// AutoCommit 해제 => commit과 Rollback를 자유롭게 사용하기 위함
			pstmt = conn.prepareStatement("update bank1 set balance=balance-? where aid=101");
			pstmt.setInt(1, bal);
			pstmt.executeUpdate();

			// 입금
			pstmt = conn.prepareStatement("update bank2 set balance=balance+? where aid=201");
			pstmt.setInt(1, bal);
			pstmt.executeUpdate();
			
			//입금확인
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select balance from bank2 where aid=201");
			
			rs.next();
			
			if(rs.getInt(1)>70) {
				conn.rollback();
				return false;
			}else {
				conn.commit();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return true;
	}

}
