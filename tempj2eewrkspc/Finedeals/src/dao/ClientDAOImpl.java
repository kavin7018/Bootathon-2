package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Entity.Clients;
import Entity.Register;
import Util.DBConnectionUtil;

public class ClientDAOImpl implements ClientDAO {
	Clients clients=null;
	String Query=null;
	Connection connection=null;
	PreparedStatement preparedstatement = null;
	Statement statement=null;

	@Override
	public Clients get_details_myprofile(String email) {
		try {
			Query = "select * from FineDeals_Login_tb where email='"+email+"'";
			connection = DBConnectionUtil.OpenConnection();
			statement = connection.createStatement();
			ResultSet res = statement.executeQuery(Query);
			while(res.next()) {
				clients = new Clients();
				clients.setId(Integer.parseInt(res.getString("id")));
				clients.setUsername(res.getString("username"));
				clients.setEmail(email);
				clients.setPassword(res.getString("password"));
				clients.setGender(res.getString("gender"));
				clients.setDob(res.getString("dob"));
				clients.setCountry(res.getString("country"));
			}
		} 
		catch (SQLException e) {
			System.out.println("Error at ClientDAoImpl, get_details_myprofile : "+e);
			e.printStackTrace();
		}
		return clients;
	}

	@Override
	public boolean update(Register register) {
		boolean flag = false;
		
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

}
