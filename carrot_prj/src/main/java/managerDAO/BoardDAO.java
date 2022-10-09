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
	public BoardVO selectB(String product_idx) throws SQLException {
		BoardVO bVO=null;
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append(" select m.img ,m.id, m.nick, p.thumbnail, p.price, p.title, p.contents, p.report_cnt, p.comment_cnt, p.free, p.reserved, p.liked_cnt, p.sold_check, p.posted_date, lc.gu, pc.category ")
			.append(" from member m, product p, LOC_CATEGORY lc, PRODUCT_CATEGORY pc ")
			.append(" where (p.id=m.id and p.gu_idx=lc.gu_idx and p.category_idx = pc.category_idx) and p.product_idx=? ");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, product_idx);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				bVO=new BoardVO();
				bVO.setImg(rs.getString("img"));
				bVO.setId(rs.getString("id"));
				bVO.setNick(rs.getString("nick"));
				bVO.setTumbnail(rs.getString("thumbnail"));
				bVO.setPrice(rs.getInt("price"));
				bVO.setTitle(rs.getString("title"));
				bVO.setContents(rs.getString("contents"));
				bVO.setReport_cnt(rs.getInt("report_cnt"));
				bVO.setComment_cnt(rs.getInt("comment_cnt"));
				bVO.setFree(rs.getString("free"));
				bVO.setReserved(rs.getString("reserved"));
				bVO.setLiked_cnt(rs.getInt("liked_cnt"));
				bVO.setSold_check(rs.getString("sold_check"));
				bVO.setPosted_date(rs.getDate("posted_date"));
				bVO.setGu(rs.getString("gu"));
				bVO.setCategory(rs.getString("category"));
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
	public List<String> selectImg(String product_idx) throws SQLException{
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
			pstmt.setString(1, product_idx);
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
	public List<MangerCommentVO> selectComm(String product_idx) throws SQLException{
		List<MangerCommentVO> list = new ArrayList<>();
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=db.getConn();
			StringBuilder sb = new StringBuilder();
			sb
			.append(" select m.nick||'('||substr(m.id,0,4)||'****'||')' nick, m.id, m.img, pc.comment_idx, pc.reply_idx, pc.contents, pc.reported_cnt, pc.posted_date ")
			.append(" from product_comment pc, member m ")
			.append(" where (pc.id = m.id) and product_idx = ? ")
			.append(" order by pc.comment_idx, pc.reply_idx, posted_date ");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, product_idx);
			
			rs=pstmt.executeQuery();
			
			MangerCommentVO mcVO=null;
			while(rs.next()) {
				mcVO = new MangerCommentVO();
				mcVO.setIdPlusNick(rs.getString("nick"));
				mcVO.setId(rs.getString("id"));
				mcVO.setImg(rs.getNString("img"));
				mcVO.setComment_idx(rs.getInt("comment_idx"));
				mcVO.setReply_idx(rs.getInt("reply_idx"));
				mcVO.setContents(rs.getString("contents"));
				mcVO.setReported_cnt(rs.getInt("reported_cnt"));
				mcVO.setPosted_date(rs.getDate("posted_date"));
				list.add(mcVO);
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
			/* pstmt.setString(3, mcVO.getProduct_idx()); */
			
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
			/*
			 * pstmt.setString(1, mcVO.getProduct_idx()); pstmt.setString(2,
			 * mcVO.getProduct_idx());
			 */
			
			updateCnt=pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return updateCnt;
	}//updateReportC
}
