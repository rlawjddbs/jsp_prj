package kr.co.sist.diary.vo;

public class ListRangeVO {

	private int startNum, endNum;
	
	public ListRangeVO() {
		super();
	}

	public ListRangeVO(int startNum, int endNum) {
		this.startNum = startNum;
		this.endNum = endNum;
	} // ListRangeVO

	public int getStartNum() {
		return startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
} // class
