package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import userVO.QuitVO;
import common.DbConnection;

public class QuitDAO {
	private static QuitDAO qDAO;
	
	private QuitDAO() {
		
	}//QuitDAO
	
	public static QuitDAO getInstance() {
		if( qDAO == null ) {
			qDAO = new QuitDAO();
		}
		return qDAO;
	}//getInstance
	
	public int updateQuit(QuitVO qVO) throws SQLException{
		int updateCnt =0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1. 드라비어 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder update = new StringBuilder();
			update
			.append("update	member								")
			.append("set			quit = Y,	quit_date = sysdate	")
			.append("where id = ?, password = ?					");
			
			pstmt = con.prepareStatement(update.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, qVO.getId());
			pstmt.setString(2, qVO.getPassword());
		//5. 쿼리문 수행 후 결과 얻기
			updateCnt = pstmt.executeUpdate();
		} finally {
		//6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		}//end finally
		
		return updateCnt;
	}
	
}//QuitDAO
