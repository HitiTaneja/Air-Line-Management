package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.main.SearchBy;
import hibernate.modal.Flight;

@WebServlet("/SearchBySD")
public class SearchBySD extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		
		SearchBy service = new SearchBy();
		List<Flight> result = service.searchBySD(source, destination);
		
		if(result!=null)
		{
			request.setAttribute("result", result);
			RequestDispatcher dispatcher = request.getRequestDispatcher("SearchResultSD.jsp");
			System.out.println("Servlet "+result.toString());
			dispatcher.forward(request, response);
		}
	}
}