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
	public List<MemberVO> selectMember() throws SQLException{
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
			.append("	from member		");
			
			pstmt=con.prepareStatement(sb.toString());
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
	
	//차단 회원정보 가져오기 //이 부분 내일 다시 얘기하기...
	public List<ManagerBlockVO> selectBlockedMember() throws SQLException{
		List<ManagerBlockVO> list = new ArrayList<ManagerBlockVO>();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select id, (select name from member where id=mb.id) name, ")
			.append("(select blocked_reason from blocked_reason where br_idx=mb.br_idx) blocked_reason	")
			.append("	from manager_blocked	");
			
			pstmt=con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			
			ManagerBlockVO mbVO=null;
			while(rs.next()) {
				//수정
				//mVO=new MemberVO(rs.getString("id"),rs.getString("name"),
						//rs.getString("blocked_reason"),null);
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
	
	//아이디 검색으로 회원정보 가져오기
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
			.append("	select id, name, joined_date, birth	")
			.append("	from member	")
			.append("	where id like'%'||?||'%'	");
			
			pstmt=con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			pstmt.setString(1, id);
			
			MemberVO mVO=null;
			while(rs.next()) {
				mVO = new MemberVO();
				mVO.setId(rs.getString("id"));
				mVO.setName(rs.getString("name"));
				mVO.setJoined_date(rs.getDate("joined_date"));
				mVO.setBirth(rs.getString("birth"));
				
				list.add(mVO);
			}
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}//selectMember
	
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
			
			String insertBlock="insert into manager_blocked (br_idx,id,blocked_date) values(?,?,sysdate);";
			
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
