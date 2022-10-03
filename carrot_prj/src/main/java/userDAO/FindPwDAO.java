package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DbConnection;
import userVO.FindPwVO;

public class FindPwDAO {
	private static FindPwDAO fDAO;
	
	private FindPwDAO() {
	}
	
	public static FindPwDAO getInstance() {
		if(fDAO==null) {
			fDAO = new FindPwDAO();
		}
		return fDAO;
	}
	
	/**
	 * 리턴값이 null이 아니면 update를 시키는 쿼리를 작동한다.
	 * @param fVO
	 * @return
	 * @throws SQLException
	 */
	public String selectFindPw(FindPwVO fVO) throws SQLException {
		String id = null;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append("select id from member where name=? and id=? and phone_num=?");
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, fVO.getName());
			pstmt.setString(2, fVO.getId());
			pstmt.setString(3, fVO.getPhone_num());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				id=rs.getString("id");
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return id;
	}
	
	/**
	 * id가 null 아닐 시 임시비번으로 바꿔주는 쿼리
	 * @param fVO
	 * @return
	 * @throws SQLException
	 */
	public int updateTempPw(FindPwVO fVO) throws SQLException {
		int rowCnt;
		DbConnection db = DbConnection.getInstance();
		Connection con =null;
		PreparedStatement pstmt = null;
		try {
			con=db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append("update member set password=? where id=? and name=?");
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, fVO.getTemp());
			pstmt.setString(2, fVO.getId());
			pstmt.setString(3, fVO.getName());
			
			rowCnt = pstmt.executeUpdate();
		} finally {
			db.dbClose(null, pstmt, con);
		}
		return rowCnt;
	}
	
	/**
	 * 바뀐비번을 보여준다.
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public String selectView(String id) throws SQLException {
		String password=null;
		DbConnection db = DbConnection.getInstance();
		Connection con  =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try { 
			con= db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append("select password from member where id=?");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				password=rs.getString("password");
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return password;
	}
	
	
	
	
}
