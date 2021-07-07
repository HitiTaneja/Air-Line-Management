<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="hibernate.modal.Flight"%>
   <%@page import="hibernate.modal.Flight_Price" %>
<%@page import="java.util.List"%>
<%@page import="hibernate.main.SearchBy"%>
  <%@page import="org.hibernate.Session"%>
    <%@ page import = "hibernate.util.HibernateUtil" %>
    <%@ page import = "org.hibernate.Query" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search By Source and Destination</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>Flight Code</th>
			<th>Arrival</th>
			<th>Departure</th>
			<th>Duration</th>
			<th>Airline Name</th>
			<th>Flight Type</th>
			<th>Days</th>
			<th>Type of Plane</th>
			<th>Business Class</th>
			<th>Economy Class</th>
		</tr>
	</thead>
	<tbody>
		<% List<Flight> list = (List<Flight>) request.getAttribute("result");
		
			for(Flight f : list)
			{
		%> 
		<tr>
			<td><%= f.getFlight_code() %></td>
			<td><%= f.getArrival() %></td>
			<td><%= f.getDeparture() %></td>
			<td><%= f.getDuration() %></td>
			<td><%= f.getAirline().getAirlinename() %></td>
			<td><%= f.getFlighttype() %></td>	
			<td><%= f.getDays() %></td>
			<td><%= f.getPlanetype() %></td>
			<td><%= f.getSeat_availability().getBusiness_class() %></td>
			<td><%= f.getSeat_availability().getEconomy_class() %></td>
		</tr>
		<%} %>
	</tbody>
</table>
 For Price : <a href="Price.jsp">Click Here</a>
Enter flight code : <input type="text" id="fc" name="fc"><br>
Enter Class : <input type="text" id="fclass" name="fclass"><br>
<button>Submit</button>
<%
String flight_code = request.getParameter("fc");
String fclass = request.getParameter("fclass");
Session sessn = HibernateUtil.getSessionFactory().getCurrentSession();
sessn.beginTransaction();
Query qy = sessn.createQuery("from Flight_Price where flight_code =:flight_code");
qy.setParameter("flight_code", flight_code);
List<Flight_Price> lit = qy.list();
if(fclass == "Business")
{
	for(Flight_Price fp : lit)
	{
%>
Business Adult : <%= fp.getBusiness_adult() %><br>
Business Child : <%= fp.getBusiness_child() %>
<%}}

else
{
	for(Flight_Price fp : lit)
	{
%>
Economy Adult : <%= fp.getEconomy_adult() %>
Economy Child : <%= fp.getEconomy_child() %>
<%}} %>
</body>
</html>