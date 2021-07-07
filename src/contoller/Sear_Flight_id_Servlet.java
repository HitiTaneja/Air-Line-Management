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
import service.Sear_Flight_id_Service;
@WebServlet("/Sear_Fl")
public class Sear_Flight_id_Servlet extends HttpServlet 
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		
		String flightid = request.getParameter("id");
		
		Sear_Flight_id_Service service = new Sear_Flight_id_Service();
		List<Flight> result = service.search(flightid);
		RequestDispatcher rd = null;
		if(result!=null)
		{
			request.setAttribute("result", result);
			rd = request.getRequestDispatcher("Search_Result_I.jsp");
			rd.forward(request, response);
		}
	}
}
