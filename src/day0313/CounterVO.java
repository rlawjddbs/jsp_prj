package day0313;

/**
 *	scope �Ӽ��� ���� �ٸ��� �����Ǵ� ��ü
 * @author owner
 */
public class CounterVO {
	private int cnt;
	
	public CounterVO() {
		System.out.println("CounterVO");
	} // CounterVO

	public int getCnt() {
		return cnt;
	} // getCnt

	public void setCnt(int cnt) {
		this.cnt += cnt;
	} // setCnt
	
} // class
