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
	// #1 전체 게시글 갯수
	public int getallCount() {

		getCon();
		int count = 0;
		try {
			// 쿼리
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			// 쿼리 결과 받기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// #2. 전체 게시글 가져오기
	public Vector<BoardDTO> getAllBoard(int startRow, int endRow) {
		getCon();
		Vector<BoardDTO> v = new Vector<BoardDTO>();
		try {
			// Rownum : 오라클에만 존재하는 컬럼으로 최상위 30%이내의 값을 추출함
			String sql = "SELECT * FROM (SELECT A.* ,Rownum Rnum FROM (SELECT * FROM board ORDER BY ref desc, re_step asc) A) WHERE Rnum >= ? and Rnum <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 오라클에서 데이터를 가져와서 DTO에 저장
				BoardDTO bean = new BoardDTO();
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
				// 저장된 객체를 벡터배열방에 담기
				v.add(bean);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	// =======================================================================
	public void insertBoard(BoardDTO bean) {
		getCon();
		// bean객체가 가지고 오지 못하는값을 구현
		int ref = 0;
		int re_step = 1;// 새글이기에
		int re_level = 1;// 새글이기에

		try {
			String refsql = "select max(ref) from board";
			pstmt = con.prepareStatement(refsql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				ref = rs.getInt(1) + 1;

			}

			// ------------------------------------------------------------

			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";

			pstmt = con.prepareStatement(sql);
			// ?
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());

			// 저장
			pstmt.executeUpdate();
			// 반납
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// -----------------------------------------------------------------------------------------------------

	// 하나의 게시글을 읽어들이는 메소드 구현
	public BoardDTO getOneBoard(int num) {

		getCon();
		BoardDTO bean = null;

		try {
			// 하나의 게시글을 읽었다는 조회수 증가
			String countsql = "update board set readcount=readcount+1 WHERE num=?";
			pstmt = con.prepareStatement(countsql);

			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			// 하나의 게시글 리턴(상세정보)
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				bean = new BoardDTO();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getString(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// -----------------------------------------------------------------------------
	public void reInsertBoard(BoardDTO bean) {

		getCon();

		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();

		try {

			String levelsql = "update board set re_level=re_level+1 where ref=? and re_level > ?";
			pstmt = con.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			pstmt.executeUpdate();

			pstmt.executeUpdate();

			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step + 1);
			pstmt.setInt(7, re_level + 1);
			pstmt.setString(8, bean.getContent());

			pstmt.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// -------------------------------------------------------------------
	// 조회수가 증가하지 않는 업데이트
	public BoardDTO getOneUpdateBoard(int num) {

		getCon();
		// 초기값이니까 null
		BoardDTO bean = null;
		try {

			//하나의 게시글 리턴
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new BoardDTO();
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

			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// -----------------------------------------------------------------
	// 수정

	public void updateBoard(int num, String subject, String content) {

		getCon();
		try {
			String sql = "update board set subject=?,content=? where num=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);

			pstmt.executeUpdate();

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 삭제
	public void deleteBoard(int num) {

		getCon();

		try {
			String sql = "delete from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}