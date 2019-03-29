package json0328;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import kr.co.sist.diary.vo.ListRangeVO;
import kr.co.sist.diary.vo.MonthVO;
import kr.co.sist.diary.vo.SearchDataVO;

public class EmpDAO {
	private static EmpDAO d_dao;
	
	private EmpDAO() {
	} // DiaryDAO
	
	public static EmpDAO getInstance() {
		if(d_dao == null) {
			d_dao = new EmpDAO();
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
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		// 1. 
		// 2.
		// 3.
			con = getConn();
		// 4.
			// 입력되는 년, 월에 대해 일자별 쿼리를 수행하여 Variable Array에 저장
			StringBuilder selectMonthData = new StringBuilder();
			selectMonthData
			.append(" select num, subject ")
			.append(" from diary ")
			.append(" where e_year=? and e_month=? and e_day=? ")
			.append(" order by num asc ");
			

			pstmt = con.prepareStatement(selectMonthData.toString());
			pstmt.setString(1, year);
			pstmt.setString(2, month);
			
		// 5.
			
			List<MonthVO> list = new ArrayList<MonthVO>();
			for(int i=0; i < 32; i++) { // 해당 년월의 1일 부터 31일까지 쿼리를 수행
				pstmt.setString(3, String.valueOf(i+1));
				rs = pstmt.executeQuery();
				
				while(rs.next()) { // 실행 결과가 존재한다면 해당 일자에 이벤트글이 존재하므로 글의 값을 저장한다.
					list.add(new MonthVO(rs.getInt("num"), rs.getString("subject")));
				} // end while
				rs.close();
				if(list.size() != 0) { // 해당 일자에 글이 존재 한다면
					MonthVO[] mvoArr = new MonthVO[list.size()]; // 글을 저장할 배열 생성
					list.toArray(mvoArr); // 리스트에 존재하는 값을 일차원 배열에 복사
					mv[i]=mvoArr; // 일차원 배열의 값을 가변 배열의 i행에 추가한다. (매 행마다 열의 개수는 다를 수 있다.)
				} // end if
				list.clear(); // 리스트를 초기화한다.
				
			} // end for
			
			
		} finally {
		// 6.
			if( rs != null ) { rs.close(); } // end if
			if( pstmt != null ) { pstmt.close(); } // end if
			if( con != null ) { con.close(); } // end if
		}
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
			.append("VALUES( SEQ_DIARY.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)");
			
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
	public DiaryDetailVO selectDetailEvent(int num) throws SQLException, IOException{
		DiaryDetailVO dd_vo =null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BufferedReader br = null;
		
		try {
		// 1. 
		// 2.
		// 3.
			con = getConn();
		// 4.
			StringBuilder selectOneEvt = new StringBuilder();
			selectOneEvt
			.append(" SELECT WRITER, SUBJECT, CONTENTS, TO_CHAR(W_DATE, 'YYYY-MM-DD DY HH24:MI') W_DATE, IP  ")
			.append(" FROM DIARY ")
			.append(" WHERE NUM=? ");
			
			pstmt = con.prepareStatement(selectOneEvt.toString());
			pstmt.setInt(1, num);
			
			// 5.
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				
				//CLOB 처리
				Clob clob = rs.getClob("contents");
				// 별도의 스트림을 연결한다.
				br = new BufferedReader(clob.getCharacterStream());
				String temp = "";
				StringBuilder contents = new StringBuilder();
				while( (temp=br.readLine()) != null ) {
					contents.append( temp );
				} // end while
				
				dd_vo = new DiaryDetailVO(rs.getString("writer"), 
						rs.getString("subject"), contents.toString(),
						rs.getString("w_date"), rs.getString("ip"));
			} // end if
		} finally {
		// 6.
			if ( br != null ) {br.close();} // end if
			if ( rs != null ) { rs.close(); }
			if ( pstmt != null ) { pstmt.close(); }
			if ( con != null ) { con.close(); }
		} // end finally
		
		return dd_vo;
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
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		// 1.
		// 2.
		// 3.
			con = getConn();
		// 4.
			StringBuilder updateEvt = new StringBuilder();
			updateEvt
			.append(" update diary ")
			.append(" set contents = ? ")
			.append(" where num=? and pass=? ");
			pstmt = con.prepareStatement( updateEvt.toString() );
			
			pstmt.setString(1, du_vo.getContents());
			pstmt.setInt(2, du_vo.getNum());
			pstmt.setString(3, du_vo.getPass());
			
		// 5.
			cnt = pstmt.executeUpdate();
			
		} finally {
		// 6.
			if( pstmt != null ) { pstmt.close(); } // end if
			if( con != null ) { con.close(); } // end if
		}
		
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
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		// 1.
		// 2.
		// 3.
			con = getConn();
		// 4.
			StringBuilder deleteEvt = new StringBuilder();
			deleteEvt
			.append(" delete from diary where num=? and pass=? ");
			pstmt = con.prepareStatement( deleteEvt.toString() );
			
			pstmt.setInt(1, dr_vo.getNum());
			pstmt.setString(2, dr_vo.getPass());
			
		// 5.
			cnt = pstmt.executeUpdate();
			
		} finally {
		// 6.
			if( pstmt != null ) { pstmt.close(); } // end if
			if( con != null ) { con.close(); } // end if
		}
		
		return cnt;
	} // deleteEvent
	
	public int selectEvtCnt(SearchDataVO sd_vo) throws SQLException{
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		// 1.
		// 2.
		// 3.
			con = getConn();
		// 4.
			StringBuilder selectCnt = new StringBuilder();
			selectCnt.append("select count(*) cnt from diary ");
			if( sd_vo != null ) {
				// Dynamic Query
				selectCnt.append(" where ").append(sd_vo.getFieldName())
				.append(" like '%' || ? || '%' ");
			} // end if
			pstmt = con.prepareStatement(selectCnt.toString());
			if( sd_vo != null ) {
				pstmt.setString(1, sd_vo.getKeyword());
			} // end if
			
		// 5.
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			} // end if
			
		} finally {
		// 6.
			if( rs != null ) { rs.close(); } // end if
			if( pstmt != null ) { pstmt.close(); } // end if
			if( con != null ) { con.close(); } // end if
		} // end finally
		return cnt;
	} // selectCnt
	
	/**
	 * 게시판의 리스트 형식으로 조회하는 일
	 * @param sd_vo
	 * @return
	 * @throws SQLException
	 */
	public List<DiaryListVO> selectList(ListRangeVO lr_vo, SearchDataVO sd_vo) throws SQLException{
		List<DiaryListVO> list = new ArrayList<DiaryListVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		// 1.
		// 2.
			con = getConn();
		// 3.
			
			StringBuilder selectList = new StringBuilder();
			selectList
			.append(" SELECT R_NUM, NUM, SUBJECT, WRITER, E_YEAR, E_MONTH, E_DAY, TO_CHAR(W_DATE, 'YYYY-MM-DD HH24:MI') W_DATE ")
			.append(" FROM (SELECT ROW_NUMBER() OVER(ORDER BY NUM DESC) R_NUM, ")
			.append(" NUM, SUBJECT, WRITER, E_YEAR, E_MONTH, E_DAY, W_DATE ")
			.append(" FROM DIARY ");
			
			if(sd_vo != null) {
				selectList.append(" where ").append(sd_vo.getFieldName()).append(" like '%'||?||'%' ");
			} // end if
			
			selectList.append(" ) ")
			.append(" WHERE R_NUM BETWEEN ? AND ? ");
			
			pstmt = con.prepareStatement(selectList.toString());
			
			int bindIdx = 1;
			if (sd_vo != null) {
				pstmt.setString(bindIdx++, sd_vo.getKeyword());
			} // end if
			
			pstmt.setInt(bindIdx++, lr_vo.getStartNum());
			pstmt.setInt(bindIdx++, lr_vo.getEndNum());
			
			rs = pstmt.executeQuery();
			
			DiaryListVO ld_vo = null;
			while(rs.next()){
				ld_vo = new DiaryListVO(rs.getInt("num"), rs.getString("subject"), rs.getString("writer"), rs.getString("e_year"), rs.getString("e_month")
						, rs.getString("e_day"), rs.getString("w_date"));
				list.add(ld_vo);
			} // end while
			
		// 4.
		// 5.
		} finally {
		// 6.
			if( rs != null ) { rs.close(); } // end if
			if( pstmt != null ) { pstmt.close(); } // end if
			if( con != null ) { con.close(); } // end if
		} // end finally
		
		return list;
	} // selectList
} // class
