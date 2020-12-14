package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Product;
import model.User;

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
	{
		try
		{
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
			return result;
		}catch(Exception e)
		{
			e.printStackTrace();
			return -1;
		}
	}

	
	
	public int addproduct(Product product)
	{
		System.out.println(product);
		try
		{
			String query = "Insert into product (sellerID, productName, productDescription, startTime, bidCount, productcol, productStatus, categoryID, productMinPrice, biddingDate) VALUES (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, product.getSellerId() );
			ps.setString(2, product.getProductName());
			ps.setString(3, product.getProductDescription());
			ps.setString(4, product.getStartTime());
			ps.setInt(5, product.getBidCount());
			ps.setString(6, product.getProductcol());
			ps.setString(7, product.getProductStatus());
			ps.setInt(8, product.getCategoryID());
			ps.setInt(9, product.getProductMinPrice());
			ps.setString(10, product.getBiddingDate());
			int result = ps.executeUpdate();
			return result;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	public List<Product> getProducts()
	{
		List<Product> productList = new ArrayList<>();
		try
		{
			String query = "Select * from product";         // add where productStatus = not sold
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Product product = new Product();
				product.setProductName(rs.getString("productName"));
				//System.out.println("name"+product.getProductName());
				product.setProductDescription(rs.getString("productDescription"));
				//System.out.println("description"+product.getProductDescription());
				product.setProductMinPrice(rs.getInt("productMinPrice"));
				//System.out.println("minprice"+product.getProductMinPrice());
				productList.add(product);
			}
			
			return productList;
		}catch(Exception e)
		{
			e.printStackTrace();
			return productList;
		}
		
		
		
	}
}


