package demo.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionUtil {

	//Variable declaration
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String UserName = "kavin";
	private static final String password = "admin";
	private static Connection connection = null;
		
	//defining static methods
	public static Connection OpenConnection() {
		
		//check for connection
		if(connection!=null) {
			return connection;
		}
		else {
			try {
				//Loading the driver
				Class.forName(driver);
			
				//getConnection
				connection = DriverManager.getConnection(url, UserName, password);
			}			
			catch(Exception ex) {
				System.out.println(ex);
			}
		}
		return connection;
	}

}
