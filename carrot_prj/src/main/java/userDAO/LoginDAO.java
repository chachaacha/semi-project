package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DbConnection;
import userVO.LoginVO;

/**
 * 로그인DAO
 * @author user
 *
 */
public class LoginDAO {
	private static LoginDAO lDAO;
	
	private LoginDAO() {
		
	}
	
	public static LoginDAO getInstance() {
		if(lDAO==null) {
			lDAO = new LoginDAO();
		}
		return lDAO;
	}//end cons
	
	
	
	/**
	 * 로그인하기, 맞는값 찾아서 아이디 반환 없다면 null반환
	 * @param lVO
	 * @return
	 * @throws SQLException
	 */
	public String selectLogin(LoginVO lVO) throws SQLException {
		String id=null;
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append("select id ")
			  .append("from member ")
			  .append("where id=? and password=? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, lVO.getId());
			pstmt.setString(2, lVO.getPassword());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id=rs.getString("id");
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return id;
	}
	
	public String selectChkQuit(String UserId) throws SQLException {
		String id=null;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = db.getConn();
			StringBuilder sb = new StringBuilder(" select id from member where quit = 'Y' and id=? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, UserId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return id;
	}
	
	public String selectChkBlocked(String UserId) throws SQLException {
		String blockReason=null;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = db.getConn();
			StringBuilder sb = new StringBuilder();
			sb
			.append(" select br.blocked_reason ")
			.append(" from  manager_blocked mb, blocked_reason br ")
			.append(" where (mb.br_idx = br.br_idx) and mb.id = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, UserId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				 blockReason= rs.getString("blocked_reason");
			}
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return blockReason;
	}
	
	
}
