package day0313;

public class TestVO {
	private String firstName;
	private int age;
	 
	public TestVO() {
		System.out.println("TestVO의 기본 생성자");
	} // TestVO

	public TestVO(String firstName, int age) {
		this.firstName = firstName;
		this.age = age; 
		System.out.println("TestVO의 인자있는 생성자");
	} // TestVO

	public String getFirstName() {
		return firstName;
	}  

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
	
} // TestVO
