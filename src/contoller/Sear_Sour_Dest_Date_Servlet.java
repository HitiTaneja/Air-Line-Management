package contoller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.Result1;
import service.Sear_Sour_Dest_Date_Service;

@WebServlet("/Sear_Sour_Dest_Date_Servlet")
public class Sear_Sour_Dest_Date_Servlet extends HttpServlet 
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		System.out.println("Inside servlet");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String date = request.getParameter("date");
		
		Sear_Sour_Dest_Date_Service service = new Sear_Sour_Dest_Date_Service();
		Result1 res = service.select(source, destination, date);
		RequestDispatcher rd = null;
		if(res!=null)
		{
			request.setAttribute("result", res);
			rd = request.getRequestDispatcher("Search_Result_Sdd.jsp");
			rd.forward(request, response);
		}
		else
		{
			out.println("Nothing to show");
		}
		
	}

}
