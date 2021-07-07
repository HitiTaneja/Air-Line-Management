<%@page import="org.hibernate.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="hibernate.modal.Flight"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Flight</title>
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
		<div class="col-md-2">Airline</div>
			<div class="col-md-2">Depart</div>
			<div class="col-md-2">Arrival</div>
			<div class="col-md-2">Days</div> 
			<div class="col-md-2">Seats</div>
			<div class="col-md-2">Price</div>
	</div>
	<%
		List<Flight> list = (ArrayList<Flight>)request.getAttribute("result");
			if(list.size()==0){
		%>
		<h3 align="center">No flights available</h3>
		<%
			}
			for (Flight b : list) {
				System.out.println("Flight Id:"+b.getFlight_code());
			
				String imagename = "images/" + b.getAirline().getAirlinename().toLowerCase().trim().replace(" ", "") + ".jpg";
		%>
		<div class="w-100 ml-0 pt-2">
			<div class="alert alert-warning">
				<span class="badge badge-success">Hot Deal</span> Book with ICICI
				netbanking and get instant cashback. <a href="">Click here</a>
			</div>
			<div class="row w-100 ml-0 py-2 text-center">
				<div class="col-md-2">
					<p>
						<img src=<%=imagename%> alt="logo"
							style="width: 50px; border-radius: 0.5rem;">
					</p>
					<p><%=b.getAirline().getAirlinename()%> - <%=b.getFlight_code() %></p>
				</div>
				<div class="col-md-2">
					<p><%=b.getDeparture()%></p>
					<p class="text-muted"><%=b.getSource()%></p>
					
				</div>
				<div class="col-md-2">
					<p><%=b.getArrival()%></p>
					<p class="text-muted"><%=b.getDestination()%></p>
					<p>
						<a href="FareRules.jsp" target="new">Fare rules</a>
					</p>
				</div>
				<div class="col-md-2">
					<p><%=b.getDays()%></p>
					 <%-- <p class="text-muted"><%=b.getClass()%></p> --%>
					<p>
						<a href="BagInfo.jsp" target="new">Baggage Information</a>
					</p>
				</div>
				<%-- <div class="col-md-2">
					<span class="badge badge-warning"><%=b.getDuration()%></span><br> 
					<!-- <span class="text-warning font-weight-bold">Left</span> -->
				</div> --%>
				<div class="col-md-2">
					Business Class<span class="badge badge-warning"><%=b.getSeat_availability().getBusiness_class()%></span><br>
					<span class="text-warning font-weight-bold">Left</span><br>
					Economy Class<span class="badge badge-warning"><%=b.getSeat_availability().getEconomy_class()%></span> 
					<span class="text-warning font-weight-bold">Left</span>
				</div>
				<div class="col-md-2">
					<p>Business Adult : <%= b.getFlight_price().getBusiness_adult() %></p>
					<p>Economy Adult : <%= b.getFlight_price().getEconomy_adult() %></p>
					<%-- <%=b.getSeat_cost() * Integer.parseInt(passengers)--%> 
					<%-- <p>
					<form action="OneWayBooking.jsp" id="flight-search" method="post">
					<input type="hidden" name="airlineid" value="<%=b.getAirline().getAirlineid()%>">
					<input type="hidden" name="class_type" value="<%=request.getAttribute("class_type")%>"> 
					<input type="hidden" name="flight_code" value="<%=b.getFlight_code()%>">
					
					<input type="hidden" name="source" value="<%=b.getSource()%>">
					<input type="hidden" name="destination" value="<%=b.getDestination()%>">
					
					<input type="hidden" name="adult" value="<%=request.getParameter("adult")%>">
					<input type="hidden" name="child" value="<%=request.getParameter("child")%>">
					
					<input type="hidden" name="charge" value="<%=b.getSeat_cost()%>"> 
					
					
					<button class="btn btn-warning" type="submit">Book now</button>
						<!-- <input type='submit' class='btn btn-warning' value='Book now'> -->
					</form>
					</p> --%> 
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
	<%@include file="Footer.jsp" %>
</body>
</html>