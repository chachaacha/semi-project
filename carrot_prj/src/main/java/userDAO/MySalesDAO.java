package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import userVO.BuyVO;
import userVO.MySalesVO;
import common.DbConnection;

public class MySalesDAO {
	private static MySalesDAO msDAO;

	private MySalesDAO() {

	}// MySalesDAO

	public static MySalesDAO getInstance() {
		if (msDAO == null) {
			msDAO = new MySalesDAO();
		} // end if
		return msDAO;
	}// getInstance

	/**
	 * 입력 값에 따른 판매중인 게시글 전체 조회
	 * 
	 * @param msVO
	 * @return
	 * @throws SQLException
	 */
	public List<MySalesVO> selectSale(String id) throws SQLException {
		List<MySalesVO> list = new ArrayList<MySalesVO>();

		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 1. 드라이버 로딩
		try {
			// 2. Connection 얻기
			con = dc.getConn();
			// 3. 쿼리문 생성객체 얻기
			StringBuilder selectAll = new StringBuilder();
			selectAll.append(
					"	select p.id, p.product_idx, p.thumbnail, p.title, lc.gu_idx, lc.gu, p.posted_date, p.reserved, p.sold_check, p.price, p.comment_cnt, p.liked_cnt	")
					.append("	from	product p, loc_category lc																													")
					.append("	where	(p.gu_idx = lc.gu_idx) and id = ?	and sold_check = 'N'														");

			pstmt = con.prepareStatement(selectAll.toString());
			// 4. 바인드 변수 설정
			pstmt.setString(1, id);
			// 5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();

			MySalesVO mssVO = null;

			while (rs.next()) {
				mssVO = new MySalesVO();
				mssVO.setId(rs.getString("id"));
				mssVO.setProduct_idx(rs.getString("product_idx"));
				mssVO.setThumbnail(rs.getString("thumbnail"));
				mssVO.setTitle(rs.getString("title"));
				mssVO.setGu(rs.getString("gu"));
				mssVO.setPosted_date(rs.getDate("posted_date"));
				mssVO.setReserved(rs.getString("reserved"));
				mssVO.setSold_check(rs.getString("sold_check"));
				mssVO.setPrice(rs.getInt("price"));
				mssVO.setComment_cnt(rs.getInt("comment_cnt"));
				mssVO.setLiked_cnt(rs.getInt("liked_cnt"));

				list.add(mssVO);
			} // end while
		} finally {
			// 6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		} // end finally

		return list;
	}// selectSale


	/**
	 * 마이페이지 내의 판매중,거래완료, 관심목록 글을 삭제하는 method
	 * 
	 * @param product_idx
	 * @return
	 * @throws SQLException
	 */
	public int deleteBoard(MySalesVO msVO) throws SQLException { // 업데이트로 바꿔서 수정중입니다..
		int deleteCnt = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();
		// 1. 드라이버 로딩
		try {
			// 2. Connection 얻기
			con = dc.getConn();
			// 3. 쿼리문 생성객체 얻기
			StringBuilder delete = new StringBuilder();
			delete
			.append("delete	")
			.append("from	product			")
			.append("where product_idx = ?");

			pstmt = con.prepareStatement(delete.toString());
			// 4. 바인드 변수에 값 설정
			pstmt.setString(1, msVO.getProduct_idx());
			// 5. 쿼리문 수행 후 결과 얻기
			deleteCnt = pstmt.executeUpdate();

		} finally {
			// 6. 연결 끊기.
			dc.dbClose(null, pstmt, con);
		} // end finally

		return deleteCnt;
	}// deleteBoard

	public int updateReserved(MySalesVO msVO) throws SQLException {
		int updateCnt = 0;

		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;

		// 1. 드라이버 로딩
		try {
			// 2. Connection 얻기
			con = dc.getConn();
			// 3. 쿼리문 생성객체 얻기
			StringBuilder update = new StringBuilder();
			update.append("update	product			").append("set			reserved = ?		")
					.append("where		product_idx = ?	");

			pstmt = con.prepareStatement(update.toString());
			// 4. 바인드 변수에 값 설정
			pstmt.setString(1, msVO.getReserved());
			pstmt.setString(2, msVO.getProduct_idx());
			// 5. 쿼리문 수행 후 결과 얻기
			updateCnt = pstmt.executeUpdate();
		} finally {
			// 6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		} // end finally

		return updateCnt;
	}// updateResev

	/* 혹시 몰라서 남겨둠^~^ */

	/*
	 * public List<MySalesVO> selectTrader(String id) throws SQLException {
	 * List<MySalesVO> list = new ArrayList<MySalesVO>();
	 * 
	 * DbConnection dc = DbConnection.getInstance();
	 * 
	 * Connection con =null; PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * //1. 드라이버 로딩 try { //2. Connection 얻기 con = dc.getConn(); //3. 쿼리문 생성객체 얻기
	 * StringBuilder select = new StringBuilder(); select
	 * .append("	select p.id, p.product_idx, p.thumbnail, p.title, lc.gu_idx, lc.gu, p.posted_date, p.sold_check, p.price	, p.comment_cnt, p.liked_cnt "
	 * )
	 * .append("	from product p, loc_category lc																                                                        "
	 * )
	 * .append("	where	(p.gu_idx = lc.gu_idx) and id = ?	and sold_check = 'Y' 																				"
	 * );
	 * 
	 * pstmt = con.prepareStatement(select.toString()); //4. 바인드 변수에 값 설정
	 * pstmt.setString(1, id); //5. 쿼리문 생성 후 결과 얻기 rs = pstmt.executeQuery();
	 * 
	 * MySalesVO msVO = null;
	 * 
	 * while( rs.next() ) { msVO = new MySalesVO(); msVO.setId(rs.getString("id"));
	 * msVO.setProduct_idx(rs.getString("product_idx"));
	 * msVO.setThumbnail(rs.getString("thumbnail"));
	 * msVO.setTitle(rs.getString("title")); msVO.setGu(rs.getString("gu"));
	 * msVO.setPosted_date(rs.getDate("posted_date"));
	 * msVO.setSold_check(rs.getString("sold_check"));
	 * msVO.setComment_cnt(rs.getInt("comment_cnt"));
	 * msVO.setLiked_cnt(rs.getInt("liked_cnt")); msVO.setPrice(rs.getInt("price"));
	 * list.add(msVO); }//end while
	 * 
	 * } finally { //6. 연결끊기 dc.dbClose(rs, pstmt, con); }//end finally
	 * 
	 * return list; }//selectTrader
	 */
	public int updateTrader(BuyVO bVO) throws SQLException {
		int updateCnt = 0;

		DbConnection dc = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;

		// 1. 드라이버 로딩
		try {
			// 2. Connection 얻기
			con = dc.getConn();
			// 3. 쿼리문 생성객체 얻기
			StringBuilder update = new StringBuilder();
			update.append("	update	product							")
					.append("	set			buy_id = ? sold_check = Y	")
					.append("	where 	product_idx = ?					");

			pstmt = con.prepareStatement(update.toString());
			// 4. 바인드 변수에 값 설정
			pstmt.setString(1, bVO.getBuy_id());
			pstmt.setString(2, bVO.getProduct_idx());
			// 5. 쿼리문 수행 후 결과 얻기
		} finally {
			// .6 연결 끊기
			dc.dbClose(null, pstmt, con);
		}
		return updateCnt;
	}

	/*
	 * 거래완료된 상품을 불러오는 method
	 * 
	 * @param id
	 * 
	 * @return
	 * 
	 * @throws SQLException
	 */
	public List<MySalesVO> selectDealComplete(String id) throws SQLException {
		List<MySalesVO> list = new ArrayList<MySalesVO>();

		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 1. 드라이버 로딩
		try {
			// 2. Connection 얻기
			con = dc.getConn();
			// 3. 쿼리문 생성객체 얻기
			StringBuilder selectDC = new StringBuilder();
			selectDC.append(
					"	select p.id, p.product_idx, p.thumbnail, p.title, lc.gu_idx, lc.gu, p.posted_date, p.reserved, p.sold_check, p.price, p.comment_cnt, p.liked_cnt, p.buyer_id, p.purchased_date	")
					.append("	from	product p, loc_category lc																													")
					.append("	where	(p.gu_idx = lc.gu_idx) and id = ? 	and sold_check = 'Y' 																			");
			// 예약
			pstmt = con.prepareStatement(selectDC.toString());
			// 4. 바인드 변수 설정
			pstmt.setString(1, id);
			// 5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();

			MySalesVO msdcVO = null;

			while (rs.next()) {
				msdcVO = new MySalesVO();
				msdcVO.setId(rs.getString("id")); // 추가
				msdcVO.setProduct_idx(rs.getString("product_idx"));
				msdcVO.setThumbnail(rs.getString("thumbnail"));
				msdcVO.setTitle(rs.getString("title"));
				msdcVO.setGu(rs.getString("gu"));
				msdcVO.setPosted_date(rs.getDate("posted_date"));
				msdcVO.setReserved(rs.getString("reserved"));
				msdcVO.setSold_check(rs.getString("sold_check"));
				msdcVO.setPrice(rs.getInt("price"));
				msdcVO.setComment_cnt(rs.getInt("comment_cnt"));
				msdcVO.setLiked_cnt(rs.getInt("liked_cnt"));
				msdcVO.setBuyer_id(rs.getString("buyer_id")); // 추가
				msdcVO.setPurchased_date(rs.getDate("purchased_date")); // 추가

				list.add(msdcVO);
			} // end while
		} finally {
			// 6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		} // end finally

		return list;
	}// selectDealComplete

}// MySalesDAO
