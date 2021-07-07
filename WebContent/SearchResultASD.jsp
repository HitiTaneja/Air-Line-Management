<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="hibernate.modal.Flight"%>
<%@page import="java.util.List"%>
<%@page import="hibernate.main.SearchBy"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Result of ASD</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>Flight Code</th>
			<th>Source</th>
			<th>Destination</th>
			<th>Arrival</th>
			<th>Departure</th>
			<th>Duration</th>
			<th>Airline Id</th>
			<th>Days</th>
		</tr>
	</thead>
	<tbody>
		<% List<Flight> list = (List<Flight>) request.getAttribute("result");
		
			for(Flight f : list)
			{
		%> 
		<tr>
			<td><%= f.getFlight_code() %></td>
			<td><%= f.getSource() %></td>
			<td><%= f.getDestination() %></td>
			<td><%= f.getArrival() %></td>
			<td><%= f.getDeparture() %></td>
			<td><%= f.getDuration() %></td>
			<td><%= f.getAirline().getAirlineid() %></td>
			<td><%= f.getDays() %></td>
		</tr>
		<%} %>
	</tbody>
</table>
</body>
</html>