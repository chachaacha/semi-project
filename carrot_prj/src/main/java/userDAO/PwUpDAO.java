package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import userVO.PwUpVO;
import common.DbConnection;

public class PwUpDAO {
	private static PwUpDAO puDAO;
	
	private PwUpDAO() {
		
	}//PwUpDAO
	
	public static PwUpDAO getInstance() {
		if( puDAO == null ) {
			puDAO = new PwUpDAO();
		}//end if
		return puDAO;
	}//getInstance
	
	
	/**
	 * 아이디와 비밀번호로 테이블 조회 후 기존 비밀번호를 새 비밀번호로 변경하는 일
	 * @param puVO
	 * @return
	 * @throws SQLException
	 */
	public int updatePw(PwUpVO puVO) throws SQLException{
		int updateCnt = 0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder update = new StringBuilder();
			update
			.append("update	member				")
			.append("set			password	= ?		")
			.append("where id = ? and password = ?	");
			
			pstmt = con.prepareStatement(update.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, puVO.getNew_pw());
			pstmt.setString(2, puVO.getId());
			pstmt.setString(3, puVO.getPassword());
			
			updateCnt=pstmt.executeUpdate();
			
		//5. 쿼리문 수행 후 결과 얻기
		} finally {
		//6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		}//end finally
		
		return updateCnt;
	}
	
}//PwUpDAO
