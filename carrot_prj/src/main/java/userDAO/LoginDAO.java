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
	
	public LoginDAO getInstance() {
		if(lDAO==null) {
			lDAO = new LoginDAO();
		}
		return lDAO;
	}//end cons
	
	
	
	/**
	 * 로그인하기, 맞는값 찾아서 아이디 반환 없다면 ""반환
	 * @param lVO
	 * @return
	 * @throws SQLException
	 */
	public String selectLogin(LoginVO lVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id="";
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append("select id ")
			  .append("from member ")
			  .append("where id=?, password=?");
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
	
	
}
