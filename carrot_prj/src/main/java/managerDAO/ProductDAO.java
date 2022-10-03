package managerDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbConnection;
import managerVO.ProductSearchVO;
import managerVO.ProductVO;

public class ProductDAO {
	private static ProductDAO pDAO;
	
	private ProductDAO() {
		
	}
	
	public static ProductDAO getInstance() {
		if(pDAO==null) {
			pDAO = new ProductDAO();
		}
		return pDAO;
	}
	
	/**
	 * 전체상품리스트
	 * @param psVO
	 * @return
	 * @throws SQLException
	 */
	public List<ProductVO> selectAllProduct(ProductSearchVO psVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		List<ProductVO> list = new ArrayList<>();
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append(" select title, id, (select category from product_categroy where category_idx = p.category_idx ) category, decode(sold_checked,'Y','거래완료','N','판매중') sold_checked, posted_date, reported_cnt ")
			  .append(" from product p ")
			  .append(" where 1=1 ");
			if(psVO.getCategoryFlag() != -1) {
				sb.append(" and category_idx=? ");
			} 
			//////////////////////// order by 추후추가 혹은 js에서 처리//////////////////////////////////
			//////////////////////// 신고수순, 등록일순///////////////////////////////////
			pstmt = con.prepareStatement(sb.toString());
			if(psVO.getCategoryFlag() != -1) {
				pstmt.setInt(1, psVO.getCategoryFlag());
			}
			rs = pstmt.executeQuery();
			
			ProductVO pVO = null;
			while(rs.next()) {
				pVO = new ProductVO();
				pVO.setTitle(rs.getString("title"));
				pVO.setId(rs.getString("id"));
				pVO.setCategory(rs.getString("category"));
				pVO.setSold_checked(rs.getString("sold_checked"));
				pVO.setPosted_date(rs.getDate("posted_date"));
				pVO.setReported_cnt(rs.getInt("reported_cnt"));
				list.add(pVO);
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}
	
	/**
	 * 판매중 클릭시
	 * @param psVO
	 * @return
	 * @throws SQLException
	 */
	public List<ProductVO> selectOnSaleProduct(ProductSearchVO psVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append(" select title, id, (select category from product_categroy where category_idx = p.category_idx ) category, decode(sold_checked,'Y','거래완료','N','판매중') sold_checked, posted_date, reported_cnt ")
			  .append(" from product p ")
			  .append(" where 1=1 ")
			  .append(" and sold_checked = 'N' ");
			if(psVO.getCategoryFlag() != -1) {
				sb.append(" and category_idx=? ");
			} 
			//////////////////////// order by 추후추가 혹은 js에서 처리//////////////////////////////////
			//////////////////////// 신고수순, 등록일순///////////////////////////////////
			pstmt = con.prepareStatement(sb.toString());
			if(psVO.getCategoryFlag() != -1) {
				pstmt.setInt(1, psVO.getCategoryFlag());
			}
			rs = pstmt.executeQuery();
			List<ProductVO> list = new ArrayList<>();
			ProductVO pVO = null;
			while(rs.next()) {
				pVO = new ProductVO();
				pVO.setTitle(rs.getString("title"));
				pVO.setId(rs.getString("id"));
				pVO.setCategory(rs.getString("category"));
				pVO.setSold_checked(rs.getString("sold_checked"));
				pVO.setPosted_date(rs.getDate("posted_date"));
				pVO.setReported_cnt(rs.getInt("reported_cnt"));
				list.add(pVO);
			}
			return list;
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
	}
	
	/**
	 * 거래완료 선택시
	 * @param psVO
	 * @return
	 * @throws SQLException
	 */
	public List<ProductVO> selectSoldProduct(ProductSearchVO psVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		List<ProductVO> list = new ArrayList<>();
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append(" select title, id, (select category from product_categroy where category_idx = p.category_idx ) category, decode(sold_checked,'Y','거래완료','N','판매중') sold_checked, posted_date, reported_cnt ")
			  .append(" from product p ")
			  .append(" where 1=1 ")
			  .append(" and sold_checked = 'Y' ");
			if(psVO.getCategoryFlag() != -1) {
				sb.append(" and category_idx=? ");
			} 
			//////////////////////// order by 추후추가 혹은 js에서 처리//////////////////////////////////
			//////////////////////// 신고수순, 등록일순///////////////////////////////////
			pstmt = con.prepareStatement(sb.toString());
			if(psVO.getCategoryFlag() != -1) {
				pstmt.setInt(1, psVO.getCategoryFlag());
			}
			rs = pstmt.executeQuery();
			ProductVO pVO = null;
			while(rs.next()) {
				pVO = new ProductVO();
				pVO.setTitle(rs.getString("title"));
				pVO.setId(rs.getString("id"));
				pVO.setCategory(rs.getString("category"));
				pVO.setSold_checked(rs.getString("sold_checked"));
				pVO.setPosted_date(rs.getDate("posted_date"));
				pVO.setReported_cnt(rs.getInt("reported_cnt"));
				list.add(pVO);
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}
	
	/**
	 * 검색버튼 눌렀을 시
	 * @param psVO
	 * @return
	 * @throws SQLException
	 */
	public List<ProductVO> selectKeywordProduct(String keyword) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		List<ProductVO> list = new ArrayList<>();
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append(" select title, id, (select category from product_categroy where category_idx = p.category_idx ) category, decode(sold_checked,'Y','거래완료','N','판매중') sold_checked, posted_date, reported_cnt ")
			  .append(" from product p ")
			  .append(" where title like '%'||?||'%' ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			
			ProductVO pVO = null;
			while(rs.next()) {
				pVO = new ProductVO();
				pVO.setTitle(rs.getString("title"));
				pVO.setId(rs.getString("id"));
				pVO.setCategory(rs.getString("category"));
				pVO.setSold_checked(rs.getString("sold_checked"));
				pVO.setPosted_date(rs.getDate("posted_date"));
				pVO.setReported_cnt(rs.getInt("reported_cnt"));
				list.add(pVO);
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}
	
	/**
	 * List에 상품인덱스를 담아서 일괄삭제하는 메서드
	 * @param list
	 * @return
	 * @throws SQLException 
	 */
	public int deleteProduct(List<Integer> list) throws SQLException { 
		int rowCnt=0;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append(" delete from product ")
			  .append(" where 1 = 2 "); // where 단독으로는 실행 X
		    for(int i = 0; i< list.size();i++) {
		    	sb.append(" or product_idx=? ");
		    }
		    pstmt = con.prepareStatement(sb.toString());
		    for(int i = 0; i< list.size();i++) {
		    	pstmt.setInt(i+1, list.get(i));
		    }
		    rowCnt = pstmt.executeUpdate();
		} finally {
			db.dbClose(null, pstmt, con);
		}
		return rowCnt;
	}
	
	
}
