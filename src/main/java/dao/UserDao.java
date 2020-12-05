package dao;

import model.User;
import java.sql.*;

public class UserDao {
	
	public boolean checklogin(String username, String password)
	{
		Connection con = null;
		 String JdbcURL = "jdbc:mysql://localhost:3306/onlineauction";
		 String dbusername = "root";
		 String dbpassword = "";
		 String driver = "com.mysql.jdbc.Driver";
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
	public void registeruser(User user)
	{
		try
		{
			Connection con = null;
			 String JdbcURL = "jdbc:mysql://localhost:3306/onlineauction";
			 String dbusername = "root";
			 String dbpassword = "";
			 String driver = "com.mysql.jdbc.Driver";
			 System.out.println("Connecting to database..............."+JdbcURL);
	         Class.forName(driver);
	         con = DriverManager.getConnection(JdbcURL, dbusername, dbpassword);
			String query = "Insert into userprofile (Name, password, pincode, country, state, city, street, birthdate, contactNo, email, userName) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getPassword());
			ps.setInt(3, user.getPincode());
			ps.setString(4, user.getCountry());
			ps.setString(5, user.getState());
			ps.setString(6, user.getCity());
			ps.setString(7, user.getStreet());
			ps.setString(8, user.getBirthdate());
			ps.setString(9, user.getContactNo());
			ps.setString(10, user.getEmail() );
			ps.setString(11, user.getUsername());
			
			int result = ps.executeUpdate();
			System.out.println(result);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

