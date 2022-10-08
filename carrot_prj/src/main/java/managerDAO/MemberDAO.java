package managerDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbConnection;
import managerVO.BlockReasonVO;
import managerVO.ManagerBlockVO;
import managerVO.MemberVO;

public class MemberDAO {
	private static MemberDAO mDAO;
	
	private MemberDAO() {

	}
	
	public static MemberDAO getInstance() {
		if(mDAO==null) {
			mDAO=new MemberDAO();
		}
		return mDAO;
	}//getInstance
	
	//전체 회원정보 가져오기
	public List<MemberVO> selectMember(String id) throws SQLException{
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select id, name, birth, joined_date	")
			.append("	from member		")
			.append("   where 1=1  ");
			if(id != null && !"".trim().equals(id)) {
				sb.append(" and id like '%'||?||'%' ");
			}
			pstmt=con.prepareStatement(sb.toString());
			if(id != null && !"".trim().equals(id)) {
				pstmt.setString(1, id);
			}
			rs=pstmt.executeQuery();
			
			MemberVO mVO=null;
			while(rs.next()) {
				mVO=new MemberVO();
				mVO.setId(rs.getString("id"));
				mVO.setName(rs.getString("name"));
				mVO.setBirth(rs.getString("birth"));
				mVO.setJoined_date(rs.getDate("joined_date"));
				list.add(mVO);
			}
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}//selectMember
	
	
	public List<ManagerBlockVO> selectBlockedMember(String id) throws SQLException{
		List<ManagerBlockVO> list = new ArrayList<ManagerBlockVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DbConnection db = DbConnection.getInstance();
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select mb.id, m.name, br.blocked_reason ")
			.append("   from member m, manager_blocked mb, blocked_reason br	")
			.append("   where (mb.id = m.id and  mb.br_idx = br.br_idx)  ");
			if(id != "") {
				sb.append(" and mb.id like '%'||?||'%' ");
			}
			pstmt=con.prepareStatement(sb.toString());
			if(id != "") {
				pstmt.setString(1, id);
			}
			rs=pstmt.executeQuery();
			
			ManagerBlockVO mbVO=null;
			while(rs.next()) {
				mbVO=new ManagerBlockVO();
				mbVO.setId(rs.getString("id"));
				mbVO.setName(rs.getString("name"));
				mbVO.setBlocked_reason(rs.getString("blocked_reason"));
				list.add(mbVO);
			}
		
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}//selectBlockedMember
	
	
	//차단사유 불러오기
	public List<BlockReasonVO> selectBlockReason() throws SQLException{
		List<BlockReasonVO> list = new ArrayList<BlockReasonVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select br_idx, blocked_reason	")
			.append("	from blocked_reason	");
			
			pstmt=con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			
			BlockReasonVO brVO=null;
			
			while(rs.next()) {
				brVO=new BlockReasonVO();
				brVO.setBr_idx(rs.getInt("br_idx"));
				brVO.setBlocked_reason(rs.getString("blocked_reason"));
				
				list.add(brVO);
			}
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	//차단 아이디 추가
	public void insertBlock(ManagerBlockVO mbVO) throws SQLException {
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			String insertBlock="insert into manager_blocked (br_idx,id) values(?,?)";
			
			pstmt=con.prepareStatement(insertBlock);
			pstmt.setInt(1, mbVO.getBr_idx());
			pstmt.setString(2, mbVO.getId());
			
			pstmt.execute();
		}finally {
			db.dbClose(null, pstmt, con);
		}//insertBlock
	}
	
	//차단 해제
	public int deleteBlock(String id) throws SQLException {
		int deleteCnt=0;
		
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			String deleteBlock="delete from manager_blocked where id=?";
			pstmt=con.prepareStatement(deleteBlock);
			
			pstmt.setString(1, id);
			
			deleteCnt=pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return deleteCnt;
	}//deleteBlock
}//class
