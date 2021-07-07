package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.main.Search;
import hibernate.modal.Flight;

@WebServlet("/SearchBy")
public class SearchBy extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String jdate = request.getParameter("date-withminvalue");
		String class_type = request.getParameter("class_type");
		String adult = request.getParameter("adult");
		String child = request.getParameter("child");
		String airline = request.getParameter("airline");
		String passengers = (Integer.parseInt(adult)+Integer.parseInt(child))+"";
		
		Search sea = new Search();
		List<Flight> list = new ArrayList<>();
		
		
		if(!(airline.equals("0") && source!="Select" && destination!="Select"))
		{
			list = sea.flightSearch(airline, source, destination);
			if(list!=null)
			{
				request.setAttribute("result", list);
				request.setAttribute("source", source);
				request.setAttribute("destination", destination);
				request.setAttribute("jdate", jdate);
				request.setAttribute("passenger", passengers);
				request.setAttribute("class_type", class_type);
				RequestDispatcher dispatcher = request.getRequestDispatcher("SearchResult.jsp");
				dispatcher.forward(request, response);
			}
		}
		else if(source != "Select" && destination != "Select")
		{
			System.out.println("inside else if");
			list = sea.flightSearch(source, destination);
			if(list!=null)
			{
				request.setAttribute("result", list);
				request.setAttribute("source", source);
				request.setAttribute("destination", destination);
				request.setAttribute("jdate", jdate);
				request.setAttribute("passenger", passengers);
				request.setAttribute("class_type", class_type);
				RequestDispatcher dispatcher = request.getRequestDispatcher("SearchResult.jsp");
				dispatcher.forward(request, response);
			}
		}
		else if(source != "Select" && destination != "Select" && jdate != "")
		{
			
		}
		
	}

}
