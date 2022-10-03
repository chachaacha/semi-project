package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DbConnection;
import userVO.FindIdVO;

public class FindIdDAO {
	private static FindIdDAO fDAO;
	
	private FindIdDAO() {
		
	}
	
	public static FindIdDAO getInstance() {
		if(fDAO==null) {
			fDAO= new FindIdDAO();
		}
		return fDAO;
	}
	
	public String selectFindId(FindIdVO fVO) throws SQLException {
		String id=null;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append("select id from member where name=? and birth=? and phone_num=?");
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, fVO.getName());
			pstmt.setString(2, fVO.getBirth());
			pstmt.setString(3, fVO.getPhone_num());
			rs= pstmt.executeQuery();
			if(rs.next()) {
				id=rs.getString("id");
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return id;
	}
}
