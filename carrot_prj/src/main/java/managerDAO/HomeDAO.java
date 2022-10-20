package managerDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import managerVO.HomeDealVO;
import common.DbConnection;

public class HomeDAO {
	private static HomeDAO hDAO;
	
	public HomeDAO() {
	}//HomeDAO
	
	public static HomeDAO getInstance() {
		if( hDAO == null ) {
			hDAO = new HomeDAO();
		}
		return hDAO;
	}//getInstance
	
	public HomeDealVO selectDeal1() throws SQLException {
		HomeDealVO hdVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//1. 드라이버 로딩
		try {
		//2.  Connection  얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder selectDe = new StringBuilder();
			selectDe
			.append("select count(product_idx) count, sum(price) sum ")
			.append("from product ")
			.append("where sold_check= 'Y' and purchased_date = to_date(sysdate,'yy-mm-dd') " );
			
			pstmt = con.prepareStatement(selectDe.toString());
		//4. 바인드 변수에 값 설정
			
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
						
			if( rs.next() ) {
				hdVO = new HomeDealVO();
				hdVO.setDoneDeal(rs.getInt("count"));
				hdVO.setAmount(rs.getInt("sum"));
			}//end while
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		return hdVO;
		
	}//selectDeal
	
	public HomeDealVO selectDeal2() throws SQLException {
		HomeDealVO hdVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//1. 드라이버 로딩
		try {
		//2.  Connection  얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder selectDe = new StringBuilder();
			selectDe
			.append("select count(product_idx) count, sum(price) sum ")
			.append("from product ")
			.append("where sold_check ='Y' and purchased_date = to_date(sysdate,'yy-mm-dd')-1 ");
			
			pstmt = con.prepareStatement(selectDe.toString());
		//4. 바인드 변수에 값 설정
			
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
						
			if( rs.next() ) {
				hdVO = new HomeDealVO();
				hdVO.setDoneDeal(rs.getInt("count"));
				hdVO.setAmount(rs.getInt("sum"));
			}//end while
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		return hdVO;
		
	}//selectDeal
	
	public HomeDealVO selectDeal3() throws SQLException {
		HomeDealVO hdVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//1. 드라이버 로딩
		try {
		//2.  Connection  얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder selectDe = new StringBuilder();
			selectDe
			.append("select count(product_idx) count, sum(price) sum ")
			.append("from product ")
			.append("where sold_check ='Y' and purchased_date between to_date(sysdate,'yy-mm-dd')-7 and to_date(sysdate,'yy-mm-dd') ");
			
			pstmt = con.prepareStatement(selectDe.toString());
		//4. 바인드 변수에 값 설정
			
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
						
			if( rs.next() ) {
				hdVO = new HomeDealVO();
				hdVO.setDoneDeal(rs.getInt("count"));
				hdVO.setAmount(rs.getInt("sum"));
			}//end while
			
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		return hdVO;
		
	}//selectDeal
	
	public int selectMember1() throws SQLException {
		int member_cnt = 0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder selectMb = new StringBuilder();
			
			selectMb
			.append(" select count(id) count ")
			.append(" from member ")
			.append(" where joined_date = to_date(sysdate,'yy-mm-dd') ");
			
			pstmt = con.prepareStatement(selectMb.toString());
		//4. 바인드 변수에 값 설정
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member_cnt = rs.getInt("count");
			}
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return member_cnt;
	}//selectMember
	
	public int selectMember2() throws SQLException {
		int member_cnt = 0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder selectMb = new StringBuilder();
			
			selectMb
			.append(" select count(id) count ")
			.append(" from member ")
			.append(" where quit_date = to_date(sysdate,'yy-mm-dd')");
			pstmt = con.prepareStatement(selectMb.toString());
		//4. 바인드 변수에 값 설정
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			if(rs.next()) {
			member_cnt = rs.getInt("count");
			}
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return member_cnt;
	}//selectMember
	
	public int selectMember3() throws SQLException {
		int member_cnt = 0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder selectMb = new StringBuilder();
			
			selectMb
			.append(" select count(id) count ")
			.append(" from member ")
			.append(" where quit = 'N' ");
			
			pstmt = con.prepareStatement(selectMb.toString());
		//4. 바인드 변수에 값 설정
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member_cnt = rs.getInt("count");
			}
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return member_cnt;
	}//selectMember
}//HomeDAO
