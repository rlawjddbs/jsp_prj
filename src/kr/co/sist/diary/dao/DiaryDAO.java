package kr.co.sist.diary.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.sist.diary.vo.DiaryDetailVO;
import kr.co.sist.diary.vo.DiaryListVO;
import kr.co.sist.diary.vo.DiaryRemoveVO;
import kr.co.sist.diary.vo.DiaryUpdateVO;
import kr.co.sist.diary.vo.DiaryVO;
import kr.co.sist.diary.vo.MonthVO;
import kr.co.sist.diary.vo.SearchDataVO;

public class DiaryDAO {
	private static DiaryDAO d_dao;
	
	private DiaryDAO() {
	} // DiaryDAO
	
	public static DiaryDAO getInstance() {
		if(d_dao == null) {
			d_dao = new DiaryDAO();
		} // end if
		return d_dao;
	} // getInstance
	
	private Connection getConn() throws SQLException{
		Connection con = null;
		
		try {
			// 1. JNDI 사용객체 생성
			Context ctx = new InitialContext();
			// 2. DBCP에 저장된 DataSource 얻기
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jsp_dbcp");
			// 3. Connection 얻기
			con = ds.getConnection();
		} catch (NamingException ne) {
			ne.printStackTrace();
		} // end catch
		
		return con;
	} // getConn
	
	/**
	 * 년, 월을 입력받아 해당 월의 모든 일자의 글번호, 제목을 가변배열에 저장하여
	 * 반환하는 일
	 * @param year 년
	 * @param month 월
	 * @return 가변배열
	 * @throws SQLException
	 */
	public MonthVO[][] selectMonthEvent(String year, String month) throws SQLException{
		MonthVO[][] mv = new MonthVO[31][];
		
		return mv;
	} // selectMonthEvent
	
	/**
	 * 이벤트 추가
	 * @param d_vo
	 * @throws SQLException
	 */
	public void insertEvent(DiaryVO d_vo) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
		// 1.
		// 2.
		// 3.
			con = getConn();
		// 4.
			StringBuilder insertEvt = new StringBuilder();
			insertEvt.append("INSERT INTO DIARY(NUM, WRITER, SUBJECT, CONTENTS, E_YEAR, E_MONTH, E_DAY, PASS, IP)")
			.append("VALUES( seq_diary.nextval, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			pstmt = con.prepareStatement(insertEvt.toString());
			pstmt.setString(1, d_vo.getWriter());
			pstmt.setString(2, d_vo.getSubject());
			pstmt.setString(3, d_vo.getContents());
			pstmt.setString(4, d_vo.getE_year());
			pstmt.setString(5, d_vo.getE_month());
			pstmt.setString(6, d_vo.getE_day());
			pstmt.setString(7, d_vo.getPass());
			pstmt.setString(8, d_vo.getIp());
		// 5.
			pstmt.executeUpdate();
			
		} finally {
			// 6.
			if( pstmt != null ) { pstmt.close(); } // end if 
			if( con != null ) { con.close(); } // end if 
		} // end finally
	} // insertEvent
	
	/**
	 * 글 번호를 입력받아 해당 이벤트의 상세 정보 조회
	 * @param num
	 * @return
	 * @throws SQLException
	 */
	public DiaryDetailVO selectDetailEvent(int num) throws SQLException{
		DiaryDetailVO ddv =null;
		
		return ddv;
	} // selectDetailEvent
	
	
	/**
	 * 
	 * 글 번호, 내용, 비밀번호를 입력받아 비밀번호가 일치하면 해당 글번호의 이벤트 내용을 
	 * 변경하는 일.
	 * @param du_vo
	 * @return
	 * @throws SQLException
	 */
	public int updateEvent(DiaryUpdateVO du_vo) throws SQLException{
		int cnt=0;
		
		return cnt;
	} // updateEvent
	
	/**
	 * 글 번호, 비밀번호를 입력받아 해당 글을 삭제하는 일
	 * @param dr_vo
	 * @return
	 * @throws SQLException
	 */
	public int deleteEvent(DiaryRemoveVO dr_vo) throws SQLException{
		int cnt =0;
		
		return cnt;
	} // deleteEvent
	
	/**
	 * 게시판의 리스트 형식으로 조회하는 일
	 * @param sd_vo
	 * @return
	 * @throws SQLException
	 */
	public List<DiaryListVO> selectList(SearchDataVO sd_vo) throws SQLException{
		List<DiaryListVO> list = new ArrayList<DiaryListVO>();
		
		return list;
	} // selectList
} // class
