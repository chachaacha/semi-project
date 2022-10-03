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
			.append("	select	gu_idx, gu	")
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
			.append("	select	category_idx, category	")
			.append("	from	producty_category		");
			
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
	
	public List<ImgVO> selectImg() throws SQLException {
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
			.append("	select	product_idx, product_img, img_num	")
			.append("	from	product_img									");
			
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			rs = pstmt.executeQuery();
			
			ImgVO iVO = null;
			
			while( rs.next() ) {
				iVO = new ImgVO();
				iVO.setProduct_idx(rs.getInt("product_idx"));
				iVO.setProduct_img(rs.getString("product_img"));
				iVO.setImg_num(rs.getInt("img_num"));
				
				list.add(iVO);
			}
			
		//5. 쿼리문 생성 후 결과 얻기
		}finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}
	
	public List<PostVO> selectPost(PostVO pVO) throws SQLException {
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
			.append("	select pd.product_idx, lc.gu_idx, lc.gu, pc.category_idx, pc.categoly, pd.free, pd.price, pd.title, pd.contents	")
			.append("	from	product pd,   loc_category lc, product_category pc																")
			.append("	where (pd.gu_idx = lc.gu_idx and pd.categoly_idx = pc.categoly_idx ) and id = ? and product_idx = ?		");
		
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정.
			pstmt.setString(1, pVO.getId());
			pstmt.setInt(2, pVO.getProduct_idx());
		//5. 쿼리문 생성 후 결과 얻기.
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				pVO = new PostVO();
				pVO.setProduct_idx(rs.getInt("product_idx"));
				pVO.setGu(rs.getString("gu"));
				pVO.setCategory(rs.getString("category"));
				pVO.setFree(rs.getString("free"));
				pVO.setPrice(rs.getInt("price"));
				pVO.setTitle(rs.getString("title"));
				pVO.setContents(rs.getString("contents"));
				
				list.add(pVO);
			}
		} finally {
		//6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
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
			.append("	values(?, ?, ?)															");
			
			pstmt = con.prepareStatement(insert.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setInt(1, iVO.getProduct_idx());
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
			.append("	insert into product(gu_idx, category_idx, free, price, title, thumbnail, contents)		")
			.append("	value(?, ?, ?, ?, ?, ?, ?)																				");
		
			pstmt = con.prepareStatement(insert.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setInt(1, pVO.getGu_idx());
			pstmt.setInt(2, pVO.getCategory_idx());
			pstmt.setString(3, pVO.getFree());
			pstmt.setInt(4, pVO.getPrice());
			pstmt.setString(5, pVO.getTitle());
			pstmt.setString(6, pVO.getThumbnail());
			pstmt.setString(7, pVO.getContents());
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
		.append("	set			gu_idx = ?, category_idx = ?, free = ?, price = ?, title = ?, thumbnail = ?, contents = ?	")
		.append("	where		product_idx = ? 																						");
	
		pstmt = con.prepareStatement(update.toString());
	//4. 바인드 변수에 값 설정
		pstmt.setInt(1, pVO.getGu_idx());
		pstmt.setInt(2, pVO.getCategory_idx());
		pstmt.setString(3, pVO.getFree());
		pstmt.setInt(4, pVO.getPrice());
		pstmt.setString(5, pVO.getTitle());
		pstmt.setString(6, pVO.getThumbnail());
		pstmt.setString(7, pVO.getContents());
		pstmt.setInt(8, pVO.getProduct_idx());
	//5. 쿼리문 수행 후 결과 얻기
		updateCnt = pstmt.executeUpdate();
	} finally {
	//6. 연결 끊기
		dc.dbClose(null, pstmt, con);
	}//end finally
	
	return updateCnt;
}

public int deleteImg(int product_idx) throws SQLException {
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
		.append("	delete		from product_img	")
		.append("	where		product_idx = ?		");
		
		pstmt = con.prepareStatement(delete.toString());
		//4. 바인드 변수에 값 설정
		pstmt.setInt(1, product_idx);
		//5. 쿼리문 수행 후 결과 얻기
		deleteCnt = pstmt.executeUpdate();
	} finally {
		//6. 연결 끊기
		dc.dbClose(null, pstmt, con);
	}//end finally
	
	return deleteCnt;
}


	
}//PostDAO
