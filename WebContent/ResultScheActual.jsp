<%@page import="org.hibernate.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="hibernate.modal.Flight"%>
<%@page import="hibernate.Util.HibernateUtil"%>
<%@ page import = "org.hibernate.Query" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scheduled Flights Details</title>
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/magnific-popup/magnific-popup.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<style>
#flight-search {
	background: #fff;
	min-height: 20vh;
}
</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<div id="flight-search" class="container rounded mt-3 p-0">
<div class="row w-100 ml-0 py-4 border-bottom text-center bg-dark text-white">
		<div class="col-md-2">Flight Code</div>
			<div class="col-md-1">Source</div>
			<div class="col-md-2">Destination</div>
			<div class="col-md-1">Arrival</div> 
			<div class="col-md-2">Departure</div>
			<div class="col-md-2">New Arrival</div>
			<div class="col-md-2">New Departure</div>
	   </div>
	 <%
Session sessn = HibernateUtil.getSessionFactory().getCurrentSession();
sessn.beginTransaction();
Query query = sessn.createQuery("from Flight where status = 'Delayed'");
List<Flight> list =query.list();
if(list.size()==0){
%>
<h3 align="center">No flights available</h3>
<%} 
for(int i = 0;i<list.size();i++)
{
	String arrival = list.get(i).getArrival();
	String temp[] = arrival.split(":");
	int time = Integer.parseInt(temp[0])+1;
	String newArrival = String.valueOf(time)+":"+temp[1];
	
	String departure = list.get(i).getDeparture();
	String te[] = departure.split(":");
	int ti = Integer.parseInt(te[0])+1;
	String newDeparture = String.valueOf(ti)+":"+te[1];
	System.out.println("Flight Id:"+list.get(i).getFlight_code());	
%>
<div class="w-100 ml-0 pt-2">
	<div class="row w-100 ml-0 py-2 text-center">
		<div class="col-md-2">
			<p><%=list.get(i).getAirline().getAirlinename()%> - <%=list.get(i).getFlight_code() %></p>
		</div>
		<div class="col-md-1">
			<p><%=list.get(i).getSource()%></p>
		</div>
		<div class="col-md-2">
			<p><%=list.get(i).getDestination()%></p>
		</div>
		<div class="col-md-1">
			<p><%=list.get(i).getArrival()%></p>
		</div>
		<div class="col-md-2">
			<p><%=list.get(i).getDeparture()%></p> 
		</div>
		<div class="col-md-2">
			<p><%=newArrival %></p>
		</div>
		<div class="col-md-2">
			<p><%=newDeparture %></p>
		</div>
	</div>
</div>
<% } %>
</div> 
<%@include file="Footer.jsp" %>
</body>
</html>