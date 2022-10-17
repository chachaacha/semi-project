package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import userVO.BlockUVO;
import userVO.ProfilPVO;
import userVO.ProfilVO;
import userVO.ReportMVO;
import userVO.ReportVO;
import common.DbConnection;

public class ProfilDAO {

	private static ProfilDAO pDAO;
	
	private ProfilDAO() {
		
	}
	
	public static ProfilDAO getInstance() {
		if( pDAO == null ) {
			pDAO = new ProfilDAO();
		}//end if
		return pDAO;
	}//getInstance
	
	
	//사용자 기본 정보 가져오기
	public ProfilVO selectPp(String id) throws SQLException {
		ProfilVO pVO=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
				try {
				//2. Connection 얻기
					con = dc.getConn();
				//3. 쿼리문 생성객체 얻기
					StringBuilder selectCpEmp = new StringBuilder();
					selectCpEmp
					.append("	select id, img, nick, report_cnt	")
					.append("	from	member							")
					.append("	where id =?								");
					
					pstmt = con.prepareStatement(selectCpEmp.toString());
				//4. 바인드 변수에 값 설정
					pstmt.setString(1, id);
				//5. 쿼리문 생성 후 결과 얻기
					rs = pstmt.executeQuery(); // rs는 CURSOR의 제어권을 가지고 있다.
					
					if( rs.next() ) {
						pVO = new ProfilVO();
						pVO.setId(rs.getString("id"));
						pVO.setImg(rs.getString("img"));
						pVO.setNick(rs.getString("nick"));
						pVO.setReport_cnt(rs.getInt("report_cnt"));
					}
					
				} finally {
				//6. 연결 끊기.
					dc.dbClose(rs, pstmt, con);
				}//end finally
				
		return pVO;
	}//selectPp
	
	//상품 전체조회
	public List<ProfilPVO> selectPdAll(String id) throws SQLException {
		List<ProfilPVO> list = new ArrayList<ProfilPVO>();
		
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
			.append("	select	pd.id, pd.product_idx, pd.thumbnail, pd.title, lc.gu_idx, lc.gu, pd.posted_date, pd.reserved, pd.sold_check, pd.price	 	")
			.append("	from	product pd, loc_category lc																											")
			.append("	where	( pd.gu_idx = lc.gu_idx ) and id	=	?																																	");
			
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, id);
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 CURSOR의 제어권을 가지고 있다.
			
			ProfilPVO ppVO = null;
			
			while(	 rs.next() ) {	//	검색된 레코드의 수를 모르지만 모든 레코드를 저장하기 위해
				//검색된 레코드를 VO에 저장
				ppVO = new ProfilPVO();
				ppVO.setId(rs.getString("id"));
				ppVO.setProduct_idx(rs.getString("product_idx"));
				ppVO.setThumbnail(rs.getString("thumbnail"));
				ppVO.setTitle(rs.getString("title"));
				ppVO.setGu(rs.getString("gu"));
				ppVO.setPosted_date(rs.getDate("posted_date"));
				ppVO.setReserved(rs.getString("reserved"));
				ppVO.setSold_check(rs.getString("sold_check"));
				ppVO.setPrice(rs.getInt("price"));
				
				list.add(ppVO);
			}//end while
			
		} finally {
		//6. 연결 끊기.
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectPdAll
	
	//판매상품보기
	public List<ProfilPVO> selectSO(String id) throws SQLException {
		List<ProfilPVO> list = new ArrayList<ProfilPVO>();
		
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
			.append("	select	pd.id, pd.product_idx, pd.thumbnail, pd.title, lc.gu_idx, lc.gu, pd.posted_date, pd.reserved, pd.sold_check, pd.price	 	")
			.append("	from	product pd, loc_category lc																											")
			.append("	where	( pd.gu_idx = lc.gu_idx ) and id	=	? and 	sold_check = 'N'																			");
			
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, id);
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 CURSOR의 제어권을 가지고 있다.
			
			ProfilPVO pVO = null;
			
			while(	 rs.next() ) {	//	검색된 레코드의 수를 모르지만 모든 레코드를 저장하기 위해
				//검색된 레코드를 VO에 저장
				pVO = new ProfilPVO();
				pVO.setId(rs.getString("id"));
				pVO.setProduct_idx(rs.getString("product_idx"));
				pVO.setThumbnail(rs.getString("thumbnail"));
				pVO.setTitle(rs.getString("title"));
				pVO.setGu(rs.getString("gu"));
				pVO.setPosted_date(rs.getDate("posted_date"));
				pVO.setReserved(rs.getString("reserved"));
				pVO.setSold_check(rs.getString("sold_check"));
				pVO.setPrice(rs.getInt("price"));
				
				list.add(pVO);
			}//end while
			
		} finally {
		//6. 연결 끊기.
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectSO
	
	//거래완료 상품보기
	public List<ProfilPVO> selectPS(String id) throws SQLException {
		List<ProfilPVO> list = new ArrayList<ProfilPVO>();
		
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
			.append("	select	pd.id, pd.product_idx, pd.thumbnail, pd.title, lc.gu_idx, lc.gu, pd.posted_date, pd.reserved, pd.sold_check, pd.price	 	")
			.append("	from	product pd, loc_category lc																											")
			.append("	where	( pd.gu_idx = lc.gu_idx ) and id	=	? and 	sold_check = 'Y'																			");
			
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, id);
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 CURSOR의 제어권을 가지고 있다.
			
			ProfilPVO pVO = null;
			
			while(	 rs.next() ) {	//	검색된 레코드의 수를 모르지만 모든 레코드를 저장하기 위해
				//검색된 레코드를 VO에 저장
				pVO = new ProfilPVO();
				pVO.setId(rs.getString("id"));
				pVO.setProduct_idx(rs.getString("product_idx"));
				pVO.setThumbnail(rs.getString("thumbnail"));
				pVO.setTitle(rs.getString("title"));
				pVO.setGu(rs.getString("gu"));
				pVO.setPosted_date(rs.getDate("posted_date"));
				pVO.setReserved(rs.getString("reserved"));
				pVO.setSold_check(rs.getString("sold_check"));
				pVO.setPrice(rs.getInt("price"));
				
				list.add(pVO);
			}//end while
			
		} finally {
		//6. 연결 끊기.
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectSO
	
	//신고사유 불러오기
	public List<ReportVO> selectReport() throws SQLException{
		List<ReportVO> list = new ArrayList<ReportVO>();
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
			StringBuilder selectCpEmp = new StringBuilder();
			selectCpEmp
			.append("	select	rr_idx, report_type, contents	")
			.append("	from	report								")
			.append("	where	report_type =	'B'				");
			
			pstmt = con.prepareStatement(selectCpEmp.toString());
		//4. 바인드 변수에 값 설정
			
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 CURSOR의 제어권을 가지고 있다.
			
			ReportVO rVO = null;
			
			while(	 rs.next() ) {	//	검색된 레코드의 수를 모르지만 모든 레코드를 저장하기 위해
				rVO = new ReportVO();
				rVO.setRr_idx(rs.getInt("rr_idx"));
				rVO.setReport_type(rs.getString("report_type"));
				rVO.setContents(rs.getString("contents"));
				
				list.add(rVO);
			}//end while
			
		} finally {
		//6. 연결 끊기.
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectReport
	
	//차단하기
	public void insertReportM(ReportMVO pmVO) throws SQLException {
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		//1. 드라이버로딩
		try {
		//2. Connection 얻기
			con=dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			String insert= "insert into reported_member	(id, rr_idx, reported_id, reported_date) values(?,?,?,sysdate)";
			
			pstmt=con.prepareStatement(insert); // 쿼리문을 넣어 쿼리문 실행객체를 얻는다.
		//4. 바인드변수에 값 설정
			pstmt.setString(1, pmVO.getId());
			pstmt.setInt(2, pmVO.getRr_idx());
			pstmt.setString(3, pmVO.getReported_id());
		//5. 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
		} finally {
		//6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		}//end finally
		
	}//insertReportM
	
	//차단 수 업데이트
	public int updateRU(String id) throws SQLException {
		int updateCnt = 0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1. 드라이버로딩
		try {
		//2. Connection 얻기
				con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
				StringBuilder update = new StringBuilder();
				update
				.append("	update	member								")
				.append("	set			report_cnt = report_cnt +1	")
				.append("	where		id = ?									");
					
				pstmt=con.prepareStatement(update.toString());
		//4. 바인드 변수에 값 설정
				pstmt.setString(1, id);
		//5. 쿼리문 수행 후 결과 얻기
				updateCnt =pstmt.executeUpdate();
		}finally {
		//6. 연결 끊기
				dc.dbClose(null, pstmt, con);
		}
		
		return updateCnt;
	}//updateRU

//차단하기
public void insertBlock(BlockUVO buVO) throws SQLException {
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		//1. 드라이버로딩
		try {
		//2. Connection 얻기
			con=dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			String insert= "insert into user_blocked	(id, blocked_id, blocked_date) values(?,?,sysdate)";
			
			pstmt=con.prepareStatement(insert); // 쿼리문을 넣어 쿼리문 실행객체를 얻는다.
		//4. 바인드변수에 값 설정
			pstmt.setString(1, buVO.getId());
			pstmt.setString(2, buVO.getBlocked_id());
		//5. 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
		} finally {
		//6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		}//end finally
		
	}//insertBlock
	
}//ProfilDAO
