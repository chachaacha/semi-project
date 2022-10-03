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
		
	}//MyCommDAO

	public static MyCommDAO getInstance() {
		if( mcDAO == null ) {
			mcDAO = new MyCommDAO();
		}//end if
		return mcDAO;
	}//getInstance
	
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
			.append("	select	pc.id, pd.product_idx, pc.comment_idx, pc.reply_idx, pd.title, pc.contents, pc.posted_date	")
			.append("	from	product_comment pc, product pd																		")
			.append("	where	( pc.product_idx = pd.product_idx ) and id = ? and deleted = N									");
		
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, id);
		//5. 쿼리문 실행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			MyCommVO mcVO = null;
			
			while( rs.next() ) {
				mcVO = new MyCommVO();
				mcVO.setId(rs.getString("id"));
				mcVO.setProduct_idx(rs.getInt("product_idx"));
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
	
	public int updateMC(MyCommVO mcVO) throws SQLException {
		int updateCnt = 0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1. 드라이버로딩
				try {
				//2. Connection 얻기
					con = dc.getConn();
				//3. 쿼리문 생성객체 얻기
					StringBuilder updateCpEmp = new StringBuilder();
					updateCpEmp
					.append("	update	product_comment														")
					.append("	set			contents = ?, deleted = Y												")
					.append("	where		id = ?, product_idx = ?, comment_idx = ?, reply_idx = ?		");
					
					pstmt=con.prepareStatement(updateCpEmp.toString());
				//4. 바인드 변수에 값 설정
					pstmt.setString(1, mcVO.getRe_contents());
					pstmt.setString(2, mcVO.getId());
					pstmt.setInt(3, mcVO.getProduct_idx());
					pstmt.setInt(4, mcVO.getComment_idx());
					pstmt.setInt(5, mcVO.getReply_idx());
				//5. 쿼리문 수행 후 결과 얻기
					updateCnt =pstmt.executeUpdate();
				}finally {
				//6. 연결 끊기
					dc.dbClose(null, pstmt, con);
				}
				
				return updateCnt;
	}//updateMC
	
}//MyCommDAO
