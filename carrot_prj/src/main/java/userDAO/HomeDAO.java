package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbConnection;
import userVO.HomeVO;

/**
 * 홈화면DAO
 * @author user
 *
 */
public class HomeDAO {
	private static HomeDAO hDAO;
	
	private HomeDAO() {
	}
	
	public static HomeDAO getInstance() {
		if(hDAO==null) {
			hDAO = new HomeDAO();
		}
		return hDAO;
	}// end HomeDAO
	
	/**
	 * 인기매물을 가져오는 메소드
	 * @return
	 * @throws SQLException
	 */
	public List<HomeVO> selectProduct() throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HomeVO> list = new ArrayList<>();
		HomeVO hVO = null;
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append("select thumbnail,title, price, gu, comment_cnt, liked_cnt, product_idx ")
	           .append("from (select thumbnail,title, price, posted_date, free, gu_idx, category_idx,(select gu from loc_category where gu_idx = p.gu_idx) gu, comment_cnt, liked_cnt, row_number() over(order by liked_cnt desc) rank, product_idx, sold_check, (select quit from member where id = p.id) quit from product p ) ")
	           .append("where 1=1 and sold_check='N' and quit='N' order by liked_cnt desc ")
			   .append("offset 1 rows ")
			   .append("fetch next 8 rows only ");
			pstmt= con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				hVO = new HomeVO();
				hVO.setThumbnail(rs.getString("thumbnail"));
				hVO.setTitle(rs.getString("title"));
				hVO.setPrice(rs.getInt("price"));
				hVO.setGu(rs.getString("gu"));
				hVO.setComment_cnt(rs.getInt("comment_cnt"));
				hVO.setLiked_cnt(rs.getInt("liked_cnt"));
				hVO.setProduct_idx(rs.getString("product_idx"));
				list.add(hVO);
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}//end selectProduct()
	
	
	/**
	 * 인기검색어를 가져오는 메소드
	 * @return
	 * @throws SQLException
	 */
	public List<String> selectSearch() throws SQLException {
		List<String> list = new ArrayList<>();
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append("select word, cnt ")
			   .append("from (select word, cnt, row_number() over(order by cnt desc) r ")
			   .append("from (select word, count(word) cnt ")
			   .append("from search ")
			   .append("group by word ))")
			   .append("where r between 1 and 10 ");
			pstmt= con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("word"));
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}
}
