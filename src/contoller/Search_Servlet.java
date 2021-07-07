package contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.Result;
import service.Search_Service;

@WebServlet("/Search_Servlet")
public class Search_Servlet extends HttpServlet 
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		String flightId = request.getParameter("flightId");
		String name = request.getParameter("name");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");		
	
		Search_Service ss = new Search_Service();
		
		Result res = ss.select(flightId, name, source, destination);
		RequestDispatcher rd = null;
		if(res!=null)
		{
			request.setAttribute("result", res);
			rd = request.getRequestDispatcher("Search_Result_Nisd.jsp");
			rd.forward(request, response);
		}
		else
		{
			out.println("Nothing to show");
		}
	}
}
