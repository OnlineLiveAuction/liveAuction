package dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

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
	
	public List<String> getCategories()
	{
		List<String> categoryList = new ArrayList<>();
		
		try
		{
			String query = "Select * from category";   
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				String categoryName = new String();
			
				categoryName = rs.getString("categoryName");				
				categoryList.add(categoryName);
			}
			
			return categoryList;
		}catch(Exception e)
		{
			e.printStackTrace();
			return categoryList;
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
			//String query = "Insert into product (sellerID, productName, productDescription, startTime, stopTime, bidCount, productcol, productStatus, categoryID, productMinPrice, biddingDate) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			String query = "Insert into product (sellerID, productName, productDescription, startTime, stopTime, bidCount, productcol, productStatus, categoryID, productMinPrice, biddingDate, productPicture) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, product.getSellerId() );
			ps.setString(2, product.getProductName());
			ps.setString(3, product.getProductDescription());
			ps.setString(4, product.getStartTime());
			ps.setString(5, product.getStopTime());
			ps.setInt(6, product.getBidCount());
			ps.setString(7, product.getProductcol());
			ps.setString(8, product.getProductStatus());
			ps.setInt(9, product.getCategoryID());
			ps.setInt(10, product.getProductMinPrice());
			ps.setString(11, product.getBiddingDate());
			
			Part productPicture = product.getProductPicture();
			InputStream inputStream = null; // input stream of the upload file
			if (productPicture != null) {
	            System.out.println("Name of Image"+productPicture.getName());
	            System.out.println("Size of Image:"+productPicture.getSize());
	            System.out.println("Content Type"+productPicture.getContentType());
	            inputStream = productPicture.getInputStream();
	        }
	        if (inputStream != null) {
	            ps.setBlob(12, inputStream);
	        }			
			
			
			int result = ps.executeUpdate();
			if (result > 0) {
                System.out.println("File uploaded and saved into database");
            }
			return result;
		}catch(Exception e)
		{
			e.printStackTrace();
			return -1;
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
				System.out.println("result set useradao");
				Product product = new Product();
				//product.setProductID(rs.getInt(1));
				product.setProductName(rs.getString("productName"));
				product.setProductID(rs.getInt("productID"));
				//System.out.println("name"+product.getProductName());
				product.setProductDescription(rs.getString("productDescription"));
				//System.out.println("description"+product.getProductDescription());
				product.setProductMinPrice(rs.getInt("productMinPrice"));
				product.setStartTime(rs.getString("startTime"));
				product.setStopTime(rs.getString("stopTime"));
				product.setBiddingDate(rs.getString("biddingDate"));
				product.setSellerId(rs.getInt("sellerID"));
				//System.out.println("minprice"+product.getProductMinPrice());
				int categoryID = rs.getInt("categoryID");
				PreparedStatement psCat = con.prepareStatement("Select categoryname from category where categoryID = '"+ categoryID +"'");
				ResultSet category = psCat.executeQuery();
				if(category.next())
				{
					product.setCategoryName(category.getString("categoryName"));
				}
				
				productList.add(product);
			}
			
			return productList;
		}catch(Exception e)
		{
			e.printStackTrace();
			return productList;
		}
		
		
		
	}
	public List<Product> getMyProducts(String username)
	{
		System.out.println(username);
		List<Product> myProductList = new ArrayList<>();
		try
		{
			int userId = getUserId(username);
			System.out.println("getmyproducts"+userId);
			String query = "Select * from product where sellerID = "+userId+"";         // add where productStatus = not sold
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				System.out.println("result set useradao");
				Product product = new Product();
				product.setProductName(rs.getString("productName"));
				product.setProductID(rs.getInt("productID"));
				//System.out.println("name"+product.getProductName());
				product.setProductDescription(rs.getString("productDescription"));
				//System.out.println("description"+product.getProductDescription());
				product.setProductMinPrice(rs.getInt("productMinPrice"));
				product.setStartTime(rs.getString("startTime"));
				product.setStopTime(rs.getString("stopTime"));
				product.setBiddingDate(rs.getString("biddingDate"));
				//System.out.println("minprice"+product.getProductMinPrice());
				int categoryID = rs.getInt("categoryID");
				PreparedStatement psCat = con.prepareStatement("Select categoryname from category where categoryID = '"+ categoryID +"'");
				ResultSet category = psCat.executeQuery();
				if(category.next())
				{
					product.setCategoryName(category.getString("categoryName"));
				}
				
				myProductList.add(product);
			}
			
			return myProductList;
		}catch(Exception e)
		{
			e.printStackTrace();
			return myProductList;
		}
		
		
		
	}
	
	public int addRegisterationRecord(int bidderID, int productID) 
	{
		System.out.print(bidderID + "  " + productID);
		String query = "Insert into productregistration VALUES (?,?)";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, bidderID);
			ps.setInt(2, productID);
			int result = ps.executeUpdate();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		
	}
	
	public List<Integer> getRegisteredProductID(String username)
	{
		int userId = getUserId(username);
		System.out.print("CRG " + username + " " + userId);
		String query = "Select productID from productregistration where bidderID = "+userId; 
		List<Integer> registeredProductID = new ArrayList<Integer>();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				registeredProductID.add(rs.getInt("productID"));
			}
			return registeredProductID;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Product> getRegisteredProducts(String username)
	{
		List<Product> productList = new ArrayList<>();
		try
		{
			int userId = getUserId(username);
			String query = "select * from product where productID in (select productID from productregistration WHERE bidderID = "+userId+")" ;       // add where productStatus = not sold
			System.out.print("CRG1" + query);
			
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				System.out.println("result set useradao");
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductName(rs.getString("productName"));
				//System.out.println("name"+product.getProductName());
				product.setProductDescription(rs.getString("productDescription"));
				//System.out.println("description"+product.getProductDescription());
				product.setProductMinPrice(rs.getInt("productMinPrice"));
				product.setStartTime(rs.getString("startTime"));
				product.setStopTime(rs.getString("stopTime"));
				product.setBiddingDate(rs.getString("biddingDate"));
				product.setSellerId(rs.getInt("sellerID"));
				//System.out.println("minprice"+product.getProductMinPrice());
				int categoryID = rs.getInt("categoryID");
				PreparedStatement psCat = con.prepareStatement("Select categoryname from category where categoryID = '"+ categoryID +"'");
				ResultSet category = psCat.executeQuery();
				if(category.next())
				{
					product.setCategoryName(category.getString("categoryName"));
				}
				
				productList.add(product);
			}
			
			return productList;
		}catch(Exception e)
		{
			e.printStackTrace();
			return productList;
		}
		
	}
	public List<Product> applyFilter(List<String> selectedCategories, int price, String search)
	{
		
		List<Product> productList = new ArrayList<>();
		try
		{
			System.out.println("applyFiltercalled");
			String query = "Select * from product ";
			String categories = "(";
			for(int i = 0; i < selectedCategories.size(); i++)
			{
				if(i == selectedCategories.size()-1)
					categories = categories+""+getCategoryID(selectedCategories.get(i));
				else	
					categories = categories+""+getCategoryID(selectedCategories.get(i))+",";
			}
			categories = categories+") ";
			int flag = 0;
			if(!categories.equals("() "))
			{
				query = query + "where categoryID IN "+categories;
				flag = 1;
			}
			if(flag == 0)
			{
				query = query + "where productMinPrice BETWEEN 0 AND "+price+" ";
				flag = 1;
			}
			else
			{
				query = query + "AND productMinPrice BETWEEN 0 AND "+price+" ";
			}
			if(!search.equals(""))
			{
				if(flag == 0)
				{
					query = query + "where productName='"+ search +"'";
				}
				else
				{
					query = query + "AND productName='"+ search +"'";
				}
			}
			System.out.println("categories"+categories);
			System.out.println("price"+price);
			System.out.println("search"+search);
			System.out.println("query"+query);
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				System.out.println("result set useradao");
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductName(rs.getString("productName"));
				//System.out.println("name"+product.getProductName());
				product.setProductDescription(rs.getString("productDescription"));
				//System.out.println("description"+product.getProductDescription());
				product.setProductMinPrice(rs.getInt("productMinPrice"));
				product.setStartTime(rs.getString("startTime"));
				product.setStopTime(rs.getString("stopTime"));
				product.setBiddingDate(rs.getString("biddingDate"));
				product.setSellerId(rs.getInt("sellerID"));
				//System.out.println("minprice"+product.getProductMinPrice());
				int categoryID = rs.getInt("categoryID");
				PreparedStatement psCat = con.prepareStatement("Select categoryname from category where categoryID = '"+ categoryID +"'");
				ResultSet category = psCat.executeQuery();
				if(category.next())
				{
					product.setCategoryName(category.getString("categoryName"));
				}
				
				productList.add(product);
			}
			
			return productList;
		}catch(Exception e)
		{
			e.printStackTrace();
			return productList;
		}
	}
	public int addNewCategory(String categoryName)
	{
		List<String> categoryList = getCategories();
		if(categoryList.contains(categoryName))
		{
			return -2;
		}
		else 
		{
			String query = "Insert into category (categoryName) VALUES (?)";
			PreparedStatement ps;
			try {
				ps = con.prepareStatement(query);
				ps.setString(1, categoryName);
				int result = ps.executeUpdate();
				return result;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return -1;
			}
			
		}
		
		
		
		
	}
	
	public Product getProductInfo(int productID)
	{
		String query = "Select * from product where productID = "+productID;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductName(rs.getString("productName"));
				//System.out.println("name"+product.getProductName());
				product.setProductDescription(rs.getString("productDescription"));
				//System.out.println("description"+product.getProductDescription());
				product.setProductMinPrice(rs.getInt("productMinPrice"));
				product.setStartTime(rs.getString("startTime"));
				product.setStopTime(rs.getString("stopTime"));
				product.setBiddingDate(rs.getString("biddingDate"));
				product.setSellerId(rs.getInt("sellerID"));
				return product;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public int getProductRegistrationCount(int productID)
	{
		String query = "select count(*) from productregistration where productID="+productID;
		PreparedStatement ps;
		int ans=0;
		try {
			ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ans=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ans;
	}
	
}


