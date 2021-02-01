package demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import demo.entity.Employee;
import demo.util.DBConnectionUtil;

public class EmployeeDAOImpl implements EmployeeDAO {

	List<Employee> list = null;
	PreparedStatement preparedstatement = null;
	Connection connection = null;
	Statement statement = null;
	ResultSet res = null;
	
	
	@Override
	public List<Employee> get() {
		
		list = new ArrayList<>();
		Employee employee;
		
		try {
			connection = DBConnectionUtil.OpenConnection();
			statement = connection.createStatement();
			String query = "select * from DemoEmployee Order by ID";
			res = statement.executeQuery(query);
			while(res.next()) {
				employee = new Employee();
				employee.setId(res.getInt("id"));
				employee.setName(res.getString("name"));
				employee.setDob(res.getString("dob"));
				employee.setDept(res.getString("dept"));
				list.add(employee);
			}
		}
		catch(SQLException ex) {
			System.out.println("Error at EmpDAOImp 1: "+ex);
		}
		
		return list;
	}
	
	@Override
	public boolean save(Employee e) {
		boolean flag=false;
		try {
			String Query = "insert into DemoEmployee(ID,NAME,DOB,DEPT) values("+"'"+ e.getId() + "','" + e.getName() + "','" + e.getDob() + "','" + e.getDept() + "')";
			connection =  DBConnectionUtil.OpenConnection();
			preparedstatement = connection.prepareStatement(Query);
			preparedstatement.executeUpdate();
			flag = true;
		}
		catch(SQLException ex) {
			ex.printStackTrace();
			System.out.println("Error at EmpDAOImp 2: "+ex);
		}
		return flag;
	}

	@Override
	public Employee get(int id) {
		Employee employee = new Employee();
		try {
			String Query = "select * from DemoEmployee where id = "+id;
			connection =  DBConnectionUtil.OpenConnection();
			statement = connection.createStatement();
			res = statement.executeQuery(Query);
			while(res.next()) {
				employee.setId(res.getInt("id"));
				employee.setName(res.getString("name"));
				employee.setDob(res.getString("dob"));
				employee.setDept(res.getString("dept"));
			}
		}
		catch(SQLException ex) {
			ex.printStackTrace();
			System.out.println("Exception in EmployeeDAOImp01 : "+ex);
		}
		return employee;
	}

	@Override
	public boolean update(Employee e) {
		boolean flag = false;
		try {
			String Query = "update  DemoEmployee set name='"+e.getName()+"',dob='"+e.getDob()+"',dept='"+e.getDept()+"' where id="+e.getId();
			connection =  DBConnectionUtil.OpenConnection();
			preparedstatement = connection.prepareStatement(Query);
			preparedstatement.executeUpdate();
			flag = true;
		}
		catch(SQLException ex) {
			ex.printStackTrace();
			System.out.println("Exception in EmployeeDAOImp02 : "+ex);
		}
		return flag;
	}

	@Override
	public boolean delete(int id) {
		boolean flag = false;
		try {
			String Query = "Delete from DemoEmployee where id="+id;
			connection = DBConnectionUtil.OpenConnection();
			preparedstatement = connection.prepareStatement(Query);
			preparedstatement.executeUpdate();
			flag = true;
		}
		catch(SQLException ex) {
			ex.printStackTrace();
			System.out.println("Exception in EmployeeDAOImp02 : "+ex);
		}
		return flag;
	}
}







