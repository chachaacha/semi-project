package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.DbConnection;
import userVO.JoinVO;

/**
 * 회원가입DAO
 * @author user
 *
 */
public class JoinDAO {
	private static JoinDAO jDAO;
	
	private JoinDAO() {
		
	}
	
	public static JoinDAO getInstance() {
		if(jDAO==null) {
			jDAO = new JoinDAO();
		}
		return jDAO;
	}
	
	public void insertJoin(JoinVO jVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con=db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append("insert into member(id,password,img,name,nick,birth,phone_num,sms_chk,email,email_chk,zipcode,addr1,addr2) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, jVO.getId());
			pstmt.setString(2, jVO.getPassword());
			pstmt.setString(3, jVO.getImg());
			pstmt.setString(4, jVO.getName());
			pstmt.setString(5, jVO.getNick());
			pstmt.setString(6, jVO.getBirth());
			pstmt.setString(7, jVO.getPhone_num());
			pstmt.setString(8, jVO.getSms_chk());
			pstmt.setString(9, jVO.getEmail());
			pstmt.setString(10, jVO.getEmail_chk());
			pstmt.setString(11, jVO.getZipcode());
			pstmt.setString(12, jVO.getAddr1());
			pstmt.setString(13, jVO.getAddr2());
			pstmt.executeUpdate();
		} finally {
			db.dbClose(null, pstmt, con);
		}
	}//end insert
	
	
	
	
	
}
