package day1010;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class WishListDAO {
	
	private static WishListDAO wlDAO;
	
	private WishListDAO() {
		
	}//WishListDAO
	
	public static WishListDAO getInstance() {
		if( wlDAO == null ) {
			wlDAO = new WishListDAO();
		}
		return wlDAO;
	}//getInstance
	
	public List<WishListVO> selectWL(String id) throws SQLException {
		List<WishListVO> list = new ArrayList<WishListVO>();
		
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
			.append("	select	pd.product_idx pd.thumbnail, pd.title, lc.gu_idx, lc.gu, pd.price, pd.comment_cnt, pd.like_cnt	")
			.append("	from	product pd, wish_list wl, loc_category lc																	")
			.append("	where	( wl.product_idx = pd.product_idx and pd.gu_idx = lc.gu_idx ) and wl.id = ?						");
			
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, id);
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			
			WishListVO wlVO = null;
			
			while( rs.next() ) {
				wlVO = new WishListVO();
				wlVO.setProduct_idx(rs.getInt("product_idx"));
				wlVO.setThumbnail(rs.getString("thumbnail"));
				wlVO.setTitle(rs.getString("title"));
				wlVO.setGu(rs.getString("gu"));
				wlVO.setPrice(rs.getInt("price"));
				wlVO.setComment_cnt(rs.getInt("comment_cnt"));
				wlVO.setLike_cnt(rs.getInt("like_cnt"));
				
				list.add(wlVO);
			}//end while;
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}
		return list;
	}//selectWL
	
	public int deleteWL(WishListVO wlVO) throws SQLException {
		int deleteCnt = 0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder delete = new StringBuilder();
			delete
			.append("	delete from wish_list						")
			.append("	where where id = ?, product_idx = ?	");
			
			pstmt = con.prepareStatement(delete.toString());
		//4. 바인드 변수 설정
			pstmt.setString(1, wlVO.getId());
			pstmt.setInt(2, wlVO.getProduct_idx());
			
		//5. 쿼리문 수행 후 결과 얻기
			deleteCnt = pstmt.executeUpdate();
		} finally {
		//6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		}
		
		return deleteCnt;
	}//deleteWL
	
	public int updateWL(int product_idx) throws SQLException {
		int updateCnt = 0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		//1. 드라이버로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder update = new StringBuilder();
			update
			.append("	update	product																						")
			.append("	set			liked_cnt	=	(select count(product_idx) from	wish_list where product_idx = ?	")
			.append("	where		product_idx = ?																				");
			
			pstmt=con.prepareStatement(update.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setInt(1, product_idx);
			pstmt.setInt(2, product_idx);
		//5. 쿼리문 수행 후 결과 얻기
			updateCnt =pstmt.executeUpdate();
		}finally {
		//6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		}
		
		return updateCnt;
	}//updateWL

}//WishListDAO
