package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import userVO.MyBlockVO;
import common.DbConnection;

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
		try {
			con = dc.getConn();
			StringBuilder sb = new StringBuilder();
			sb  
			.append(" select  m.nick||'('||substr(ub.blocked_id,0,4)||'****'||')' nick,  m.addr1, ub.blocked_id	")
			.append(" from member m, USER_BLOCKED ub ")
			.append(" where ( ub.blocked_id=m.id ) and ub.id=? ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			MyBlockVO mcVO = null;
			while( rs.next() ) {
				mcVO = new MyBlockVO();
				mcVO.setNickPlusId(rs.getString("nick"));
				mcVO.setAddr1(rs.getString("addr1"));
				mcVO.setBlocked_id(rs.getString("blocked_id"));
				list.add(mcVO);
			}
		} finally {
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
			StringBuilder sb = new StringBuilder();
			sb
			.append("	delete from	user_blocked ")
			.append("	where id = ? and blocked_id = ?	");
			
			pstmt = con.prepareStatement(sb.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, mbVO.getId());
			pstmt.setString(2, mbVO.getBlocked_id());
		//5. 쿼리문 수행 후 결과 얻기
			deleteCnt = pstmt.executeUpdate(); 
															
		} finally {
		//6. 연결 끊기.
			dc.dbClose(null, pstmt, con);
		}//end finally
		
		return deleteCnt;
	}
	
}//MyBlockDAO
