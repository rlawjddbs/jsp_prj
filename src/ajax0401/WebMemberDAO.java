package ajax0401;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class WebMemberDAO {

	private static WebMemberDAO wm_dao;
	
	private WebMemberDAO() {
		
	} // WebMemberDAO
	
	public static WebMemberDAO getInstance() {
		if(wm_dao == null) {
			wm_dao = new WebMemberDAO();
		} // end if
		return wm_dao;
	} // WebMemberDAO
	
	private Connection getConn() throws SQLException{
		Connection con = null;
		
		try {
			// 1. JNDI ��밴ü ����
			Context ctx = new InitialContext();
			// 2. DBCP���� DataSource ���
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jsp_dbcp");
			// 3. DataSource���� Connection ���
			con = ds.getConnection();
		} catch (NamingException ne) {
			ne.printStackTrace();
		} // end catch
		
		return con;
	} // getConn
	
	/**
	 * ID�� �����ϴ��� �ߺ� �˻��ϴ� ��
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public boolean selectId(String id) throws SQLException{
		boolean flag = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		// 1.  
		// 2.
		// 3.
			con = getConn();
		// 4.
			String selectId = "select id from web_member where id=?";
			pstmt = con.prepareStatement(selectId);
			pstmt.setString(1, id);
		// 5.
			rs = pstmt.executeQuery();
			
			flag = !rs.next();
			
		} finally {
			// 6.
			if( rs != null ) { rs.close(); } // end if
			if( pstmt != null ) { pstmt.close(); } // end if
			if( con != null ) { con.close(); } // end if
		} // end finally
		
		return	 flag;
	} // selectId
	
	
} // class
