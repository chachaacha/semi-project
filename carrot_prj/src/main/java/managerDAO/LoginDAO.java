package managerDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DbConnection;
import managerVO.LoginVO;

public class LoginDAO {
	private static LoginDAO lDAO;
	
	private LoginDAO() {

	}
	
	public static LoginDAO getInstance() {
		if(lDAO==null) {
			lDAO=new LoginDAO();
		}//end if
		
		return lDAO;
	}//getInstance
	
	//로그인
	public String selectLogin(String password) throws SQLException {
		String id=null;

		DbConnection dc =DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=dc.getConn();
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select id	")
			.append("	from manager	")
			.append("	where password=?	");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, password);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("id");
			}
		}finally {
			dc.dbClose(rs, pstmt, con);
		}	
		return id;
	}//selectLogin
	
	//비밀번호 변경
	public int updatePW(LoginVO lVO) throws SQLException {
		int updateCnt=0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			con=dc.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("update manager")
			.append("set password=?")
			.append("where password=?");
			
			pstmt=con.prepareStatement(sb.toString());
			
			pstmt.setString(1, lVO.getNewPw());
			pstmt.setString(2, lVO.getPassword());
			
			updateCnt=pstmt.executeUpdate();
			
		}finally{
			dc.dbClose(null, pstmt, con);
		}
		return updateCnt;
	}//updatePW
}//class
