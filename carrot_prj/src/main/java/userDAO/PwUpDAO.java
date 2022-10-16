package userDAO;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import userVO.PwUpVO;
import common.DbConnection;
import kr.co.sist.util.cipher.DataEncrypt;

public class PwUpDAO {
   private static PwUpDAO puDAO;
   private PwUpDAO() {
      
   }//PwUpDAO
   
   public static PwUpDAO getInstance() {
      if( puDAO == null ) {
         puDAO = new PwUpDAO();
      }//end if
      return puDAO;
   }//getInstance
   
   
   /**
    * 아이디와 비밀번호로 테이블 조회 후 기존 비밀번호를 새 비밀번호로 변경하는 일
    * @param puVO
    * @return
    * @throws SQLException
    */
   public int updatePw(PwUpVO puVO) throws SQLException{
      int updateCnt = 0;
      
      DbConnection dc = DbConnection.getInstance();
      
      Connection con = null;
      PreparedStatement pstmt = null;
      
      //1. 드라이버 로딩
      try {
      //2. Connection 얻기
         con = dc.getConn();
      //3. 쿼리문 생성 객체 얻기
         StringBuilder update = new StringBuilder();
         update
         .append("update   member            ")
         .append("set password   = ?      ")
         .append("where id = ? and password = ?   ");
         
         pstmt = con.prepareStatement(update.toString());
      //4. 바인드 변수에 값 설정
         //새 비밀번호를 암호화 해서 DB에 저장한다.
         pstmt.setString(1, DataEncrypt.messageDigest("SHA-1", puVO.getNew_pw()));
         pstmt.setString(2, puVO.getId());
         //기존 비밀번호와 입력한 비밀번호를 비교할 때 입력한 비밀번호도 암호화해서 맞는지 비교한다.
         pstmt.setString(3,  /*DataEncrypt.messageDigest("SHA-1",*/  puVO.getPassword());
         
         updateCnt=pstmt.executeUpdate();
         System.out.println(" updateCnt : " + updateCnt);
         
      //5. 쿼리문 수행 후 결과 얻기
         } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
         } finally {
      //6. 연결 끊기
         dc.dbClose(null, pstmt, con);
      }//end finally
      
      return updateCnt;
   }
   
}//PwUpDAO