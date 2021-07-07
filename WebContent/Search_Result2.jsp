<%@page import="java.util.ArrayList"%>
<%@page import="modal.Flight"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table id="dataTable" width="100%" cellspacing="0">
		<thead>
			<tr>
				<th>Flight Id</th>
				<th>Flight Classes</th>
				<th>Flight Seat Available</th>
				<th>Flight Price</th>
				<th>Flight Source</th>
				<th>Flight Destination</th>
				<th>Flight Days</th>
				<th>Flight Timings</th>
				<th>Flight Plane Type</th>
				<th>Flight Date</th>
				<th>Flight Name</th>
			</tr>
		</thead>
		<tbody>
			<%
 						List<Flight> list = new ArrayList<>();
 						list = (List) request.getAttribute("result");
 						for(int i =0;i<list.size();i++)
 						{
 					%>
			<tr>
				<td><%=list.get(i).getFlight_id() %></td>
				<td><%=list.get(i).getFlight_classes() %></td>
				<td><%=list.get(i).getFlight_seat_available() %></td>
				<td><%=list.get(i).getFlight_price() %></td>
				<td><%=list.get(i).getFlight_source() %></td>
				<td><%=list.get(i).getFlight_destination() %></td>
				<td><%=list.get(i).getFlight_days() %></td>
				<td><%=list.get(i).getFlight_timings() %></td>
				<td><%=list.get(i).getFlight_plane_type() %></td>
				<td><%=list.get(i).getFlight_date() %></td>
				<td><%=list.get(i).getFlight_name() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>