package managerDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbConnection;

public class LocDAO {
	private static LocDAO lDAO;
	
	private LocDAO() {

	}
	
	public static LocDAO getInstance() {
		if(lDAO==null) {
			lDAO=new LocDAO();
		}
		
		return lDAO;
	}//getInstance
	
	//전체 구 가져오기
	public List<String> selectLoc() throws SQLException{
		List<String> list = new ArrayList<String>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select gu	")
			.append("	from loc_category	");
			
			pstmt=con.prepareStatement(sb.toString());
			
			rs=pstmt.executeQuery();
			
			list.add(rs.getString("gu"));
		}finally {
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectLoc
}
