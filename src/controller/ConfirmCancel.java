package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.main.BookDetails;
@WebServlet("/ConfirmCancel")
public class ConfirmCancel extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		int pnr_number = Integer.parseInt(request.getParameter("pnr_number"));
		BookDetails bd = new BookDetails();
		int result = bd.cancelTicket(pnr_number);
		if(result>0)
		{
			RequestDispatcher rd = request.getRequestDispatcher("CancelSuccess.jsp");
			rd.forward(request, response);
		}
		
	}

}
