package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import userVO.BuyListVO;
import common.DbConnection;

public class BuyListDAO {
	private static BuyListDAO blDAO;
	
	private BuyListDAO() {
		
	}//BuyListDAO
	
	public static BuyListDAO getInstance() {
		if( blDAO == null ) {
			blDAO = new BuyListDAO();
		}
		return blDAO;
	}//getInstance
	
	public List<BuyListVO> selectBL(String buyer_id) throws SQLException {
		List<BuyListVO> list = new ArrayList<BuyListVO>();
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder select = new StringBuilder();
			select
			.append(" select pd.buyer_id, pd.product_idx, pd.thumbnail, pd.title, lc.gu_idx, lc.gu, pd.posted_date, pd.sold_check, pd.price, pd.comment_cnt, pd.liked_cnt ")
			.append(" from product pd, loc_category lc ")
			.append(" where (pd.gu_idx = lc.gu_idx) and buyer_id = ? ");
	
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, buyer_id);
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			
			BuyListVO blVO = null;
			
			while( rs.next() ) {
				blVO = new BuyListVO();
				blVO.setBuyer_id(rs.getString("buyer_id"));
				blVO.setProduct_idx(rs.getString("product_idx"));
				blVO.setThumbnail(rs.getString("thumbnail"));
				blVO.setTitle(rs.getString("title"));
				blVO.setGu(rs.getString("gu"));
				blVO.setPosted_date(rs.getDate("posted_date"));
				blVO.setSold_check(rs.getString("sold_check"));
				blVO.setPrice(rs.getInt("price"));
				blVO.setComment_cnt(rs.getInt("comment_cnt"));
				blVO.setLiked_cnt(rs.getInt("liked_cnt"));
				list.add(blVO);
			}//end while
			
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectBL
	
	public int updateDropBL(String product_idx) throws SQLException {
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
		.append(" update product ")
		.append(" set buyer_id = '--del--' ")
		.append(" where  product_idx = ? ");
		
		pstmt = con.prepareStatement(update.toString());
	//4. 바인드 변수에 값 설정
		pstmt.setString(1, product_idx);
	//5. 쿼리문 수행 후 결과 얻기
		updateCnt = pstmt.executeUpdate();
	} finally {
	//6. 연결 끊기
		dc.dbClose(null, pstmt, con);
	}
	return updateCnt;
	}//updateBL
}//BuyListDAO
