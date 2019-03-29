package json0328;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpVO {
	private int empno, sal;
	private String ename, job, hiredate;
	
	public EmpVO() {
	} // EmpVO
	
	public EmpVO(int empno, int sal, String ename, String job, String hiredate) {
		this.empno = empno;
		this.sal = sal;
		this.ename = ename;
		this.job = job;
		this.hiredate = hiredate;
	} // EmpVO

	public int getEmpno() {
		return empno;
	}
	public int getSal() {
		return sal;
	}
	public String getEname() {
		return ename;
	}
	public String getJob() {
		return job;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	
	
	
} // class
