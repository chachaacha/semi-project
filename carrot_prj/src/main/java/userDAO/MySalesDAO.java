package userDAO;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import userVO.BuyVO;
import userVO.MySalesVO;
import common.DbConnection;

public class MySalesDAO {
	private static MySalesDAO msDAO;
	
	private MySalesDAO() {
		
	}//MySalesDAO
	
	public static MySalesDAO getInstance() {
		if( msDAO == null ) {
			msDAO = new MySalesDAO();
		}//end if
		return msDAO;
	}//getInstance
	
	
	/**
	 * 입력 값에 따른 판매중인 게시글 전체 조회
	 * @param msVO
	 * @return
	 * @throws SQLException
	 */
	public List<MySalesVO> selectSale(String id) throws SQLException{
		List<MySalesVO> list = new ArrayList<MySalesVO>();
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder selectAll = new StringBuilder();
			selectAll
			.append("	select	p.product_idx, p.thumbnail, p.title, lc.gu_idx, lc.gu, p.post_date, p.reserved, p.sold_check, p.price, p.comment_cnt, p.like_cnt	")
			.append("	from	product p, loc_category lc																													")
			.append("	where	(p.gu_idx = lc.gu_idx) and id = ?	and sold_check = 'N' 																					");
			
			pstmt = con.prepareStatement(selectAll.toString());
		//4. 바인드 변수 설정
			pstmt.setString(1, id);
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			
			MySalesVO mssVO = null;
			
			while( rs.next() ) {
				mssVO = new MySalesVO();
				mssVO.setProduct_idx(rs.getString("product_idx"));
				mssVO.setThumbnail(rs.getString("thumbnail"));
				mssVO.setTitle(rs.getString("title"));
				mssVO.setGu(rs.getString("gu"));
				mssVO.setPost_date(rs.getDate("post_date"));
				mssVO.setReserved(rs.getString("reserved"));
				mssVO.setSold_chk(rs.getString("sold_check"));
				mssVO.setPrice(rs.getInt("price"));
				mssVO.setComment_cnt(rs.getInt("comment_cnt"));
				mssVO.setLike_cnt(rs.getInt("like_cnt"));
				
				list.add(mssVO);
			}//end while
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectSale
	
	public int deleteBoard(int product_idx) throws SQLException{
		int deleteCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection dc = DbConnection.getInstance();
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder delete = new StringBuilder();
			delete
			.append("delete						")
			.append("from	product			")
			.append("where product_idx = ?");
			
			pstmt = con.prepareStatement(delete.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setInt(1, product_idx);
		//5. 쿼리문 수행 후 결과 얻기
			deleteCnt = pstmt.executeUpdate();
			
		} finally {
		//6. 연결 끊기.
			dc.dbClose(null, pstmt, con);
		}//end finally
		
		return deleteCnt;
	}//deleteBoard
	
	public int updateReserved(MySalesVO msVO) throws SQLException{
		int updateCnt = 0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder update = new StringBuilder();
			update
			.append("update	product			")
			.append("set			reserved = ?		")
			.append("where		product_idx = ?	");
			
			pstmt = con.prepareStatement(update.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, msVO.getReserved());
			pstmt.setString(2, msVO.getProduct_idx());
		//5. 쿼리문 수행 후 결과 얻기
			updateCnt = pstmt.executeUpdate();
		} finally {
		//6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		}//end finally
		
		return updateCnt;
	}//updateResev
	
	public List<MySalesVO> selectTrader(String id) throws SQLException {
		List<MySalesVO> list = new ArrayList<MySalesVO>();
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder select = new StringBuilder();
			select
			.append("	select p.product_idx, p.thumbnail, p.title, lc.gu_idx, lc.gu, p.posted_date, p.price	")
			.append("	from product p, loc_category lc																")
			.append("	where	(p.gu_idx = lc.gu_idx) and id = ?	and sold_check = 'Y' 							");
			
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, id);
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			
			MySalesVO msVO = null;
			
			while( rs.next() ) {
				msVO = new MySalesVO();
				msVO.setProduct_idx(rs.getString("product_idx"));
				msVO.setThumbnail(rs.getString("thumbnail"));
				msVO.setTitle(rs.getString("title"));
				msVO.setGu(rs.getString("gu"));
				msVO.setPost_date(rs.getDate("post_date"));
				msVO.setPrice(rs.getInt("price"));
				list.add(msVO);
			}//end while
			
		} finally {
		//6. 연결끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectTrader
	
	public int updateTrader(BuyVO bVO) throws SQLException {
		int updateCnt = 0;
		
		DbConnection dc = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder update = new StringBuilder();
			update
			.append("	update	product							")
			.append("	set			buy_id = ? sold_check = Y	")
			.append("	where 	product_idx = ?					");
			
			pstmt = con.prepareStatement(update.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, bVO.getBuy_id());
			pstmt.setString(2, bVO.getProduct_idx());
		//5. 쿼리문 수행 후 결과 얻기
		} finally {
		//.6 연결 끊기
			dc.dbClose(null, pstmt, con);
		}
		return updateCnt;
	}
	
}//MySalesDAO
