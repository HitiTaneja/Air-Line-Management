package contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.Flight;
import service.Sear_Name_Sour_Desti_Service;

@WebServlet("/Sear_Name_Sour_Desti")
public class Sear_Name_Sour_Desti_Servlet extends HttpServlet 
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		
		String airline = request.getParameter("airline");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		
		Sear_Name_Sour_Desti_Service service = new Sear_Name_Sour_Desti_Service();
		List<Flight> result = service.search(airline, source, destination);
		RequestDispatcher rd = null;
		if(result!=null)
		{
			request.setAttribute("result", result);
			rd = request.getRequestDispatcher("Search_Result_Nsd.jsp");
			rd.forward(request, response);
		}		
	}
}