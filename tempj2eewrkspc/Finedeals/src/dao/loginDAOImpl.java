package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Entity.Login;
import Util.DBConnectionUtil;

public class loginDAOImpl implements LoginDAO {

	@Override
	public String authenticate(Login login) {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		try {
			String Query = "select * from FineDeals_Login_tb where email=? and password=?";
			connection = DBConnectionUtil.OpenConnection();
			preparedstatement = connection.prepareStatement(Query);
			preparedstatement.setString(1, login.getEmail());
			preparedstatement.setString(2, login.getPassword());
			ResultSet res = preparedstatement.executeQuery();
			
			if(res.next()) {
				if(res.getString("email").equals("admin@finedeals.com") && res.getString("password").equals("admin")) {
					return "Admin";
				}
				return "True";
			}
			else {
				return "False";
			}
		}
		
		catch (Exception e) { 
			System.out.println("Exception at LoginDAOImpl : "+e);
			e.printStackTrace(); 
		}
		 
		return "Error";
	}

}
