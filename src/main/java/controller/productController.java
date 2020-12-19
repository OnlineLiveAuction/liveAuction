package controller;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.UserDao;
import model.Product;

/**
 * Servlet implementation class productController
 */
public class productController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//doGet(request, response);
		UserDao dbcon = new UserDao();
		String biddingDate = (String)request.getParameter("biddingdate");
		System.out.println(biddingDate);
		int productMinPrice = Integer.parseInt(request.getParameter("productminprice"));
		String productStatus = "not sold";
		String categoryname = (String)request.getParameter("categoryID");
		int categoryID = dbcon.getCategoryID(categoryname);
		String productcol = (String)request.getParameter("productcol");
		int bidCount = 0;
		String startTime = (String)request.getParameter("starttime");
		String productDescription = (String)request.getParameter("productdescription");
		//Part productPicture = (Part)request.getPart("productpicture");
		String productName = (String)request.getParameter("productname");
		String username = (String)request.getParameter("username");
		System.out.println("product"+username);
		int sellerID = dbcon.getUserId(username);
		System.out.println("productContoller seller ID"+sellerID);
		if(sellerID > -1)
		{
			Product product = new Product();
			product.setBidCount(bidCount);
			product.setBiddingDate(biddingDate);
			product.setCategoryID(categoryID);
			product.setProductcol(productcol);
			product.setProductDescription(productDescription);
			product.setProductMinPrice(productMinPrice);
			product.setProductName(productName);
			//product.setProductPicture(productPicture);
			product.setStartTime(startTime);
			product.setSellerId(sellerID);
			product.setProductStatus(productStatus);
			dbcon.addproduct(product);
			RequestDispatcher dispatch = request.getRequestDispatcher("index.jsp?prodreg=true");
			dispatch.forward(request, response);
		}
		else
		{
			RequestDispatcher dispatch = request.getRequestDispatcher("index.jsp?prodreg=false");
			dispatch.forward(request, response);
		}
		
		
	}

}