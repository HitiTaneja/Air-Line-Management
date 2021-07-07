<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="modal.Result1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form>
		<table  id="dataTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>Flight Days</th>
					<th>Flight Timings</th>
					<th>Types of Planes</th>
					<th>Classes Available</th>
					<th>Seat Available</th>
					<th>Price</th>
				</tr>
			</thead>
			<%
 				Result1 res = (Result1) request.getAttribute("result");
 			%>
			<tr>
				<td><%=res.getFlight_days()%></td>
				<td><%=res.getFlight_timings()%></td>
				<td><%=res.getFlight_plane_type()%></td>
				<td><%=res.getFlight_classes()%></td>
				<td><%=res.getFlight_seat_available() %></td>
				<td><%=res.getFlight_price() %></td>
			</tr>
			</tbody>
		</table>
	</form>
</body>
</html>