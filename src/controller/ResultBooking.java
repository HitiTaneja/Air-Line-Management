package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.main.BookDetails;
@WebServlet("/ResultBooking")
public class ResultBooking extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int pnr_number = Integer.parseInt(request.getParameter("pnr_number"));
		String flight_code = request.getParameter("flight_code");
		String airlineid = request.getParameter("airlineid");
		String class_type = request.getParameter("class_type");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String jdate = request.getParameter("jdate");
		int child = Integer.parseInt(request.getParameter("child"));
		int adult = Integer.parseInt(request.getParameter("adult"));
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		String pass3 = request.getParameter("pass3");
		String pass4 = request.getParameter("pass4");
		float amount = Float.parseFloat(request.getParameter("amount"));
		int passenger = adult+child;
		
		BookDetails bd = new BookDetails();
		
		int result = bd.insertAmount(pnr_number, amount);
		System.out.println("Result inside servlet"+result);
		if(result>0)
		{
			request.setAttribute("pnr_number", pnr_number);
			request.setAttribute("amount", amount);
			request.setAttribute("jdate", jdate);
			request.setAttribute("passenger", passenger);
			request.setAttribute("adult", adult);
			request.setAttribute("child", child);
			RequestDispatcher dispatcher = request.getRequestDispatcher("AddOns.jsp");
			dispatcher.forward(request, response);
		}
	}

}
