package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import userVO.MyCommVO;
import common.DbConnection;

public class MyCommDAO {
	private static MyCommDAO mcDAO;
	
	private MyCommDAO() {
	}

	public static MyCommDAO getInstance() {
		if( mcDAO == null ) {
			mcDAO = new MyCommDAO();
		}
		return mcDAO;
	}
	
	public List<MyCommVO> selectMC(String id, int pageFlag) throws SQLException {
		List<MyCommVO> list = new ArrayList<MyCommVO>();
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dc.getConn();
			StringBuilder select = new StringBuilder();
			select
			.append(" select pd.product_idx, pc.comment_idx, pc.reply_idx, pd.title, pc.contents, pc.posted_date ")
			.append(" from product_comment pc, product pd ")
			.append(" where ( pc.product_idx = pd.product_idx ) and pc.deleted = 'N' and pc.id = ? ")
			.append(" order by pc.posted_date desc ")
			.append(" offset (?-1)*10 rows")
			.append(" fetch next 10 rows only");
		
			pstmt = con.prepareStatement(select.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, pageFlag);
			rs = pstmt.executeQuery();
			
			MyCommVO mcVO = null;
			
			while( rs.next() ) {
				mcVO = new MyCommVO();
				mcVO.setProduct_idx(rs.getString("product_idx"));
				mcVO.setComment_idx(rs.getInt("comment_idx"));
				mcVO.setReply_idx(rs.getInt("reply_idx"));
				mcVO.setTitle(rs.getString("title"));
				mcVO.setContents(rs.getString("contents"));
				mcVO.setPosted_date(rs.getDate("posted_date"));
				
				list.add(mcVO);
			}
		} finally {
			dc.dbClose(rs, pstmt, con);
		}//finally
		return list;
	}//selectMC
	
	
	public int selectMCTotal(String id) throws SQLException {
		int total = 0;
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dc.getConn();
			StringBuilder select = new StringBuilder();
			select
			.append(" select count(*) count ")
			.append(" from product_comment pc, product pd ")
			.append(" where ( pc.product_idx = pd.product_idx ) and pc.deleted = 'N' and pc.id = ? ")
			.append(" order by pc.posted_date desc ");
		
			pstmt = con.prepareStatement(select.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				total = rs.getInt("count");
			}
		} finally {
			dc.dbClose(rs, pstmt, con);
		}//finally
		return total;
	}//selectMC
	
	
	
	
	/**
	 * 단일 값 삭제
	 * @param mcVO
	 * @return
	 * @throws SQLException
	 */
	public int updateDropMc(MyCommVO mcVO) throws SQLException {
		int resultCnt = 0;
		DbConnection dc = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dc.getConn();
			StringBuilder sb = new StringBuilder();
			sb
			.append("	update	product_comment	")
			.append("	set		contents = '댓글 작성자에 의해 삭제된 댓글입니다.', deleted = 'Y' ")
			.append("	where	product_idx = ? and comment_idx = ? and reply_idx = ? ");
					
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, mcVO.getProduct_idx());
			pstmt.setInt(2, mcVO.getComment_idx());
			pstmt.setInt(3, mcVO.getReply_idx());
			resultCnt =pstmt.executeUpdate();
			}finally {
				dc.dbClose(null, pstmt, con);
			}
			return resultCnt;
	}
	
	/**
	 * 복수의 값 삭제
	 * @param list
	 * @return
	 * @throws SQLException
	 */
	public int updateDropMultipleMc(List<MyCommVO> list) throws SQLException {
		int resultCnt = 0;
		DbConnection dc = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dc.getConn();
			StringBuilder sb = new StringBuilder();
			sb
			.append("	update	product_comment	")
			.append("	set		contents = '댓글 작성자에 의해 삭제된 댓글입니다.', deleted = 'Y' ")
			.append("	where	1=2 ");
			
			for(int i = 0; i < list.size(); i++) {
				sb.append(" or (product_idx = ? and comment_idx = ? and reply_idx = ?) ");
			}
			pstmt = con.prepareStatement(sb.toString());
					
			MyCommVO mcVO =null;
			int num = 0; //바인드변수 설정용
			for(int i = 0; i < list.size(); i++) { 
				mcVO= list.get(i);
				pstmt.setString(++num, mcVO.getProduct_idx());
				pstmt.setInt(++num, mcVO.getComment_idx());
				pstmt.setInt(++num, mcVO.getReply_idx());
			}
	
			resultCnt =pstmt.executeUpdate();
			}finally {
				dc.dbClose(null, pstmt, con);
			}
			return resultCnt;
	}
}
