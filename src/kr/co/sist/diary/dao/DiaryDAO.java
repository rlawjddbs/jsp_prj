package kr.co.sist.diary.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	/**
	 * ��, ���� �Է¹޾� �ش� ���� ��� ������ �۹�ȣ, ������ �����迭�� �����Ͽ�
	 * ��ȯ�ϴ� ��
	 * @param year ��
	 * @param month ��
	 * @return �����迭
	 * @throws SQLException
	 */
	public MonthVO[][] selectMonthEvent(String year, String month) throws SQLException{
		MonthVO[][] mv = new MonthVO[31][];
		
		return mv;
	} // selectMonthEvent
	
	public void insertEvent(DiaryVO d_vo) throws SQLException{
		
	} // insertEvent
	
	/**
	 * �� ��ȣ�� �Է¹޾� �ش� �̺�Ʈ�� �� ���� ��ȸ
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
	 * �� ��ȣ, ����, ��й�ȣ�� �Է¹޾� ��й�ȣ�� ��ġ�ϸ� �ش� �۹�ȣ�� �̺�Ʈ ������ 
	 * �����ϴ� ��.
	 * @param du_vo
	 * @return
	 * @throws SQLException
	 */
	public int updateEvent(DiaryUpdateVO du_vo) throws SQLException{
		int cnt=0;
		
		return cnt;
	} // updateEvent
	
	/**
	 * �� ��ȣ, ��й�ȣ�� �Է¹޾� �ش� ���� �����ϴ� ��
	 * @param dr_vo
	 * @return
	 * @throws SQLException
	 */
	public int deleteEvent(DiaryRemoveVO dr_vo) throws SQLException{
		int cnt =0;
		
		return cnt;
	} // deleteEvent
	
	/**
	 * �Խ����� ����Ʈ �������� ��ȸ�ϴ� ��
	 * @param sd_vo
	 * @return
	 * @throws SQLException
	 */
	public List<DiaryListVO> selectList(SearchDataVO sd_vo) throws SQLException{
		List<DiaryListVO> list = new ArrayList<DiaryListVO>();
		
		return list;
	} // selectList
} // class
