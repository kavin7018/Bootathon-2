package demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import demo.entity.Login;
import demo.util.DBConnectionUtil;

public class LoginDAOImpl implements LoginDAO {
	
	@Override
	
	public String authenticate(Login login) {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		try {
			String Query = "select * from LoginTable where email=? and password=?";
			connection = DBConnectionUtil.OpenConnection();
			preparedstatement = connection.prepareStatement(Query);
			preparedstatement.setString(1, login.getEmail());
			preparedstatement.setString(2, login.getPassword());
			ResultSet res = preparedstatement.executeQuery();
			if(res.next()) {
				return "True";
			}
			else {
				return "False";
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
			System.out.println("Exception at LoginDAOImp : "+ex);
		}
		return "Error";
	}

}
