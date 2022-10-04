package managerDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbConnection;
import managerVO.BoardVO;
import managerVO.MangerCommentVO;

public class BoardDAO {
private static BoardDAO bDAO;
	
	private BoardDAO() {
	
	}
	
	public static BoardDAO getInstance() {
		if(bDAO==null){
			bDAO=new BoardDAO();
		}
		return bDAO;
	}
	
	
	/**
	 * 게시물 정보 띄우기
	 * @param product_idx
	 * @return
	 * @throws SQLException
	 */
	public BoardVO selectB(int product_idx) throws SQLException {
		BoardVO bVO=null;
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select pd.id, mb.nick, lc.gu_idx, lc.gu, pd.title, pd.category_idx, pc.category, ")
			.append("pd.contents, pd.price, pd.liked_cnt, pd.product_idx, pd.report_cnt, pd.post_date	")
			.append("	from member mb, product pd, loc_category lc, product_category pc	")
			.append("	where (pd.id=mb.id and pd.gu_idx=lc.gu_idx and pd.category_idx=pc.category_idx) and product_idx=?	");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setInt(1, product_idx);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				bVO=new BoardVO();
				bVO.setId(rs.getString("id"));
				bVO.setNick(rs.getString("nick"));
				bVO.setGu(rs.getString("gu"));
				bVO.setTitle(rs.getString("title"));
				bVO.setCategory(rs.getString("category"));
				bVO.setContents(rs.getString("contents"));
				bVO.setPrice(rs.getInt("price"));
				bVO.setLiked_cnt(rs.getInt("liked_cnt"));
				bVO.setProduct_idx(rs.getString("product_idx"));
				bVO.setReport_cnt(rs.getInt("report_cnt"));
				bVO.setPost_date(rs.getDate("post_date"));
			}//end if
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return bVO;
	}//selectB
	
	
	/**
	 * 게시글 이미지 가져오기
	 * @param product_idx
	 * @return
	 * @throws SQLException
	 */
	public List<String> selectImg(int product_idx) throws SQLException{
		List<String> list = new ArrayList<String>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		
		try {
			con=db.getConn();
			
			StringBuilder sb=new StringBuilder();
			sb
			.append("	select pi.product_img	")
			.append("	from product_img pi, product pd	")
			.append("	where ( pi.product_idx = pd.product_idx) and pd.product_idx = ?  ");
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setInt(1, product_idx);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString("product_img"));
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}//selectImg
	
	
	
	/**
	 * 댓글불러오기
	 * @param product_idx
	 * @return
	 * @throws SQLException
	 */
	public List<MangerCommentVO> selectComm(int product_idx) throws SQLException{
		List<MangerCommentVO> list = new ArrayList<>();
		
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select pc.comment_idx, pc.reply_idx, pc.product_idx, pc.id, (select nick from member where id=pc.id) nick, pc.contents, pc.posted_date, pc.deleted	")
			.append("	from product_comment pc	")
			.append("	where product_idx = ? ")
			.append("	order by pc.comment_idx, pc.reply_idx, pc.posted_date ");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setInt(1, product_idx);
			
			rs=pstmt.executeQuery();
			
			MangerCommentVO mcmVO=null;
			while(rs.next()) {
				mcmVO=new MangerCommentVO();
				mcmVO.setComment_idx(rs.getInt("comment_idx"));
				mcmVO.setReply_idx(rs.getInt("reply_idx"));
				mcmVO.setProduct_idx(rs.getString("product_idx"));
				mcmVO.setId(rs.getString("id"));
				mcmVO.setNick(rs.getString("nick"));
				mcmVO.setContents(rs.getString("contents"));
				mcmVO.setPosted_date(rs.getDate("posted_date"));
				mcmVO.setDeleted(rs.getString("deleted"));
				
				list.add(mcmVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}//selectComm
	
	/**
	 * 댓글삭제
	 * @param mcVO
	 * @return
	 * @throws SQLException
	 */
	public int updateDropC(MangerCommentVO mcVO) throws SQLException {
		int updateCnt=0;
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			StringBuilder updateDropC = new StringBuilder();
			updateDropC
			.append("	update product_comment	")
			.append("	set deleted= 'Y'	")
			.append("	where comment_idx=? and reply_idx=? and product_idx=?	");
			
			pstmt=con.prepareStatement(updateDropC.toString());
			pstmt.setInt(1, mcVO.getComment_idx());
			pstmt.setInt(2, mcVO.getReply_idx());
			pstmt.setString(3, mcVO.getProduct_idx());
			
			updateCnt=pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
				
		return updateCnt;
	}//updateDropC
	
	public int updateReportC(MangerCommentVO mcVO) throws SQLException {
		int updateCnt=0;
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			StringBuilder updateReportC = new StringBuilder();
			updateReportC
			.append("	update product	")
			.append("	set comment_cnt = (select count(product_idx) from product_comment where product_idx=?)	")
			.append("	where product_idx=?	");
			
			pstmt=con.prepareStatement(updateReportC.toString());
			pstmt.setString(1, mcVO.getProduct_idx());
			pstmt.setString(2, mcVO.getProduct_idx());
			
			updateCnt=pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return updateCnt;
	}//updateReportC
}
