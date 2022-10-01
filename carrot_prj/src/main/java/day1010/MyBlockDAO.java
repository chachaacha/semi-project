package day1010;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class MyBlockDAO {
	
	private static MyBlockDAO mbDAO;

	private MyBlockDAO() {
		
	}
	
	public static MyBlockDAO getInstance() {
		if( mbDAO == null ) {
			mbDAO = new MyBlockDAO();
		}
		return mbDAO;
	}//getInstance
	
	public List<MyBlockVO> selectMB(String id) throws SQLException {
		List<MyBlockVO> list = new ArrayList<MyBlockVO>();
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder select = new StringBuilder();
			select
			.append("	select ub.id, ub.blocked_id, mb.nick, ub.blocked_date	")
			.append("	from user_blocked ub, member mb							")
			.append("	where (mb.id = ub.blocked_id)	ub.id = ?					");
			
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, id);
		//5. 쿼리문 실행 후 결과 얻기.
			rs = pstmt.executeQuery();
			
			MyBlockVO mcVO = null;
			
			while( rs.next() ) {
				mcVO = new MyBlockVO();
				mcVO.setId(rs.getString("id"));
				mcVO.setBlocked_id(rs.getString("blocked_id"));
				mcVO.setNick(rs.getString("nick"));
				mcVO.setBlocked_date(rs.getDate("blocked_date"));
			}
		} finally {
		//6. 연결 끊기.
			dc.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	public int deleteMB(MyBlockVO mbVO) throws SQLException {
		int deleteCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection dc = DbConnection.getInstance();
		//1. 드라이버로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder delete = new StringBuilder();
			delete
			.append("	delete from	user_blocked			")
			.append("	where id = ?,	blocked_id = ?	");
			
			pstmt = con.prepareStatement(delete.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, mbVO.getId());
			pstmt.setString(2, mbVO.getBlocked_id());
		//5. 쿼리문 수행 후 결과 얻기
			deleteCnt = pstmt.executeUpdate(); //리턴되는 값: 0 - 삭제된 행 없는 경우 
															// 또는 1 - 삭제된 행이 하나인 경우.
		} finally {
		//6. 연결 끊기.
			dc.dbClose(null, pstmt, con);
		}//end finally
		
		return deleteCnt;
	}
	
}//MyBlockDAO
