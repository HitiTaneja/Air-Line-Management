package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.main.SearchBy;
import hibernate.modal.Flight;
@WebServlet("/SearchByASD")
public class SearchByASD extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String airline =  request.getParameter("airline");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		SearchBy service = new SearchBy();
		List<Flight> result = service.searchByASD(airline, source, destination);
		if(result!=null)
		{
			request.setAttribute("result", result);
			RequestDispatcher dispatcher = request.getRequestDispatcher("SearchResultASD.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
