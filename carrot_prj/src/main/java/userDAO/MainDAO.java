package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbConnection;
import userVO.HomeVO;
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
	
	public List<HomeVO> selectProduct(MainFlagVO mfVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HomeVO> list = new ArrayList<>();
		try {
			con=db.getConn();
			StringBuffer sb = new StringBuffer();
			//항시실행
			sb.append("select tumbnail,title, price, gu, comment_cnt, liked_cnt ")
			  .append("from (select tumbnail,title, price, posted_date, free, gu_idx, category_idx,(select gu from loc_category where gu_idx = p.gu_idx) gu, comment_cnt, liked_cnt, row_number() over(order by liked_cnt desc) rank from product p) ")
			  .append("where 1=1 ")
			  .append("and rank between 1 and 16 ");
			
			if(mfVO.getKeyword() != "") {
				sb.append(" and title like '%'||?||'%' ");
			}
			
			//구 카테고리 드롭박스 선택시
			if(mfVO.getGuFlag() != -1) {
				sb.append(" and gu_idx=? ");
			}
			
			//상품카테고리 선택시
			if(mfVO.getCategoryFlag() != -1) {
				sb.append(" and category_idx=? ");
			}
			
			//가격 여부 선택시
			if(mfVO.getPriceFlag() != -1) {
				switch(mfVO.getPriceFlag()) {
				case 0: 
					break;
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
				default :
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
					sb.append(" order by posetd_date ");
					break;
				default : 
					sb.append(" order by liked_cnt desc ");
				}
			}
			
			pstmt = con.prepareStatement(sb.toString());
			
			//바인드 변수가 밀리는 현상?? 어떻게 처리? 모든 경우의 수에 맞게 처리~
			if(mfVO.getKeyword() != null ) { // 키워드만 검색
				pstmt.setString(1, mfVO.getKeyword());
				if(mfVO.getGuFlag() != -1) { // 키워드랑 구 선택
					pstmt.setInt(2, mfVO.getGuFlag());
					if(mfVO.getCategoryFlag() != -1) {// 키워드랑 구랑 카테고리랑 선택
						pstmt.setInt(3, mfVO.getCategoryFlag()); 
						if(mfVO.getPriceFlag() == 7) {// 키워드랑 구랑 카테고리랑 가격직접설정 선택까지
							pstmt.setInt(4, mfVO.getMinPrice());
							pstmt.setInt(5, mfVO.getMaxPrice());
						}
					} else if(mfVO.getPriceFlag() == 7) {// 키워드랑 구랑 가격설정직접설정 선택
						pstmt.setInt(3, mfVO.getMinPrice());
						pstmt.setInt(4, mfVO.getMaxPrice());
					}
				} else if(mfVO.getCategoryFlag() != -1) { //키워드랑 카테고리만 선택
					pstmt.setInt(2, mfVO.getCategoryFlag());
					if(mfVO.getPriceFlag() == 7) {//키워드랑 카테고리랑 가격직접설정 선택
						pstmt.setInt(3, mfVO.getMinPrice());
						pstmt.setInt(4, mfVO.getMaxPrice());
					}
				}
			} else if(mfVO.getGuFlag() != -1) { // 구만 선택
				pstmt.setInt(1, mfVO.getGuFlag());
				if(mfVO.getCategoryFlag() != -1) {// 구랑 카테고리만 선택
					pstmt.setInt(2, mfVO.getCategoryFlag()); 
					if(mfVO.getPriceFlag() == 7) {// 구랑 카테고리랑 가격직접설정 선택
						pstmt.setInt(3, mfVO.getMinPrice());
						pstmt.setInt(4, mfVO.getMaxPrice());
					}
				} else if(mfVO.getPriceFlag() == 7) {// 구랑 가격직접설정만 선택
					pstmt.setInt(2, mfVO.getMinPrice());
					pstmt.setInt(3, mfVO.getMaxPrice());
				}
			} else if(mfVO.getCategoryFlag() != -1) {// 카테고리만 선택
				pstmt.setInt(1, mfVO.getCategoryFlag()); 
				if(mfVO.getPriceFlag() == 7) { // 카테고리랑 가격 설정만 선택
					pstmt.setInt(2, mfVO.getMinPrice());
					pstmt.setInt(3, mfVO.getMaxPrice());
				}
			} else if(mfVO.getPriceFlag() == 7) { // 가격직접설정만 선택
				pstmt.setInt(1, mfVO.getMinPrice());
				pstmt.setInt(2, mfVO.getMaxPrice());
			}
			
			rs = pstmt.executeQuery();
			
			HomeVO hVO = null;
			while(rs.next()) {
				hVO = new HomeVO();
				hVO.setThumbnail(rs.getString("thunbnail"));
				hVO.setTitle(rs.getString("title"));
				hVO.setPrice(rs.getInt("price"));
				hVO.setGu(rs.getString("gu"));
				hVO.setComment_cnt(rs.getInt("comment_cnt"));
				hVO.setLiked_cnt(rs.getInt("liked_cnt"));
				list.add(hVO);
			}
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}
}
