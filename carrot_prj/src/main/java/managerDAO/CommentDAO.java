package managerDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import common.DbConnection;
import managerVO.CommentVO;

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
	
	public List<CommentVO> selectComment() throws SQLException { 
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		List<CommentVO> list = new ArrayList<>();
		try {
			con = db.getConn();
			StringBuffer sb = new StringBuffer();
			sb.append(" select c.contents, c.id, p.title, c.posted_date, c.reported_cnt  ")
			  .append(" from product_comment c, product p")
			  .append(" where (c.product_idx = p.product_idx) and c.reported_cnt > 0 ")
			  .append(" order by reported_cnt desc ");
			
			pstmt = con.prepareStatement(sb.toString());
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
