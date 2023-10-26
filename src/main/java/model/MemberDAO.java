package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberDAO {

	// 오라클 접속 소스
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pass = "12345";

	Connection con;// 접근 설정
	PreparedStatement pstmt; // 쿼리로 형변환
	ResultSet rs;// 결과값 리턴

	// ----------------------------------------------------------------------
	public void getCon() {
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, pass);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}// getCon()

	// #1.데이터베이스에 한사람의 회원 정보를 저장해주는 메소드
	public void insetMember(MemberDTO mDTO) {

		try {
			getCon();
			String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);

			// ?매핑
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

	}// 1

	// ================================================================================
	// #2 모든 사용자들을 검색하는 메서드

	public Vector<MemberDTO> allSelectMember() {

		// Vector 객체(박스) 생성
		Vector<MemberDTO> v = new Vector<MemberDTO>();

		try {
			getCon();
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO bean = new MemberDTO();
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setPass2(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setGender(rs.getString(5));
				bean.setAddress(rs.getString(6));
				bean.setPhone(rs.getString(7));
				bean.setHobby(rs.getString(8));
				bean.setJob(rs.getString(9));
				bean.setAge(rs.getString(10));
				bean.setInfo(rs.getString(11));

				v.add(bean);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;

	}// all select

	// ==============================================================================================
	// #3 한 사람에 대한 상세정보

	public MemberDTO oneSelectMember(String id) {

		MemberDTO bean = new MemberDTO();

		try {
			getCon();
			String sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setPass2(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setGender(rs.getString(5));
				bean.setAddress(rs.getString(6));
				bean.setPhone(rs.getString(7));
				bean.setHobby(rs.getString(8));
				bean.setJob(rs.getString(9));
				bean.setAge(rs.getString(10));
				bean.setInfo(rs.getString(11));
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;

	}// oneselect
		// =================================================================================
		// 4. 비밀번호 일치 여부 체크

	public String getPass(String id) {

		String pass = "";

		try {
			getCon();
			String sql = "select pass1 from member where id = ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			// 비번체크
			if (rs.next()) {
				pass = rs.getString(1);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pass;
	}

	// ==============================================================================

	// #5. 회원 정보 수정

	public void updateMember(MemberDTO bean) {

		try {
			getCon();

			String sql = "update member set email=?,phone=? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getPhone());
			pstmt.setString(3, bean.getId());

			pstmt.executeUpdate();

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}// update
		// ==========================================================================
		// 6.한사람에 대한 정보 삭제

	public void deleteMember(String id) {

		try {
			getCon();

			String sql = "delete from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
