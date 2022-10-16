package userDAO;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import common.DbConnection;
import kr.co.sist.util.cipher.DataEncrypt;
import userVO.JoinVO;
//키를 받아옴
public class JoinDAO {
	private static JoinDAO jDAO;
	private String key;
	
	private JoinDAO(String key) {
		this.key=key;
	}
	
	public static JoinDAO getInstance(String key) {
		if(jDAO==null) {
			jDAO = new JoinDAO(key);
		}
		return jDAO;
	}
	
	/**
	 * 회원가입
	 * @param jVO
	 * @throws SQLException
	 */
	public void insertJoin(JoinVO jVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con=db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append("insert into member(id,password,img,name,nick,birth,phone_num,sms_chk,email,email_chk,zipcode,addr1,addr2) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			//일방향Hash
		      DataEncrypt de=null;
		      de=new DataEncrypt(DataEncrypt.messageDigest("SHA-1", key));
			
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
			
	      } catch (UnsupportedEncodingException e) {
	    	  e.printStackTrace();
	      } catch (NoSuchAlgorithmException e) {
	    	  e.printStackTrace();
	      } catch(GeneralSecurityException e) {
	    	  e.printStackTrace();	
		} finally {
			db.dbClose(null, pstmt, con);
		}
	}//end insert
	
	/**
	 * 아이디 중복확인
	 * @param paramId
	 * @return
	 * @throws SQLException
	 */
	public boolean selectId(String paramId)throws SQLException{
		boolean flag=false;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		try {
			con=dc.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append("select id from member where id=? ");
			
			pstmt=con.prepareStatement(sb.toString());
			
			pstmt.setString(1, paramId);
			
			rs=pstmt.executeQuery();
			
			flag=rs.next();//검색결과 있음 true, 없음 false
				
		}finally {
			//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}
		return flag;
	}
	
	
}
