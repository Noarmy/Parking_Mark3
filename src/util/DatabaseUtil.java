package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil { //실질적으로 데이터베이스와 연동하는곳
	
	public static Connection getConnection() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/parktable?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "2guswhdsla";
			Class.forName("com.mysql.jdbc.Driver");
			
			return DriverManager.getConnection(dbURL,dbID,dbPassword);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
		
	}
	

}
