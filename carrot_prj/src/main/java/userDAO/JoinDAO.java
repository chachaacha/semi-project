package userDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		
		//1. 드라비어 로딩
		try {
		//2. Connection 얻기
			con=dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder sb = new StringBuilder();
			sb.append("select id from member where id=?");
			pstmt=con.prepareStatement(sb.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, paramId);
		//5. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			flag=rs.next();//검색결과 있음 true, 없음 false
				
		}finally {
			//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}
		return flag;
	}
	
	
}
