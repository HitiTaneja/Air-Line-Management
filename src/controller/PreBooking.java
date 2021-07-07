package controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.main.BookDetails;
import hibernate.modal.Airline;
import hibernate.modal.Booking_Details;
import hibernate.modal.Flight;
@WebServlet("/PreBooking")
public class PreBooking extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		String flight_code = request.getParameter("flight_code");
		String airlineid = request.getParameter("airlineid");
		String fclass = request.getParameter("fclass");
		String pass_name1 = request.getParameter("pass_name1");
		String pass_name2 = request.getParameter("pass_name2");
		String pass_name3 = request.getParameter("pass_name3");
		String pass_name4 = request.getParameter("pass_name4");
		String dot = request.getParameter("datepicker");
		int adult_num = Integer.parseInt(request.getParameter("adult_num"));
		int child_num = Integer.parseInt(request.getParameter("child_num"));
		String status = "Not confirmed";
		Random rand = new Random();
		int pnr_number = rand.nextInt(100);
		Flight f = new Flight();
		f.setFlight_code(flight_code);
		Airline a = new Airline();
		a.setAirlineid(airlineid);
		Booking_Details bd = new Booking_Details();
		bd.setPnr_number(pnr_number);
		bd.setPass_name1(pass_name1);
		bd.setPass_name2(pass_name2);
		bd.setPass_name3(pass_name3);
		bd.setPass_name4(pass_name4);
		bd.setFclass(fclass);
		bd.setStatus(status);
		bd.setDate_of_travel(dot);
		bd.setChild_num(child_num);
		bd.setAdult_num(adult_num);
		bd.setFlight(f);
		bd.setAirline(a);
		int result = BookDetails.insertValues(bd);
		if(result>0)
		{
			request.setAttribute("pnr_number", pnr_number);
			request.setAttribute("result", result);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ResultPreBooking.jsp");
			dispatcher.forward(request, response);
		}
	}
}
