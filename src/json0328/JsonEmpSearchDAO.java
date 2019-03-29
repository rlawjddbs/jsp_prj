package json0328;

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

public class JsonEmpSearchDAO {
	private static JsonEmpSearchDAO jes_dao;
	
	private JsonEmpSearchDAO() {
	} // JsonEmpSearchDAO
	
	public static JsonEmpSearchDAO getInstance() {
		if( jes_dao == null ) {
			jes_dao = new JsonEmpSearchDAO();
		} // end if
		return jes_dao;
	} // getInstance
	
	private Connection getConn() throws SQLException{
		Connection con = null;
		
		try {
			// 1. JNDI ��밴ü ����
			Context ctx = new InitialContext();
			// 2. DBCP�� ����� DataSource ���
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jsp_dbcp");
			// 3. Connection ���
			con = ds.getConnection();
		} catch (NamingException ne) {
			ne.printStackTrace();
		} // end catch
		
		return con;
	} // getConn
	
	public List<EmpVO> selectEmpList(int deptno) throws SQLException{
		List<EmpVO> list = new ArrayList<EmpVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
		// 1. 
		// 2.
		// 3.
		con = getConn();
		
		String selectEmp = " SELECT EMPNO, SAL, ENAME, JOB, TO_CHAR(HIREDATE, 'YYYY-MM-DD DY') HIREDATE "+
									" FROM EMP " +
									" WHERE DEPTNO = ? ";
		
		pstmt = con.prepareStatement(selectEmp);
		pstmt.setInt(1, deptno);
		
		rs = pstmt.executeQuery();
		
		
		EmpVO ev = null;
		while(rs.next()) {
			ev = new EmpVO(rs.getInt("empno"), rs.getInt("sal"), rs.getString("ename"), rs.getString("job"), rs.getString("hiredate"));
			list.add(ev);
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
	} // selectEmpList
	
} // class
