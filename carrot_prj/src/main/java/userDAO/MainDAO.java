package userDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbConnection;
import userVO.CatVO;
import userVO.HomeVO;
import userVO.LocVO;
import userVO.MainFlagVO;

public class MainDAO {
	private static MainDAO mDAO;
	
	private MainDAO() {
		
	}
	
	public static MainDAO getInstance() {
		if(mDAO==null) {
			mDAO = new MainDAO();
		}
		return mDAO;
	}
	
	/**
	 * 구불러오기
	 * @return
	 * @throws SQLException
	 */
	public List<LocVO> selectGu() throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<LocVO> list = new ArrayList<>();
		try{
			con=db.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append(" select * ")
			  .append(" from loc_category ");
			  /*.append(" order by gu");*/
			pstmt= con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			LocVO lVO = null;
			while(rs.next()) {
				lVO = new LocVO();
				lVO.setGu_idx(rs.getInt("gu_idx"));
				lVO.setGu(rs.getString("gu"));
				list.add(lVO);
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}
	
	/**
	 * 카테고리 불러오기
	 * @return
	 * @throws SQLException
	 */
	public List<CatVO> selectCat() throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CatVO> list = new ArrayList<>();
		try{
			con=db.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append(" select * ")
			  .append(" from product_category ");
			pstmt= con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			CatVO cVO = null;
			while(rs.next()) {
				cVO = new CatVO();
				cVO.setCategory_idx(rs.getInt("category_idx"));
				cVO.setCategory(rs.getString("category"));
				list.add(cVO);
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}
	
	/**
	 * 단어검색 시 키워드에 추가
	 * @param keyword
	 * @throws SQLException
	 */
	public void insetKeyword(String keyword) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = db.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append(" insert into search(word) values(?) ");
			pstmt= con.prepareStatement(sb.toString());
			pstmt.setString(1, keyword);
			pstmt.executeUpdate();
		} finally {
			db.dbClose(null, pstmt, con);
		}
	}
	
	public List<String> selectBlock(String id) throws SQLException {
		List<String> list = new ArrayList<>();
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
			.append(" select blocked_id ")
			.append(" from user_blocked ")
			.append(" where id=? ");
		
			pstmt = con.prepareStatement(select.toString());
		//4. 바인드 변수에 값 설정
			pstmt.setString(1, id);
		//5. 쿼리문 실행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				list.add(rs.getString("blocked_id"));
			}
		} finally {
		//6. 연결 끊기.
			dc.dbClose(rs, pstmt, con);
		}//finally
		return list;
	}//selectMC
	
/*	public int test(List<String> bList) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		List<HomeVO> list = new ArrayList<>();
		try{                                                                                                                                                                                                                                                                                                                                           
			con=db.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append(" select count(*) ")
			.append("from (select thumbnail,title, price, posted_date, free, gu_idx, category_idx, id, (select gu from loc_category where gu_idx = p.gu_idx) gu, comment_cnt, liked_cnt, row_number() over(order by liked_cnt desc) rank, sold_check,  (select quit from member where id = p.id) quit from product p ) ")
			.append("where 1=1 and sold_check='N' and quit='N'");
			
			pstmt= con.prepareStatement(sb.toString());
			System.out.println("--test1---"+ sb );
			System.out.println("--test1--- "+ bList ); 
				for(int i=0; i<bList.size(); i++) {
					sb.append(" and not id=? ");
				}
			
			pstmt = con.prepareStatement(sb.toString());
			System.out.println("--test2---"+ sb );
			System.out.println("--test2--- "+ bList ); 
				
				for(int i1=0; i1<bList.size(); i1++) {
					pstmt.setString(i1+1, bList.get(i1));
				}
			
			//pstmt.setString(1, bList.get(0));
			//pstmt.setString(2, bList.get(1));
			
			System.out.println("--test3---"+ sb );
			System.out.println("--test3--- "+ bList );   
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return count;
	} */
	
	public int selectTotal(MainFlagVO mfVO, List<String> bList) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		List<HomeVO> list = new ArrayList<>();
		try{                                                                                                                                                                                                                                                                                                                                           
			con=db.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append(" select count(*) ")
			  .append("from (select thumbnail,title, price, posted_date, free, gu_idx, category_idx, id, (select gu from loc_category where gu_idx = p.gu_idx) gu, comment_cnt, liked_cnt, row_number() over(order by liked_cnt desc) rank, sold_check,  (select quit from member where id = p.id) quit from product p ) ")
			  .append("where 1=1 and sold_check='N' and quit='N'");

			  pstmt= con.prepareStatement(sb.toString());
			  
				
				for(int i=0; i<bList.size(); i++) {
					sb.append(" and not id=? ");
				}
			  
				if(mfVO.getKeyword() != null &&  !"".equals(mfVO.getKeyword())) {
					sb.append(" and title like '%'||trim(?)||'%' ");
				}
				
				//구 카테고리 드롭박스 선택시
				if(mfVO.getGuFlag() != 0) {
					sb.append(" and gu_idx=? ");
				}
				
				//상품카테고리 선택시
				if(mfVO.getCategoryFlag() != 0) {
					sb.append(" and category_idx=? ");
				}
				
				//가격 여부 선택시
				if(mfVO.getPriceFlag() != 0) {
					switch(mfVO.getPriceFlag()) {
					case 1:
						sb.append(" and free = 'Y' ");
						break;
					case 2: 
						sb.append(" and price < 5000 ");
						break;
					case 3:
						sb.append(" and price between 5000 and 10000 ");
						break;
					case 4:	
						sb.append(" and price between 10000 and 50000 ");
						break;
					case 5:	
						sb.append(" and price between 50000 and 100000 ");
						break;
					case 6:
						sb.append(" and price > 100000 ");
						break;
					case 7 :
						sb.append(" and price between ? and ? ");
					}
				}
				
				//정렬 라디오 선택시
				if(mfVO.getOrderByFlag() != -1) {
					switch(mfVO.getOrderByFlag()) {
					case 0:
						sb.append(" order by posted_date desc ");
						break;
					case 1:
						sb.append(" order by posted_date ");
						break;
					case 2: 
						sb.append(" order by liked_cnt desc ");
					}
				}
				
				pstmt = con.prepareStatement(sb.toString());
				
				int num=0;
				
				for(num=0; num<bList.size(); num++) {
					pstmt.setString(num+1, bList.get(num));
				}
				
				//바인드 변수가 밀리는 현상?? 어떻게 처리? 모든 경우의 수에 맞게 처리~
				if(mfVO.getKeyword() != null && !"".equals(mfVO.getKeyword() )  ) { // 키워드만 검색
					num++;
					pstmt.setString(num, mfVO.getKeyword());
					if(mfVO.getGuFlag() != 0) { // 키워드랑 구 선택
						num++;
						pstmt.setInt(num, mfVO.getGuFlag());
						if(mfVO.getCategoryFlag() != 0) {// 키워드랑 구랑 카테고리랑 선택
							num++;
							pstmt.setInt(num, mfVO.getCategoryFlag()); 
							if(mfVO.getPriceFlag() == 7) {// 키워드랑 구랑 카테고리랑 가격직접설정 선택까지
								num++;
								pstmt.setInt(num, mfVO.getMinPrice());
								num++;
								pstmt.setInt(num, mfVO.getMaxPrice());
							}
						} else if(mfVO.getPriceFlag() == 7) {// 키워드랑 구랑 가격설정직접설정 선택
							num++;
							pstmt.setInt(num, mfVO.getMinPrice());
							num++;
							pstmt.setInt(num, mfVO.getMaxPrice());
						}
					} else if(mfVO.getCategoryFlag() != 0) { //키워드랑 카테고리만 선택
						num++;
						pstmt.setInt(num, mfVO.getCategoryFlag());
						if(mfVO.getPriceFlag() == 7) {//키워드랑 카테고리랑 가격직접설정 선택
							num++;
							pstmt.setInt(num, mfVO.getMinPrice());
							num++;
							pstmt.setInt(num, mfVO.getMaxPrice());
						}
					}
				} else if(mfVO.getGuFlag() != 0) { // 구만 선택
					num++;
					pstmt.setInt(num, mfVO.getGuFlag());
					if(mfVO.getCategoryFlag() != 0) {// 구랑 카테고리만 선택
						num++;
						pstmt.setInt(num, mfVO.getCategoryFlag()); 
						if(mfVO.getPriceFlag() == 7) {// 구랑 카테고리랑 가격직접설정 선택
							num++;
							pstmt.setInt(num, mfVO.getMinPrice());
							num++;
							pstmt.setInt(num, mfVO.getMaxPrice());
						}
					} else if(mfVO.getPriceFlag() == 7) {// 구랑 가격직접설정만 선택
						num++;
						pstmt.setInt(num, mfVO.getMinPrice());
						num++;
						pstmt.setInt(num, mfVO.getMaxPrice());
					}
				} else if(mfVO.getCategoryFlag() != 0) {// 카테고리만 선택
					num++;
					pstmt.setInt(num, mfVO.getCategoryFlag()); 
					if(mfVO.getPriceFlag() == 7) { // 카테고리랑 가격 설정만 선택
						num++;
						pstmt.setInt(num, mfVO.getMinPrice());
						num++;
						pstmt.setInt(num, mfVO.getMaxPrice());
					}
				} else if(mfVO.getPriceFlag() == 7) { // 가격직접설정만 선택
					System.out.println("--------------값 : "+mfVO );
					num++;
					pstmt.setInt(num, mfVO.getMinPrice());
					num++;
					pstmt.setInt(num, mfVO.getMaxPrice());
				} 
				
				//System.out.println("--query---"+ sb );
				//System.out.println("--value--- "+ mfVO );   
				
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return count;
	}
	
	public List<HomeVO> selectProduct(MainFlagVO mfVO, List<String> bList) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HomeVO> list = new ArrayList<>();
		try {
			con=db.getConn();
			StringBuffer sb = new StringBuffer();
			//항시실행
			sb.append("select thumbnail,title, price, gu, comment_cnt, liked_cnt, product_idx ")
			  .append("from (select thumbnail,title, price, posted_date, free, gu_idx, category_idx, id, (select gu from loc_category where gu_idx = p.gu_idx) gu, comment_cnt, liked_cnt, row_number() over(order by liked_cnt desc) rank, product_idx, sold_check, (select quit from member where id = p.id) quit from product p ) ")
			  .append("where 1=1 and sold_check='N' and quit='N' ");
			  /*.append("and rank between ((?-1)*16)+(?-(?*1-1)) and ((?-1)*16)+16 ");*/
			
			for(int i=0; i<bList.size(); i++) {
				sb.append(" and not id=? ");
			}
			
			/* System.out.println("-----keyword-------"+ mfVO.getKeyword()); */
			if(mfVO.getKeyword() != null &&  !"".equals(mfVO.getKeyword())) {
				sb.append(" and title like '%'||trim(?)||'%' ");
			}
			
			//구 카테고리 드롭박스 선택시
			if(mfVO.getGuFlag() != 0) {
				sb.append(" and gu_idx=? ");
			}
			
			//상품카테고리 선택시
			if(mfVO.getCategoryFlag() != 0) {
				sb.append(" and category_idx=? ");
			}
			
			//가격 여부 선택시
			if(mfVO.getPriceFlag() != 0) {
				switch(mfVO.getPriceFlag()) {
				case 1:
					sb.append(" and free = 'Y' ");
					break;
				case 2: 
					sb.append(" and price < 5000 ");
					break;
				case 3:
					sb.append(" and price between 5000 and 10000 ");
					break;
				case 4:	
					sb.append(" and price between 10000 and 50000 ");
					break;
				case 5:	
					sb.append(" and price between 50000 and 100000 ");
					break;
				case 6:
					sb.append(" and price > 100000 ");
					break;
				case 7 :
					sb.append(" and price between ? and ? ");
				}
			}
			
			//정렬 라디오 선택시
			if(mfVO.getOrderByFlag() != -1) {
				switch(mfVO.getOrderByFlag()) {
				case 0:
					sb.append(" order by posted_date desc ");
					break;
				case 1:
					sb.append(" order by posted_date ");
					break;
				case 2: 
					sb.append(" order by liked_cnt desc ");
					break;
				case 3: 
					sb.append(" order by comment_cnt desc ");
				}
			}
												// order by 필수, 같이 쓰임
			sb.append("offset  ((?-1)*16) rows ") // ? (=(pageFlag-1)*16) 에서부터
			  .append("fetch next 16 rows only "); // 16개의 데이터를 보고싶다 ex) 0 < 한페이지에 보여줄 카드의 수 <= 16 
			
			pstmt = con.prepareStatement(sb.toString());
			
			
			int num=0;
			
			for(num=0; num<bList.size(); num++) {
				pstmt.setString(num+1, bList.get(num));
			}
			
			//바인드 변수가 밀리는 현상?? 어떻게 처리? 모든 경우의 수에 맞게 처리~
			if(mfVO.getKeyword() != null && !"".equals(mfVO.getKeyword() )  ) { // 키워드만 검색
				num++;
				pstmt.setString(num, mfVO.getKeyword());
				if(mfVO.getGuFlag() != 0) { // 키워드랑 구 선택
					num++;
					pstmt.setInt(num, mfVO.getGuFlag());
					if(mfVO.getCategoryFlag() != 0) {// 키워드랑 구랑 카테고리랑 선택
						num++;
						pstmt.setInt(num, mfVO.getCategoryFlag()); 
						if(mfVO.getPriceFlag() == 7) {// 키워드랑 구랑 카테고리랑 가격직접설정 선택까지
							num++;
							pstmt.setInt(num, mfVO.getMinPrice());
							num++;
							pstmt.setInt(num, mfVO.getMaxPrice());
						}
					} else if(mfVO.getPriceFlag() == 7) {// 키워드랑 구랑 가격설정직접설정 선택
						num++;
						pstmt.setInt(num, mfVO.getMinPrice());
						num++;
						pstmt.setInt(num, mfVO.getMaxPrice());
					}
				} else if(mfVO.getCategoryFlag() != 0) { //키워드랑 카테고리만 선택
					num++;
					pstmt.setInt(num, mfVO.getCategoryFlag());
					if(mfVO.getPriceFlag() == 7) {//키워드랑 카테고리랑 가격직접설정 선택
						num++;
						pstmt.setInt(num, mfVO.getMinPrice());
						num++;
						pstmt.setInt(num, mfVO.getMaxPrice());
					}
				}
			} else if(mfVO.getGuFlag() != 0) { // 구만 선택
				num++;
				pstmt.setInt(num, mfVO.getGuFlag());
				if(mfVO.getCategoryFlag() != 0) {// 구랑 카테고리만 선택
					num++;
					pstmt.setInt(num, mfVO.getCategoryFlag()); 
					if(mfVO.getPriceFlag() == 7) {// 구랑 카테고리랑 가격직접설정 선택
						num++;
						pstmt.setInt(num, mfVO.getMinPrice());
						num++;
						pstmt.setInt(num, mfVO.getMaxPrice());
					}
				} else if(mfVO.getPriceFlag() == 7) {// 구랑 가격직접설정만 선택
					num++;
					pstmt.setInt(num, mfVO.getMinPrice());
					num++;
					pstmt.setInt(num, mfVO.getMaxPrice());
				}
			} else if(mfVO.getCategoryFlag() != 0) {// 카테고리만 선택
				num++;
				pstmt.setInt(num, mfVO.getCategoryFlag()); 
				if(mfVO.getPriceFlag() == 7) { // 카테고리랑 가격 설정만 선택
					num++;
					pstmt.setInt(num, mfVO.getMinPrice());
					num++;
					pstmt.setInt(num, mfVO.getMaxPrice());
				}
			} else if(mfVO.getPriceFlag() == 7) { // 가격직접설정만 선택
				System.out.println("--------------값 : "+mfVO );
				num++;
				pstmt.setInt(num, mfVO.getMinPrice());
				num++;
				pstmt.setInt(num, mfVO.getMaxPrice());
			} 
			
			//무조건 pagFlag는 기본값 1을 넣어줌, 경우에 따라(정렬이 추가될때마다) +1씩 증가
			num++;
			pstmt.setInt(num, mfVO.getPageFlag());
			
			//System.out.println("--query---"+ sb );
			//System.out.println("--value--- "+ mfVO );  
					
			rs = pstmt.executeQuery();
			HomeVO hVO = null;
			while(rs.next()) {
				hVO = new HomeVO();
				hVO.setThumbnail(rs.getString("thumbnail"));
				hVO.setTitle(rs.getString("title"));
				hVO.setPrice(rs.getInt("price"));
				hVO.setGu(rs.getString("gu"));
				hVO.setComment_cnt(rs.getInt("comment_cnt"));
				hVO.setLiked_cnt(rs.getInt("liked_cnt"));
				hVO.setProduct_idx(rs.getString("product_idx"));
				list.add(hVO);
			}
			/* System.out.println( "--prd size--"+list.size() ); */
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}
}
