package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.main.AddOnsDetails;
@WebServlet("/AddOns")
public class AddOns extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		String category = request.getParameter("category");
		String seat_location = request.getParameter("seat_location");
		String meal_type = request.getParameter("meal_type");

		String pnr_number = request.getParameter("pnr_number");
		String jdate = request.getParameter("jdate");
		int passenger = Integer.parseInt(request.getParameter("passenger"));
		float amount = Float.parseFloat(request.getParameter("amount"));
		int adult = Integer.parseInt(request.getParameter("adult"));
		int child = Integer.parseInt(request.getParameter("child"));
		float amountSub = 0, otherCharges=0;
		
		if(category=="null" && seat_location=="null" && meal_type=="null")
		{
			request.setAttribute("amountSub", amountSub);
			request.setAttribute("pnr_number", pnr_number);
			request.setAttribute("jdate", jdate);
			request.setAttribute("passenger", passenger);
			request.setAttribute("adult", adult);
			request.setAttribute("child", child);
			request.setAttribute("amount", amount);
			request.setAttribute("otherCharges", otherCharges);
			RequestDispatcher requestDispatcher  = request.getRequestDispatcher("FareSummary.jsp");
			requestDispatcher.forward(request, response);		
		}
		else
		{
			AddOnsDetails aod = new AddOnsDetails();
			amountSub = aod.getAddOnsPrice(category, seat_location, meal_type, amount);
			otherCharges = amountSub - amount;
			request.setAttribute("amountSub", amountSub);
			request.setAttribute("pnr_number", pnr_number);
			request.setAttribute("jdate", jdate);
			request.setAttribute("passenger", passenger);
			request.setAttribute("adult", adult);
			request.setAttribute("child", child);
			request.setAttribute("amount", amount);
			request.setAttribute("otherCharges", otherCharges);
			RequestDispatcher requestDispatcher  = request.getRequestDispatcher("FareSummary.jsp");
			requestDispatcher.forward(request, response);
		}
				
	}
}
