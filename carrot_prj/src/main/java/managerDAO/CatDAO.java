package managerDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbConnection;
import managerVO.CatVO;

public class CatDAO {
	private static CatDAO cDAO;
	
	private CatDAO() {

	}
	
	public static CatDAO getInstance() {
		if(cDAO==null) {
			cDAO=new CatDAO();
		}
		return cDAO;
	}//getInstance
	
	//전체 카테고리 가져오기
	public List<CatVO> selectCat() throws SQLException{
		List<CatVO> list = new ArrayList<CatVO>();
	
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	
	DbConnection db = DbConnection.getInstance();
	try {
		con=db.getConn();
		
		StringBuilder sb = new StringBuilder();
		sb
		.append("	select category, category_idx	")
		.append("	from product_category	");
		
		pstmt=con.prepareStatement(sb.toString());
		
		rs=pstmt.executeQuery();
		
		CatVO cVO = null;
		while(rs.next()) {
			cVO=new CatVO();
			cVO.setCategory(rs.getString("category"));
			cVO.setCategory_idx(rs.getInt("category_idx"));
			
			list.add(cVO);
		}//end while
	}finally {
		db.dbClose(rs, pstmt, con);
	}
	return list;
	}//selectCat
	
	
	//카테고리 수정
	public int updateCat(CatVO cVO) throws SQLException {
		int updateCnt=0;
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("	update category	")
			.append("	set category=?	")
			.append("	where category_idx=?");
			
			pstmt=con.prepareStatement(sb.toString());
			
			pstmt.setString(1,cVO.getCategory());
			pstmt.setInt(2,cVO.getCategory_idx());
			
			updateCnt=pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}//end finally
		return updateCnt;
	}//updateCat
	
}//class
