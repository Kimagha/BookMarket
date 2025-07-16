package mvc.database;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class DBConnection {
	 public static Connection getConnection()throws SQLException, ClassNotFoundException{
		 
		 Connection conn=null;
		 
		 String url;
		 String user = "kjj123000"; 
		 String password = "199eh118^^";
		 
		 boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");
		  
		  if(isWindows) url = "jdbc:mysql://localhost:3306/BookMarketDB";
		  
		  else url = "jdbc:mysql://localhost:3306/kjj123000db?serverTimezone=UTC&characterEncoding=utf8";
		  
		  Class.forName("com.mysql.jdbc.Driver");
		  conn=DriverManager.getConnection(url, user, password);
		  
		  return conn;
	 }
}
