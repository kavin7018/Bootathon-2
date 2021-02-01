package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Entity.Clients;
import Util.DBConnectionUtil;

public class AdminDAOImpl implements AdminDAO {
	Clients clients = null;
	List<Clients> list = null;
	String Query = "";		
	Statement statement = null;
	PreparedStatement preparedstatement = null;
	Connection connection = null;

	@Override
	public List<Clients> GetAllClients() {
		
		try {
			list = new ArrayList<>();
			Query = "select * from FineDeals_Login_tb order by id";
			connection = DBConnectionUtil.OpenConnection();
			statement = connection.createStatement();
			ResultSet res = statement.executeQuery(Query);
			while(res.next()) {
				clients = new Clients();
				clients.setId(Integer.parseInt(res.getString("id")));
				clients.setEmail(res.getString("email"));
				clients.setPassword(res.getString("password"));
				clients.setUsername(res.getString("username"));
				clients.setDob(res.getString("dob"));
				clients.setGender(res.getString("gender"));
				clients.setCountry(res.getString("country"));
				list.add(clients);
			}
		}
		catch (SQLException e) {
			System.out.println("Exception at ClientsDAOImpl : "+e);
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Clients getSingleClient(int id) {
		try {
			Query = "select * from FineDeals_Login_tb where id="+id;
			connection = DBConnectionUtil.OpenConnection();
			statement = connection.createStatement();
			ResultSet res = statement.executeQuery(Query);
			while(res.next()) {
				clients = new Clients();
				clients.setId(id);
				clients.setUsername(res.getString("username"));
				clients.setEmail(res.getString("email"));
				clients.setPassword(res.getString("password"));
				clients.setGender(res.getString("gender"));
				clients.setDob(res.getString("dob"));
				clients.setCountry(res.getString("country"));
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return clients;
	}
}