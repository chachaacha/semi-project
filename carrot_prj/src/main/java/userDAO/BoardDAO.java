package userDAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbConnection;
import userVO.BoardVO;
import userVO.BuyVO;
import userVO.MyInfoVO;
import userVO.ReportBVO;
import userVO.ReportCVO;
import userVO.ReportVO;
import userVO.UserCommentVO;
import userVO.WishVO;

public class BoardDAO {
	private static BoardDAO bDAO;
	
	private BoardDAO() {
	
	}
	
	public static BoardDAO getInstance() {
		if(bDAO==null){
			bDAO=new BoardDAO();
		}
		return bDAO;
	}
	
	public BoardVO selectB(String product_idx) throws SQLException {
		BoardVO bVO=null;
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select pd.id, mb.nick, mb.img, lc.gu_idx, lc.gu, pd.title, pd.category_idx, pc.category, pd.reserved, pd.sold_check, ")
			.append("	pd.contents, pd.price, pd.liked_cnt, pd.product_idx, pd.report_cnt, pd.posted_date	")
			.append("	from member mb, product pd, loc_category lc, product_category pc	")
			.append("	where (pd.id=mb.id and pd.gu_idx=lc.gu_idx and pd.category_idx=pc.category_idx) and product_idx=?	");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, product_idx);
			rs=pstmt.executeQuery();
			
			//System.out.println("--query---"+ sb );
			//System.out.println("--value--- "+ product_idx );  
			
			if(rs.next()) {
				bVO=new BoardVO();
				bVO.setId(rs.getString("id"));
				bVO.setImg(rs.getString("img"));
				bVO.setNick(rs.getString("nick"));
				bVO.setGu(rs.getString("gu"));
				bVO.setTitle(rs.getString("title"));
				bVO.setCategory(rs.getString("category"));
				bVO.setContents(rs.getString("contents"));
				bVO.setPrice(rs.getInt("price"));
				bVO.setLiked_cnt(rs.getInt("liked_cnt"));
				bVO.setProduct_idx(rs.getString("product_idx"));
				bVO.setReport_cnt(rs.getInt("report_cnt"));
				bVO.setPosted_date(rs.getDate("posted_date"));
				bVO.setReserved(rs.getString("reserved"));
				bVO.setSold_check(rs.getString("sold_check"));
			}//end if
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return bVO;
	}//selectB
	
/*	//유저 닉네임
	public String selectN(String id) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		String str="";
		
		try {
			con=db.getConn();
			String insertWish = "select nick from member where id=? ";
			pstmt=con.prepareStatement(insertWish.toString());
			
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			//System.out.println("------조회:"+insertWish);
			//System.out.println("------조회:"+wVO);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				str=rs.getString(1);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return str;
	}//selectWish */
	
	//게시글 작성자 확인
	public int selectP(BoardVO bVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		int count=0;
		
		try {
			con=db.getConn();
			String insertWish = "select count(*) from product where id=? and product_idx=? ";
			pstmt=con.prepareStatement(insertWish.toString());
			
			pstmt.setString(1, bVO.getId());
			pstmt.setString(2, bVO.getProduct_idx());
			pstmt.executeUpdate();
			
			//System.out.println("------조회:"+insertWish);
			//System.out.println("------조회:"+wVO);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return count;
	}//selectWish
	
	//게시글 이미지 가져오기
	public List<String> selectImg(String product_idx) throws SQLException{
		List<String> list = new ArrayList<String>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		
		try {
			con=db.getConn();
			
			StringBuilder sb=new StringBuilder();
			sb
			.append("	select pi.product_img	")
			.append("	from product_img pi, product pd	")
			.append("	where ( pi.product_idx = pd.product_idx) and pd.product_idx = ?  ");
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, product_idx);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString("product_img"));
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}//selectImg
	
	//신고 팝업창에 신고사유 불러오기
	public List<ReportVO> selectReportB() throws SQLException{
		List<ReportVO> list = new ArrayList<ReportVO>();
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=db.getConn();
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select rr_idx, report_type, contents	")
			.append("	from report	")
			.append("	where report_type= 'A'	");
			
			pstmt=con.prepareStatement(sb.toString());
			
			rs=pstmt.executeQuery();
			
			ReportVO rVO=null;
			
			while(rs.next()) {
				rVO=new ReportVO();
				rVO.setRr_idx(rs.getInt("rr_idx"));
				rVO.setReport_type(rs.getString("report_type"));
				rVO.setContents(rs.getString("contents"));
				
				list.add(rVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}//selectReportB
	
	public void insertReportB(ReportBVO rbVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			String insertReportB = "insert into reported_board(id, nick, product_idx, rr_idx) values (?,?,?,?)";
			
			pstmt=con.prepareStatement(insertReportB);
			pstmt.setString(1, rbVO.getId());
			pstmt.setString(2, rbVO.getNick());
			pstmt.setString(3, rbVO.getProduct_idx());
			pstmt.setInt(4, rbVO.getRr_idx());
			
			pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
	}//insertReportB
	
	//신고사항 업데이트 해주기 
	public int updateReportB(ReportBVO rbVO) throws SQLException {
		int updateCnt=0;
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			StringBuilder updateReportB = new StringBuilder();
			updateReportB
			.append("	update product	")
			.append("	set reported_cnt=( select count(product_idx) from reported_board where product_idx=?)	")
			.append("	where product_idx=?	");
			
			pstmt=con.prepareStatement(updateReportB.toString());
			
			pstmt.setString(1, rbVO.getProduct_idx());
			pstmt.setString(2, rbVO.getProduct_idx());
			
			updateCnt=pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return updateCnt;
	}//updateReportB
	
	////////////////////////////////// 댓글 ////////////////////////////////
	
	//댓글 총 개수 
	public int selCountComm(String product_idx) throws SQLException{
		List<UserCommentVO> list = new ArrayList<UserCommentVO>();
		
		DbConnection db=DbConnection.getInstance();
		
		int count=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select count(*) ")
			.append("	from product_comment ")
			.append("	where product_idx = ? ");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, product_idx);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return count;
	}//selectComm
	
	//댓글 조회 
	public List<UserCommentVO> selectComm(UserCommentVO ucVO) throws SQLException{
		List<UserCommentVO> list = new ArrayList<UserCommentVO>();
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=db.getConn();
			
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select pc.comment_idx, pc.reply_idx, pc.product_idx, pc.id, m.nick, m.img, pc.contents, pc.posted_date, pc.deleted	")
			.append("	from product_comment pc, member m	")
			.append("	where  m.id=pc.id and product_idx = ? ");
			
			//정렬 라디오 선택시
			if(ucVO.getComment_flag() != -1) {
				switch(ucVO.getComment_flag()) {
				case 0:
					sb.append(" order by pc.comment_idx desc, pc.reply_idx, pc.posted_date ");
					break;
				case 1:
					sb.append(" order by pc.comment_idx asc, pc.reply_idx, pc.posted_date ");
				}
			}
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, ucVO.getProduct_idx());
			
			//System.out.println("------취소:"+sb);
			//System.out.println("------취소:"+ucVO);
			
			rs=pstmt.executeQuery();
			
			UserCommentVO cmVO=null;
			while(rs.next()) {
				cmVO=new UserCommentVO();
				cmVO.setComment_idx(rs.getInt("comment_idx"));
				cmVO.setReply_idx(rs.getInt("reply_idx"));
				cmVO.setProduct_idx(rs.getString("product_idx"));
				cmVO.setId(rs.getString("id"));
				cmVO.setNick(rs.getString("nick"));
				cmVO.setImg(rs.getString("img"));
				cmVO.setContents(rs.getString("contents"));
				cmVO.setPosted_date(rs.getDate("posted_date"));
				cmVO.setDeleted(rs.getString("deleted"));
				
				list.add(cmVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	
	}//selectComm
	
	//댓글 달기
	public void insertComm(UserCommentVO cVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			String insertComm="insert into product_comment(comment_idx, reply_idx, product_idx, id, contents) values ((select nvl(max(comment_idx),0)+1 from product_comment where product_idx=?),0,?,?, ?)";
			
			pstmt=con.prepareStatement(insertComm);
			
			pstmt.setString(1, cVO.getProduct_idx());
			pstmt.setString(2, cVO.getProduct_idx());
			pstmt.setString(3, cVO.getId());
			pstmt.setString(4, cVO.getContents());
			
			pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
		}
	}//insertComm
	
	//답글 달기
	public void insertReply(UserCommentVO cVO) throws SQLException {
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			String insertReply="insert into product_comment(comment_idx, reply_idx, product_idx ,id, contents) values (?,(select nvl(max(reply_idx),0)+1 from product_comment where product_idx=?),?,?,?)";
			
			pstmt=con.prepareStatement(insertReply);
			
			pstmt.setInt(1, cVO.getComment_idx());
			pstmt.setString(2, cVO.getProduct_idx());
			pstmt.setString(3, cVO.getProduct_idx());
			pstmt.setString(4, cVO.getId());
			pstmt.setString(5, cVO.getContents());
			
			pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
		}
	}//insertReply
	
	//댓글 수정
	public int updateComm(UserCommentVO cVO) throws SQLException {
		int updateCnt=0;
		DbConnection db = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			StringBuilder updateComm = new StringBuilder();
			updateComm
			.append("	update product_comment	")
			.append("	set contents=?	")
			.append("	where comment_idx=? and reply_idx=? and product_idx=?	");
			
			pstmt=con.prepareStatement(updateComm.toString());
			
			pstmt.setString(1, cVO.getNew_contents());
			pstmt.setInt(2, cVO.getComment_idx());
			pstmt.setInt(3, cVO.getReply_idx());
			pstmt.setString(4, cVO.getProduct_idx());
			
			updateCnt=pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return updateCnt;
	}//updateComm
	
	//댓글 수 업데이트
	public int updateCommCount(String product_idx) throws SQLException {
		int updateCnt=0;
		DbConnection db = DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			StringBuilder updateComm = new StringBuilder();
			updateComm
			.append("	update product	")
			.append("	set comment_cnt = (select count(product_idx) count from product_comment where product_idx=? )	")
			.append("	where product_idx= ?	");
			
			pstmt=con.prepareStatement(updateComm.toString());
			
			pstmt.setString(1, product_idx);
			pstmt.setString(2, product_idx);
			
			updateCnt=pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return updateCnt;
	}//updateComm
	
	//댓글 신고
	public void insertReport(ReportCVO rcVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			String insertReport="insert into reported_comment (id, nick, comment_idx, reply_idx, rr_idx) values(?, ?, ?, ?, ?)";
			
			pstmt=con.prepareStatement(insertReport);
			pstmt.setString(1, rcVO.getId());
			pstmt.setString(2, rcVO.getNick());
			pstmt.setInt(3, rcVO.getComment_idx());
			pstmt.setInt(4, rcVO.getReply_idx());
			pstmt.setInt(5, rcVO.getRr_idx());
			
			pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
	}//insertReport
	
	//댓글 신고시 신고 수 업데이트
	public int updateReportC(UserCommentVO cVO) throws SQLException {
		int updateCnt=0;
		DbConnection db = DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			StringBuilder updateReportC = new StringBuilder();
			updateReportC
			.append("	update product	")
			.append("	set comment_cnt = (select count(product_idx) from product_comment where product_idx=?)	")
			.append("	where product_idx=?	");
			
			pstmt=con.prepareStatement(updateReportC.toString());
			pstmt.setString(1, cVO.getProduct_idx());
			pstmt.setString(2, cVO.getProduct_idx());
			
			updateCnt=pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
		return updateCnt;
	}//updateReportC
	
	//댓글 삭제
	public int updateDropC(UserCommentVO cVO) throws SQLException {
		int updateCnt=0;
		DbConnection db = DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			StringBuilder updateDropC = new StringBuilder();
			updateDropC
			.append("	update product_comment	")
			.append("	set deleted= 'Y', contents=? ")
			.append("	where comment_idx=? and reply_idx=? and product_idx=? ");
			
			pstmt=con.prepareStatement(updateDropC.toString());
			pstmt.setString(1, cVO.getContents());
			pstmt.setInt(2, cVO.getComment_idx());
			pstmt.setInt(3, cVO.getReply_idx());
			pstmt.setString(4, cVO.getProduct_idx());
			
			System.out.println("------삭제:"+updateDropC);
			System.out.println("------삭제:"+cVO);
			
			updateCnt=pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
				
		return updateCnt;
	}//updateDropC

	////////////////////////관심목록///////////////////////
	
	//관심목록 수 조회
	public int selectWish(WishVO wVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		int count=0;
		
		try {
			con=db.getConn();
			String insertWish = "select count(*) from wish_list where id=? and product_idx=? ";
			pstmt=con.prepareStatement(insertWish.toString());
			pstmt.setString(1, wVO.getId());
			pstmt.setString(2, wVO.getProduct_idx());
			pstmt.executeUpdate();
			
			
			//System.out.println("------조회:"+insertWish);
			//System.out.println("------조회:"+wVO);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return count;
	}//selectWish
	
	//관심목록에 추가
	public void insertWish(WishVO wVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=db.getConn();
			String insertWish = "insert into wish_list (id, product_idx) values (?, ?)";
			pstmt=con.prepareStatement(insertWish.toString());
			pstmt.setString(1, wVO.getId());
			pstmt.setString(2, wVO.getProduct_idx());
			pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
		}
	}//insertWish
	
	//관심목록에서 제거
	public int deleteWish(WishVO wVO) throws SQLException {
		int deleteCnt=0;
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			String deleteWish = "delete from wish_list where id=? and product_idx=?";
			pstmt=con.prepareStatement(deleteWish);
			pstmt.setString(1, wVO.getId());
			pstmt.setString(2, wVO.getProduct_idx());
			
			deleteCnt=pstmt.executeUpdate();
			//System.out.println("------취소:"+deleteWish);
			//System.out.println("------취소:"+wVO);

			
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return deleteCnt;
 	}//deleteWish
	
	//관심 수 수정
	public String updateWishCnt(String product_idx) throws SQLException {
		String updateCnt="";
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn();
			
			StringBuilder updateWishCnt = new StringBuilder();
			updateWishCnt
			.append("	update product	")
			.append("	set liked_cnt = (select count(product_idx) from wish_list where product_idx=?)	")
			.append("	where product_idx=?	");
			
			pstmt=con.prepareStatement(updateWishCnt.toString());
			pstmt.setString(1, product_idx);
			pstmt.setString(2, product_idx);
			
			updateCnt=String.valueOf(pstmt.executeUpdate());
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return updateCnt;
	}//updateWishCnt

	////////////////////////거래완료 설정///////////////////////
	public List<UserCommentVO> selectTrader(UserCommentVO cVO) throws SQLException{
		List<UserCommentVO> list = new ArrayList<UserCommentVO>();
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=db.getConn();
			
			StringBuilder selectTrader = new StringBuilder();
			selectTrader
			.append("	select id, (select nick from member  where id=pc.id) nick	")
			.append("	from product_comment pc	")
			.append("	where  product_idx=? and comment_idx=? and reply_idx=?	")
			.append("   group by id, nick ");
			
			pstmt=con.prepareStatement(selectTrader.toString());
			
			pstmt.setString(1, cVO.getProduct_idx());
			pstmt.setInt(2, cVO.getComment_idx());
			pstmt.setInt(3, cVO.getReply_idx());
			
			rs=pstmt.executeQuery();
			
			UserCommentVO cmVO=null;
			while(rs.next()) {
				cmVO = new UserCommentVO();
				cmVO.setId(rs.getString("id"));
				cmVO.setNick(rs.getString("nick"));
				list.add(cmVO);
			}//end while
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}//selectTrader
	
	public int updateTrader(BuyVO bVO) throws SQLException {
		int updateCnt=0;
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=db.getConn();
			
			StringBuilder updateTrader = new StringBuilder();
			updateTrader
			.append("	update product 	")
			.append("	set sold_checked='Y' , buy_id=?	")
			.append("	where product_idx=? 	");
			
			pstmt=con.prepareStatement(updateTrader.toString());
			pstmt.setString(1,bVO.getBuy_id());
			pstmt.setString(2, bVO.getProduct_idx());
			
			updateCnt=pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return updateCnt;
	}//updateTrader
}//class
