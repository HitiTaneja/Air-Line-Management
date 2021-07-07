package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.main.SearchBy;
import hibernate.modal.Flight;

@WebServlet("/SearchByDate")
public class SearchByDate extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		String date = request.getParameter("date-withminvalue");
		SearchBy service = new SearchBy();
		List<Flight> result = service.searchByDate();
		if(result!=null)
		{
			request.setAttribute("result", result);
			RequestDispatcher dispatcher = request.getRequestDispatcher("SearchResultDate.jsp");
			dispatcher.forward(request, response);
		}
	}

}
