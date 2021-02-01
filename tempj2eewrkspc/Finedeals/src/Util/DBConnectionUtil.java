package Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionUtil {
	
	//Variable declaration
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String username = "kavin";
	private static final String password = "admin";
	private static Connection connection = null;
	
	public static Connection OpenConnection() {
		if(connection!=null) {
			return connection;
		}
		else {
			try {
				
				//Loading Driver
				Class.forName(driver);
				
				//Getting Connection
				connection = DriverManager.getConnection(url, username, password);
			} 
			
			catch (Exception e) {
				System.out.println("Exception at DBConnectionUtil : "+e);
				e.printStackTrace();
			}
		}
		
		return connection;
	}
}
