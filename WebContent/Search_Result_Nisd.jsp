<%@page import="modal.Result"%>
<%@page import="modal.Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.Search_Service"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				</tr>
			</thead>
			<tbody>
				<%
 				Result res = (Result) request.getAttribute("result");
 				%>
				<tr>
					<td><%=res.getFlight_days()%></td>
					<td><%=res.getFlight_timings()%></td>
					<td><%=res.getFlight_plane_type()%></td>
					<td><%=res.getFlight_classes()%></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>