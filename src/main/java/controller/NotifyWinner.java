package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.Product;
/**
 * Servlet implementation class NotifyWinner
 */
public class NotifyWinner extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotifyWinner() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDao dbcon = new UserDao();
		System.out.println("In Notify Winner");
		int productID = Integer.parseInt(request.getParameter("productID"));
		Product product = dbcon.getProductInfo(productID);
		String winnerID = product.getWinnerID();
		int sellerID = product.getSellerId();
		String winnerMailID = dbcon.getUserEmail(Integer.valueOf(winnerID));
		String sellerMailID = dbcon.getUserEmail(sellerID);		
		//System.out.print("Winner mail "+winnerMailID+ "Seller mail"+ sellerMailID);
		String mailSubject = "Bid finished!";
		String mailBody = "Bid finished!";
		SendEmail winMailToSeller = new SendEmail(sellerMailID, mailSubject, mailBody);
		SendEmail winMailToWinner = new SendEmail(winnerMailID, mailSubject, mailBody);
		
		//doGet(request, response);
	}

}
