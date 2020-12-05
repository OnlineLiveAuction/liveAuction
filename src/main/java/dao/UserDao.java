package dao;

import model.User;
import java.sql.*;

public class UserDao {
	
	public boolean checklogin(String username, String password)
	{
		String JdbcURL = "jdbc:mysql://localhost:3306/onlineauction";
	    String dbusername = "root";
	    String dbpassword = "";
	    String driver = "com.mysql.jdbc.Driver";
	    Connection con = null;
		try {
	         System.out.println("Connecting to database..............."+JdbcURL);
	         Class.forName(driver);
	         con = DriverManager.getConnection(JdbcURL, dbusername, dbpassword);
	         Statement stat = con.createStatement();
	         ResultSet rs = stat.executeQuery("Select * from userprofile where userName = '"+ username +"' and password = '"+password+"'");
	         if(rs.next())
	         {
	        	 //System.out.pront()
	        	 return true;
	         }
	         else
	         {
	        	 return false;
	         }
	      }
	      catch(Exception e) {
	         e.printStackTrace();
	         return false;
	      }
	}

}

