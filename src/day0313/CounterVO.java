package day0313;

/**
 *	scope 속성에 따라 다르게 생성되는 객체
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
