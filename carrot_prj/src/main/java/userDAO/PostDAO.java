package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import userVO.CatVO;
import userVO.ImgVO;
import userVO.LocVO;
import userVO.PostVO;
import common.DbConnection;

public class PostDAO {
	private static PostDAO pDAO;
	
	private PostDAO() {
		
	}//PostDAO
	
	public static PostDAO getInstance() {
		if( pDAO == null) {
			pDAO = new PostDAO();
		}
		return pDAO;
	}//getInstance
	
	
	public List<LocVO> selectLoc() throws SQLException {
		List<LocVO> list = new ArrayList<LocVO>();
		
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
			.append("	select	*	")
			.append("	from	loc_category	");
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			
			LocVO lVO = null;
			
			while( rs.next() ) {
				lVO = new LocVO();
				lVO.setGu_idx(rs.getInt("gu_idx"));
				lVO.setGu(rs.getString("gu"));
				
				list.add(lVO);
			}
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	public List<CatVO> selectCat() throws SQLException {
		List<CatVO> list = new ArrayList<CatVO>();
		
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
			.append("	select	*	")
			.append("	from	product_category		");
			
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			
			CatVO cVO = null;
			
			while( rs.next() ) {
				cVO = new CatVO();
				cVO.setCategory_idx(rs.getInt("category_idx"));
				cVO.setCategory(rs.getString("category"));
				
				list.add(cVO);
			}
			
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}
	
	public List<ImgVO> selectImg(String product_idx) throws SQLException {
		List<ImgVO> list = new ArrayList<ImgVO>();
		
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
			.append("	select	product_idx, product_img, img_num						")
			.append("	from	product_img														")
			.append("	where product_idx = ?	 order by img_num asc					");
			
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, product_idx);
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			
			ImgVO iVO = null;
			
			while( rs.next() ) {
				iVO = new ImgVO();
				iVO.setProduct_idx(rs.getString("product_idx"));
				iVO.setProduct_img(rs.getString("product_img"));
				iVO.setImg_num(rs.getInt("img_num"));
				
				list.add(iVO);
			}
			
		}finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}
	
	public String selectIdx(String product_idx) throws SQLException{
		String idx="";
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성 후 객체 얻기
			StringBuilder select = new StringBuilder();
			select
			.append("	select product_idx		")
			.append("	from product			")
			.append("	where product_idx=?	");
			
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정.
			pstmt.setString(1, product_idx);
		//5. 쿼리문 생성 후 결과 얻기
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				idx = rs.getString("product_idx");
			}//end if
			
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}
		
		return idx;
	}
	
	
	public PostVO selectPost(PostVO pVO) throws SQLException {
		List<PostVO> list = new ArrayList<PostVO>();
		
		DbConnection dc= DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder select = new StringBuilder();
			select
			.append("	select product_idx, gu_idx, category_idx, free, price, title, contents					")
			.append("	from	product																					")
			.append("	where id = ? and product_idx = ?													");
		
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정.
			pstmt.setString(1, pVO.getId());
			pstmt.setString(2, pVO.getProduct_idx());
		//5. 쿼리문 생성 후 결과 얻기.
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				pVO = new PostVO();
				pVO.setProduct_idx(rs.getString("product_idx"));
				pVO.setGu_idx(rs.getInt("gu_idx"));
				pVO.setCategory_idx(rs.getInt("category_idx"));
				pVO.setFree(rs.getString("free"));
				pVO.setPrice(rs.getInt("price"));
				pVO.setTitle(rs.getString("title"));
				pVO.setContents(rs.getString("contents"));
				
			}
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return pVO;
	}
	
	public void insertImg(ImgVO iVO) throws SQLException{
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder insert = new StringBuilder();
			insert
			.append("	insert into product_img(product_idx, product_img, img_num)	")
			.append("	values(?, ?, ?) 															");
			
			pstmt = con.prepareStatement(insert.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, iVO.getProduct_idx());
			pstmt.setString(2, iVO.getProduct_img());
			pstmt.setInt(3, iVO.getImg_num());
		//5. 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
		} finally {
		//6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		}//end finally
		
	}
	
public void insertPost(PostVO pVO) throws SQLException{
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1. 드라이버 로딩
		try {
		//2. Connection 얻기
			con = dc.getConn();
		//3. 쿼리문 생성 객체 얻기
			StringBuilder insert = new StringBuilder();
			insert
			.append("	insert into product(product_idx, gu_idx, category_idx, free, price, title, contents, id)			")
			.append("	values( ?, ?, ?, ?, ?, ?, ?, ?)																					");
		
			pstmt = con.prepareStatement(insert.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, pVO.getProduct_idx());
			pstmt.setInt(2, pVO.getGu_idx());
			pstmt.setInt(3, pVO.getCategory_idx());
			pstmt.setString(4, pVO.getFree());
			pstmt.setInt(5, pVO.getPrice());
			pstmt.setString(6, pVO.getTitle());
			pstmt.setString(7, pVO.getContents());
			pstmt.setString(8, pVO.getId());
		//5. 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
		} finally {
		//6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		}//end finally
		
	}

public int updatePost(PostVO pVO) throws SQLException {
	int updateCnt = 0;
	
	DbConnection dc = DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	
	//1. 드라이버 로딩
	try {
	//2. Connection 얻기
		con = dc.getConn();
	//3. 쿼리문 생성객체 얻기
		StringBuilder update = new StringBuilder();
		update
		.append("	update	product																									")
		.append("	set			gu_idx = ?, category_idx = ?, free = ?, price = ?, title = ?, contents = ?	")
		.append("	where		product_idx = ? 																						");
	
		pstmt = con.prepareStatement(update.toString());
	//4. 바인드 변수에 값 설정
		pstmt.setInt(1, pVO.getGu_idx());
		pstmt.setInt(2, pVO.getCategory_idx());
		pstmt.setString(3, pVO.getFree());
		pstmt.setInt(4, pVO.getPrice());
		pstmt.setString(5, pVO.getTitle());
		pstmt.setString(6, pVO.getContents());
		pstmt.setString(7, pVO.getProduct_idx());
	//5. 쿼리문 수행 후 결과 얻기
		updateCnt = pstmt.executeUpdate();
	} finally {
	//6. 연결 끊기
		dc.dbClose(null, pstmt, con);
	}//end finally
	
	return updateCnt;
}

public int updateThumbnail(PostVO pVO) throws SQLException {
	int updateCnt = 0;
	
	DbConnection dc = DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	
	//1. 드라이버 로딩
	try {
		//2. Connection 얻기
		con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
		StringBuilder update = new StringBuilder();
		update
		.append("	update	product				")
		.append("	set			thumbnail = ?		")
		.append("	where		product_idx = ? 	");
		
		pstmt = con.prepareStatement(update.toString());
		//4. 바인드 변수에 값 설정
		pstmt.setString(1, pVO.getThumbnail());
		pstmt.setString(2, pVO.getProduct_idx());
		//5. 쿼리문 수행 후 결과 얻기
		updateCnt = pstmt.executeUpdate();
	} finally {
		//6. 연결 끊기
		dc.dbClose(null, pstmt, con);
	}//end finally
	
	return updateCnt;
}

public int deleteImg(ImgVO iVO) throws SQLException {
	int deleteCnt = 0;
	
	DbConnection dc = DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	
	//1. 드라이버 로딩
	try {
		//2. Connection 얻기
		con = dc.getConn();
		//3. 쿼리문 생성객체 얻기
		StringBuilder delete = new StringBuilder();
		delete
		.append("	delete		from product_img						")
		.append("	where		product_idx = ? and img_num = ? 	");
		
		pstmt = con.prepareStatement(delete.toString());
		//4. 바인드 변수에 값 설정
		pstmt.setString(1, iVO.getProduct_idx());
		pstmt.setInt(2, iVO.getImg_num());
		//5. 쿼리문 수행 후 결과 얻기
		deleteCnt = pstmt.executeUpdate();
	} finally {
		//6. 연결 끊기
		dc.dbClose(null, pstmt, con);
	}//end finally
	
	return deleteCnt;
}
}//PostDAO
