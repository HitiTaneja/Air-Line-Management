package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.main.ConfirmBook;
@WebServlet("/ConfirmBooking")
public class ConfirmBooking extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		int pnr_number = Integer.parseInt(request.getParameter("pnr_number"));
		int result = ConfirmBook.changeStatus(pnr_number);
		if(result>0)
		{
			System.out.println("Updation done!!!");
		}
		else
		{
			System.out.println("Updation not done!!!");
		}
	}
}
