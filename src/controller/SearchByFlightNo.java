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
import hibernate.modal.Flight;
@WebServlet("/SearchByFlightNo")
public class SearchByFlightNo extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		String flightNo = request.getParameter("flightNo");
		Search service = new Search();
		List<Flight> result = service.searchByFlightNo(flightNo);
		if(result!=null)
		{
			System.out.println("Inside if(result != null)");
			request.setAttribute("result", result);
			RequestDispatcher dispatcher = request.getRequestDispatcher("SearchResultFlightNo.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
