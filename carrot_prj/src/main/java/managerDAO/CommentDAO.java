package managerDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import common.DbConnection;
import managerVO.CommentVO;
import managerVO.PopupVO;

public class CommentDAO {
	private static CommentDAO cDAO;
	
	private CommentDAO() {
		
	}
	
	public static CommentDAO getInstance() {
		if(cDAO==null) {
			cDAO = new CommentDAO();
		}
		return cDAO;
	}
	
	public List<CommentVO> selectComment(PopupVO pVO) throws SQLException { 
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		List<CommentVO> list = new ArrayList<>();
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append(" select c.product_idx, c.contents, c.id, p.title, c.posted_date, c.reported_cnt  ")
			  .append(" from product_comment c, product p")
			  .append(" where (c.product_idx = p.product_idx) and c.reported_cnt > 0 ");
			
			if(pVO.getKeyword() != null && !"".trim().equals(pVO.getKeyword())) {
				sb.append(" and c.contents like '%'||?||'%' ");
			}
			
			switch(pVO.getOrderFlag()) {
			case 1:
				sb.append(" order by c.reported_cnt desc ");
				break;
			
			case 2:
				sb.append(" order by c.posted_date desc ");
			}
			
			pstmt = con.prepareStatement(sb.toString());
			if(pVO.getKeyword() != null && !"".trim().equals(pVO.getKeyword())) {
				pstmt.setString(1, pVO.getKeyword());
			}
			
			rs=pstmt.executeQuery();
			
			CommentVO cVO = null;
			while(rs.next()) {
				cVO = new CommentVO();
				cVO.setProduct_idx(rs.getString("product_idx"));
				cVO.setContents(rs.getString("contents"));
				cVO.setId(rs.getString("id"));
				cVO.setTitle(rs.getString("title"));
				cVO.setPosted_date(rs.getDate("posted_date"));
				cVO.setReported_cnt(rs.getInt("reported_cnt"));
				list.add(cVO);
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}
	
	public List<CommentVO> selectkeywordComment(String keyword) throws SQLException { 
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		List<CommentVO> list = new ArrayList<>();
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append(" select c.contents, c.id, p.title, c.posted_date, c.reported_cnt  ")
			  .append(" from comment c, product p")
			  .append(" where (c.product_idx = p.product_idx) and c.reported_cnt > 0 ")
			  .append(" and c.id like '%'||?||'%' ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, keyword);
			rs=pstmt.executeQuery();
			
			CommentVO cVO = null;
			while(rs.next()) {
				cVO = new CommentVO();
				cVO.setContents(rs.getString("contents"));
				cVO.setId(rs.getString("id"));
				cVO.setTitle(rs.getString("title"));
				cVO.setPosted_date(rs.getDate("posted_date"));
				cVO.setReported_cnt(rs.getInt("reported_cnt"));
				list.add(cVO);
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}
}
