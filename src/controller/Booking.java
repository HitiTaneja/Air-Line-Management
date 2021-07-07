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
@WebServlet("/Booking")
public class Booking extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
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
		String contactNo = request.getParameter("contactNo");
		String emailId = request.getParameter("emailId");
		
		String status = "Not confirmed";
		
		Random rand = new Random();
		int pnr_number = rand.nextInt(100);
		
		Flight f = new Flight();
		f.setFlight_code(flight_code);
		f.setSource(source);
		f.setDestination(destination);
		Airline a = new Airline();
		a.setAirlineid(airlineid);
		
		System.out.println("Flight code "+flight_code+"\nAirline id "+airlineid+" \npass1 "+pass1+" \npass2 "+pass2+
				"\npass3 "+pass3+" \npass4 "+pass4+" \nfclass "+class_type+" \nstatus "+status+" \ndate "+jdate+
				" \nchild "+child+" \n adult "+adult+" \npnr num "+pnr_number+" \ncontact No "+contactNo+"\nemail id "+emailId);
		
		Booking_Details bd = new Booking_Details();
		bd.setPnr_number(pnr_number);
		bd.setPass_name1(pass1);
		bd.setPass_name2(pass2);
		bd.setPass_name3(pass3);
		bd.setPass_name4(pass4);
		bd.setFclass(class_type);
		bd.setStatus(status);
		bd.setDate_of_travel(jdate);
		bd.setChild_num(child);
		bd.setAdult_num(adult);
		bd.setFlight(f);
		bd.setAirline(a);
		bd.setAmount(0.0f);
		bd.setContactNo(contactNo);
		bd.setEmailId(emailId);
		boolean result = BookDetails.insertValues(bd);
		if(result == true)
		{
			request.setAttribute("pnr_number", pnr_number);
			request.setAttribute("flight_code", flight_code);
			request.setAttribute("airlineid", airlineid);
			request.setAttribute("class_type", class_type);
			request.setAttribute("source", source);
			request.setAttribute("destination", destination);
			request.setAttribute("jdate", jdate);
			request.setAttribute("child", child);
			request.setAttribute("adult", adult);
			request.setAttribute("pass1", pass1);
			request.setAttribute("pass2", pass2);
			request.setAttribute("pass3", pass3);
			request.setAttribute("pass4", pass4);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ResultBooking.jsp");
			dispatcher.forward(request, response);
		}		
	}

}
