package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import userVO.MyInfoVO;
import common.DbConnection;

public class MyInfoDAO {

	private static MyInfoDAO miDAO;
	
	private MyInfoDAO() {
		
	}//MyInfoDAO
	
	public static MyInfoDAO getInstance() {
		if( miDAO == null ) {
			miDAO = new MyInfoDAO();
		}//end if
		return miDAO;
	}//getInstance
	
	/**
	 * id에 해당하는 회원 정보 조회.
	 * 회원 정보를 VO에 저장해준다.
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public MyInfoVO selectInfo(String id) throws SQLException{
		MyInfoVO miVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder selectid = new StringBuilder();
			selectid
			.append("select img, name, nick, birth, phone_num, sms_chk, email, email_chk, zipcode, addr1, addr2	")
			.append("from member																										")
			.append("where id = ?																											");
			
			pstmt = con.prepareStatement(selectid.toString());
		//4. 바인드 변수에 값 설정.
			pstmt.setString(1, id);
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				miVO = new MyInfoVO();
				
				miVO.setImg(rs.getString("img"));
				miVO.setName(rs.getString("name"));
				miVO.setNick(rs.getString("nick"));
				miVO.setBirth(rs.getString("birth"));
				miVO.setPhone_num(rs.getString("phone_num"));
				miVO.setSms_chk(rs.getString("sms_chk"));
				miVO.setEmail(rs.getString("email"));
				miVO.setEmail_chk(rs.getString("email_chk"));
				miVO.setZipcode(rs.getString("zipcode"));
				miVO.setAddr1(rs.getString("addr1"));
				miVO.setAddr2(rs.getString("addr2"));
			}//end if
			
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return miVO;
	}//selectInfo
	
	public int updateInfo(MyInfoVO miVO) throws SQLException{
		int updateCnt = 0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt =null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder update = new StringBuilder();
			update
			.append("update	member																																")
			.append("set			img = ?, nick = ?, phone_num = ?, sms_chk = ?, email = ?, email_chk = ?, zipcode = ?, addr1 = ?, addr2 =?	")
			.append("where id = ?																																		");
			
			pstmt = con.prepareStatement(update.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, miVO.getImg());
			pstmt.setString(2, miVO.getNick());
			pstmt.setString(3, miVO.getPhone_num());
			pstmt.setString(4, miVO.getSms_chk());
			pstmt.setString(5, miVO.getEmail());
			pstmt.setString(6, miVO.getEmail_chk());
			pstmt.setString(7, miVO.getZipcode());
			pstmt.setString(8, miVO.getAddr1());
			pstmt.setString(9, miVO.getAddr2());
			pstmt.setString(10, miVO.getId());
			
		//5. 쿼리문 수행 후 결과 얻기
			updateCnt = pstmt.executeUpdate();
		} finally {
		//6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		}//end finally
		
		return updateCnt;
	}//updateInfo
	
}//MyInfoVO
