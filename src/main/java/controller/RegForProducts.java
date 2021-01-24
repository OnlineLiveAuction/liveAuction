package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dao.UserDao;

/**
 * Servlet implementation class RegForProducts
 */


public class RegForProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegForProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productID = Integer.valueOf(request.getParameter("productID"));
		int userID = (int) request.getSession().getAttribute("userID");
		System.out.print(productID + " " + userID);
		
		UserDao dbcon = new UserDao();
		
		int result = dbcon.addRegisterationRecord(userID, productID);
		
		PrintWriter out = response.getWriter();
		if(result != -1)
		{
			response.sendRedirect("index.jsp");
		}
		else 
		{
			out.print("Something went wrong");
		}
			
		
		
	}

}
