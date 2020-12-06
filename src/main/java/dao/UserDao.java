package dao;

import model.User;
import java.sql.*;

public class UserDao {
	
	private Connection con = null;
	private String JdbcURL = "jdbc:mysql://localhost:3306/onlineauction";
	private String dbusername = "root";
	private String dbpassword = "";
	private String driver = "com.mysql.jdbc.Driver";
	public UserDao()
	{
		 try
		 {
			 System.out.println("Connecting to database..............."+JdbcURL);
	         Class.forName(driver);
	         con = DriverManager.getConnection(JdbcURL, dbusername, dbpassword);
		 }catch(Exception e)
		 {
			 e.printStackTrace();
		 }
	}
	public boolean checklogin(String username, String password)
	{
			try {
		         
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
<<<<<<< Updated upstream
	public void registeruser(User user)
||||||| constructed merge base
	public int getUserId(String username)
	{
		try {
	         
	         Statement stat = con.createStatement();
	         System.out.println("username");
	         ResultSet rs = stat.executeQuery("Select * from userprofile where userName = '"+ username +"'");
	         if(rs.next())
	         {
	        	 return rs.getInt("userId");
	         }
	         else
	         {
	        	 return -1;
	         }
	      }
	      catch(Exception e) {
	         e.printStackTrace();
	         return -1;
	      }
	}
	public int getCategoryID(String categoryname)
	{
		try {
	         
	         Statement stat = con.createStatement();
	         ResultSet rs = stat.executeQuery("Select categoryID from category where categoryName = '"+ categoryname +"'");
	         if(rs.next())
	         {
	        	 return (int)rs.getInt("categoryID");
	         }
	         else
	         {
	        	 return -1;
	         }
	      }
	      catch(Exception e) {
	         e.printStackTrace();
	         return -1;
	      }
	}
	public int registeruser(User user)
=======
	public int getUserId(String username)
	{
		try {
	         
	         Statement stat = con.createStatement();
	         System.out.println(username);
	         ResultSet rs = stat.executeQuery("Select * from userprofile where userName = '"+ username +"'");
	         if(rs.next())
	         {
	        	 int x = rs.getInt("userId");
	        	 System.out.println("getUserId UserDao"+x);
	        	 return x;
	         }
	         else
	         {
	        	 return -1;
	         }
	      }
	      catch(Exception e) {
	         e.printStackTrace();
	         return -1;
	      }
	}
	public int getCategoryID(String categoryname)
	{
		try {
	         
	         Statement stat = con.createStatement();
	         ResultSet rs = stat.executeQuery("Select categoryID from category where categoryName = '"+ categoryname +"'");
	         if(rs.next())
	         {
	        	 return (int)rs.getInt("categoryID");
	         }
	         else
	         {
	        	 return -1;
	         }
	      }
	      catch(Exception e) {
	         e.printStackTrace();
	         return -1;
	      }
	}
	public int registeruser(User user)
>>>>>>> Stashed changes
	{
		try
		{
			/*Connection con = null;
			 String JdbcURL = "jdbc:mysql://localhost:3306/onlineauction";
			 String dbusername = "root";
			 String dbpassword = "";
			 String driver = "com.mysql.jdbc.Driver";
			 System.out.println("Connecting to database..............."+JdbcURL);
	         Class.forName(driver);
	         con = DriverManager.getConnection(JdbcURL, dbusername, dbpassword);*/
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

