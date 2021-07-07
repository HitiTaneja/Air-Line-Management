package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.main.Search;
import hibernate.modal.Booking_Details;
@WebServlet("/CancelTicket")
public class CancelTicket extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		int pnr_number = Integer.parseInt(request.getParameter("bookid"));
		System.out.println("pnr number "+pnr_number);
		Search sear = new Search();
		List<Booking_Details> list = sear.searchByPnrNumber(pnr_number);
		System.out.println("List "+list.toString());
		if(list.size()>0)
		{
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("ResultCancelTicket.jsp");
			rd.forward(request, response);
		}
	}

}
