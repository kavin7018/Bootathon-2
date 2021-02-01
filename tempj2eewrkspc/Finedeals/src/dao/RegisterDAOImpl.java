package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Entity.Register;
import Util.DBConnectionUtil;

public class RegisterDAOImpl implements RegisterDAO {
	PreparedStatement preparedstatement = null;
	Connection connection = null;
	String Query = "";
	boolean flag ;

	@Override
	public boolean AddClient(Register register) {
		flag = false;
		try {
			Query = "insert into FineDeals_Login_tb(email,password,username,dob,gender,country) values('"+register.getEmail()+"','"+register.getPassword()+"','"+register.getUsername()+"','"+register.getDob()+"','"+register.getGender()+"','"+register.getCountry()+"')";   
			connection = DBConnectionUtil.OpenConnection();
			preparedstatement = connection.prepareStatement(Query);
			preparedstatement.executeUpdate();
			flag = true;
		}
		catch(SQLException ex) {
			System.out.println("Error at RegisterDAOImpl : "+ex);
			ex.printStackTrace();
		}		
		return flag;
	}

	@Override
	public boolean update(Register register) {
		flag = false;
		try {
			Query = "Update FineDeals_Login_tb set email='"+register.getEmail()+"', password='"+register.getPassword()+"',username='"+register.getUsername()+"',gender='"+register.getGender()+"',dob='"+register.getDob()+"',country='"+register.getCountry() +"' where id="+register.getId();
			connection = DBConnectionUtil.OpenConnection();
			preparedstatement = connection.prepareStatement(Query);
			preparedstatement.executeUpdate();
			flag = true;
		}
		catch(SQLException ex) {
			System.out.println("Error at RegisterDAOImpl : "+ex);
			ex.printStackTrace();
		}		
		return flag;
	}

	@Override
	public boolean delete(int id) {
		flag = false;
		try {
			Query = "Delete from FineDeals_Login_tb where id="+id;
			connection = DBConnectionUtil.OpenConnection();
			preparedstatement = connection.prepareStatement(Query);
			preparedstatement.executeUpdate();
			flag = true;
		}
		catch(SQLException ex) {
			System.out.println("Error at RegisterDAOImpl : "+ex);
			ex.printStackTrace();
		}		
		return flag;
	}
}
