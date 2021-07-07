<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Search</title>
</head>
<body>
<p>Search by Flight name, flight id, source and destination</p>
<form action="Search_Servlet" method="post">
<table>
	<tr>
		<td>Enter Flight Name : <input type="text" name="name" placeholder="Enter Flight name"></td>
	</tr>
	<tr>
		<td>Enter flight Id : <input type="text" name="flightId" placeholder="Enter the flight Id"></td>
	</tr>
	<tr>	
		<td>Enter Source :  <input type="text" name="source" placeholder ="Enter source name" ></td>
	</tr>
	<tr>
		<td>Enter Destination : <input type="text" name="destination" placeholder="Enter destination name"></td>
	</tr>
	<tr>
		<td><input type="submit" value="submit"></td>
	</tr>
</table>
</form>
<hr>
<p>Search by Flight Id:</p>
<form action="Sear_Fl" method ="post">
<table>
	<tr>
		<td>Enter Flight Id : <input type="text" name="id" placeholder="Enter Flight Id"></td>
	</tr>
	<tr>
		<td><input type="submit" value="Search"></td>
	</tr>
</table>
</form>
<hr>
<p>Search by Airline name, Source and Destination :</p> 
<form action="Sear_Name_Sour_Desti " method = "post">
<table>
	<tr>
		<td>Enter Airline Name : <input type="text" name="airline" placeholder="Enter Airline Name"></td>
	</tr>
	<tr>
		<td>Enter Source : <input type="text" name= "source" placeholder="Enter Source"></td>
	</tr>
	<tr>
		<td>Enter Destination : <input type="text" name="destination" placeholder="Enter Destination"></td>
	</tr>
	<tr>
		<td><input type="submit" value="Search"></td>
	</tr>
</table>
</form>
<hr>
<p>Search by Source, Destination and Date:</p>
<form action = "Sear_Sour_Dest_Date_Servlet " method = "post">
<table>
	<tr>
		<td>Enter Source : <input type="text" name="source" placeholder="Enter Source"></td>
	</tr>
	<tr>
		<td>Enter Destination : <input type="text" name="destination" placeholder="Enter Destination"></td>
	</tr>
	<tr>	
		<td>Enter Date : <input type="date" name="date" placeholder= "Enter Date"></td>
	</tr>
	<tr>
		<td><input type="submit" value="Search"></td>
	</tr>
</table>
</form>
</body>
</html>