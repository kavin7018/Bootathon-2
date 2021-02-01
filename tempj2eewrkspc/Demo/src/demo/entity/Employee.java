package demo.entity;

public class Employee {

	//defining fields
	
	String name = "";
	int id ;
	String dob = "";
	String dept = "";	
	
	//Generate getters and setters
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	
	//Generate to string method
	
	@Override
	public String toString() {
		return "Employee [name=" + name + ", id=" + id + ", dob=" + dob + ", dept=" + dept + "]";
	}

}
