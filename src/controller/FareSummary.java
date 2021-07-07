package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.main.BookDetails;
@WebServlet("/FareSummary")
public class FareSummary extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		int pnr_number = Integer.parseInt(request.getParameter("pnr"));
		float amount = Float.parseFloat(request.getParameter("totalfaregst"));
		System.out.println("pnr_number "+pnr_number+" amount "+amount);
		String status = "Confirmed";
		BookDetails bd = new BookDetails();
		
		int result = bd.insertAmount(pnr_number, amount);
		int res = bd.updateStatus(pnr_number, status);
		System.out.println("Result inside servlet"+result);
		if(result>0 && res>0)
		{
			request.setAttribute("pnr_number", pnr_number);
			RequestDispatcher dispatcher = request.getRequestDispatcher("PaymentSuccess.jsp");
			dispatcher.forward(request, response);
		}
	}
}
