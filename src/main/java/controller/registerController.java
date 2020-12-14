package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.User;

/**
 * Servlet implementation class registerController
 */
public class registerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatch = request.getRequestDispatcher("registration.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = (String)request.getParameter("username");
		String password = (String)request.getParameter("password");
		String name = (String)request.getParameter("name");
		int pincode  = Integer.parseInt((String)request.getParameter("pincode"));
		String country = (String)request.getParameter("country");
		String state = (String)request.getParameter("state");
		String city = (String)request.getParameter("city");
		String street = (String)request.getParameter("street");
		String birthdate = (String)request.getParameter("birthdate");
		String contactno = (String)request.getParameter("contactno");
		String email = (String)request.getParameter("email");
		//userId auto increment
		
		User user = new User();
		user.setBirthdate(birthdate);
		user.setCity(city);
		user.setContactNo(contactno);
		user.setCountry(country);
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setPincode(pincode);
		user.setState(state);
		user.setStreet(street);
		user.setUsername(username);
		
		UserDao dbcon = new UserDao();
		int result = dbcon.registeruser(user);
		
		HttpSession session = request.getSession();
		session.setAttribute("username", username);
		RequestDispatcher dispatch;
		if(result < 1)
		{
			dispatch = request.getRequestDispatcher("index.jsp?registered=false");
		}
		else
		{
			dispatch = request.getRequestDispatcher("index.jsp?registered=true");
		}
		dispatch.forward(request, response);
	}

}
