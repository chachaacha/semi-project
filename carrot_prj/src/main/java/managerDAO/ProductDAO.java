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
	
	public int selectTotal(ProductSearchVO psVO) throws SQLException {
		int count = 0;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append(" select count(*) total ")
			  .append(" from product p ")
			  .append(" where 1=1 ");
			if(psVO.getSelStatus() != 0) {
				switch(psVO.getSelStatus()) {
				case 1:
					sb.append(" and sold_check = 'N' ");
					break;
				case 2:
					sb.append(" and sold_check = 'Y' ");
					break;
				}
			}
			
			if(psVO.getCategoryFlag() != 0) {
				sb.append(" and category_idx=? ");
			} 
			
			
			if(psVO.getDateOrderFlag() != 0) {
				switch(psVO.getDateOrderFlag()) {
				case 1:
					sb.append(" order by posted_date desc ");
					break;
					
				case 2:
					sb.append(" order by posted_date ");
				}
			}
			
			if(psVO.getReportOrderFlag() != 0) {
				switch(psVO.getReportOrderFlag()) {
				case 1:
					sb.append(" order by report_cnt desc ");
					break;
					
				case 2:
					sb.append(" order by report_cnt ");
				}
			}
			
			
			pstmt = con.prepareStatement(sb.toString());
			if(psVO.getCategoryFlag() != 0) {
				pstmt.setInt(1, psVO.getCategoryFlag());
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("total");
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return count;
	}
	
	
	public List<ProductVO> selectProduct(ProductSearchVO psVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		List<ProductVO> list = new ArrayList<>();
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append(" select product_idx, title, id, (select category from product_category where category_idx = p.category_idx ) category, decode(sold_check,'Y','거래완료','N','판매중') sold_check, posted_date, report_cnt ")
			  .append(" from product p ")
			  .append(" where 1=1 ");
			if(psVO.getSelStatus() != 0) {
				switch(psVO.getSelStatus()) {
				case 1:
					sb.append(" and sold_check = 'N' ");
					break;
				case 2:
					sb.append(" and sold_check = 'Y' ");
					break;
				}
			}
			
			if(psVO.getCategoryFlag() != 0) {
				sb.append(" and category_idx=? ");
			} 
			
			
			if(psVO.getDateOrderFlag() != 0) {
				switch(psVO.getDateOrderFlag()) {
				case 1:
					sb.append(" order by posted_date desc ");
					break;
					
				case 2:
					sb.append(" order by posted_date ");
				}
			}
			
			if(psVO.getReportOrderFlag() != 0) {
				switch(psVO.getReportOrderFlag()) {
				case 1:
					sb.append(" order by report_cnt desc ");
					break;
					
				case 2:
					sb.append(" order by report_cnt ");
				}
			}
			
			sb
			.append(" offset ((?-1)*10) rows ")
			.append(" fetch next 10 rows only ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			int num = 0;
			if(psVO.getCategoryFlag() != 0) {
				pstmt.setInt(++num, psVO.getCategoryFlag());
			}
			pstmt.setInt(++num, psVO.getPageFlag());
			rs = pstmt.executeQuery();
			ProductVO pVO = null;
			while(rs.next()) {
				pVO = new ProductVO();
				pVO.setProduct_idx(rs.getString("product_idx"));
				pVO.setTitle(rs.getString("title"));
				pVO.setId(rs.getString("id"));
				pVO.setCategory(rs.getString("category"));
				pVO.setSold_check(rs.getString("sold_check"));
				pVO.setPosted_date(rs.getDate("posted_date"));
				pVO.setReport_cnt(rs.getInt("report_cnt"));
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
			sb.append(" select product_idx, title, id, (select category from product_category where category_idx = p.category_idx ) category, decode(sold_check,'Y','거래완료','N','판매중') sold_check, posted_date, report_cnt ")
			  .append(" from product p ")
			  .append(" where title like '%'||?||'%' ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			
			ProductVO pVO = null;
			while(rs.next()) {
				pVO = new ProductVO();
				pVO.setProduct_idx(rs.getString("product_idx"));
				pVO.setTitle(rs.getString("title"));
				pVO.setId(rs.getString("id"));
				pVO.setCategory(rs.getString("category"));
				pVO.setSold_check(rs.getString("sold_check"));
				pVO.setPosted_date(rs.getDate("posted_date"));
				pVO.setReport_cnt(rs.getInt("report_cnt"));
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
	public int deleteProduct(List<String> list) throws SQLException { 
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
		    	pstmt.setString(i+1, list.get(i));
		    }
		    rowCnt = pstmt.executeUpdate();
		    System.out.println(sb);
		} finally {
			db.dbClose(null, pstmt, con);
		}
		return rowCnt;
	}
	
	
	
	
}
