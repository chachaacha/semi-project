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
	
	public List<MyCommVO> selectMC(String id) throws SQLException {
		List<MyCommVO> list = new ArrayList<MyCommVO>();
		
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
			.append(" select pd.product_idx, pc.comment_idx, pc.reply_idx, pd.title, pc.contents, pc.posted_date ")
			.append(" from product_comment pc, product pd ")
			.append(" where ( pc.product_idx = pd.product_idx ) and pc.deleted = 'N' and pc.id = ? ")
			.append(" order by pc.posted_date desc ");
		
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, id);
		//5. 쿼리문 실행 후 결과 얻기
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
		//6. 연결 끊기.
			dc.dbClose(rs, pstmt, con);
		}//finally
		return list;
	}//selectMC
	
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
			.append("	where	product_idx = ?, comment_idx = ?, reply_idx = ? ");
					
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
}
