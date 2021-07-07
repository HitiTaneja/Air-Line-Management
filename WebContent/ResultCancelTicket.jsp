<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="hibernate.modal.Booking_Details"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancel Ticket</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<style>
		#booking {
		background: #fff;
		min-height: 19vh;
	}
</style>

</head>
<body>
<%@include file="navbar.jsp"%>
<%
List<Booking_Details> list = (List<Booking_Details>)request.getAttribute("list");
for(Booking_Details bd : list)
{
	String imagename = "images/" + bd.getAirline().getAirlinename().toLowerCase().trim().replace(" ", "") + ".jpg";
%>
<div id="booking" class="container rounded mt-3 py-3 px-5">
	<div class="w-100 ml-0">
		<div class="row w-100 ml-0 py-2 ">
			<div class="col-md-12">
				<h3 style="color: #007bff">Details</h3>
				<hr color="#007bff">
			</div>
		</div>
		<form action="ConfirmCancel" method="post" class="bg-white">
			<div class="row w-100 ml-0 py-2 text-center">
				<div class="col-md-2">
					<p>
						<img src=<%=imagename%> alt="logo"
							style="width: 50px; border-radius: 0.5rem;">
					</p>
					<p><%=bd.getAirline().getAirlinename()%>
						-
					<%=bd.getFlight().getFlight_code()%></p>
				</div>
				<div class="col-md-2">
					<p><%=bd.getFlight().getDeparture()%></p>
					<p class="text-muted"><%=bd.getFlight().getSource()%></p>
				</div>
				<div class="col-md-2">
					<p><%=bd.getFlight().getArrival()%></p>
					<p class="text-muted"><%=bd.getFlight().getDestination()%></p>
				</div>
				<div class="col-md-2">
					<p>1 Day</p>
				</div>
				<div class="col-md-2">
					<p><%=bd.getFclass()%></p>
				</div>
				<div class="col-md-2">
					<p>Travelers</p>
					<p><%=bd.getAdult_num() + bd.getChild_num()%></p>
				</div>
			</div>
			<div class="row w-100 ml-0 py-2 text-center">
				<div class="col-md-3">
						<p>PNR Number</p>
				</div>
				<div class="col-md-3">
					<p>
						<input type="text" name="pnr_number" class="form-control"
							value=<%=bd.getPnr_number()%> readonly="readonly">
					</p>
				</div>
				<div class="col-md-3">
					<p>Booking Status</p>
				</div>
				<div class="col-md-3">
					<p>
						<input type="text" class="form-control" name="bookstatus"
							value=<%=bd.getStatus()%> readonly="readonly">
					</p>
				</div>
			</div>
			<div class="row w-100 ml-0 py-2 text-center">
				<div class="col-md-3">
					<p>Airline Id</p>
				</div>
				<div class="col-md-3">
					<p>
						<input type="text" name="dtOfBooking" class="form-control"
							value=<%=bd.getAirline().getAirlineid()%> readonly="readonly">
					</p>
				</div>
				<div class="col-md-3">
					<p>Date Of Journey</p>
				</div>
				<div class="col-md-3">
					<p>
						<input type="text" class="form-control" name="jdate"
							value=<%=bd.getDate_of_travel()%> readonly="readonly">
					</p>
				</div>
			</div>
			
			<div class="card mt-2 mx-3">
				<div class="card-header bg-dark text-white text-capitalize">Passenger Details</div>
				<div class="card-body">
					<div class="row w-100 ml-0 py-2 text-center">
						<div class="col-md-3">
							<p>Contact No</p>
						</div>
						<div class="col-md-3">
							<p>
								<input type="text" class="form-control" name="contactNo"
									value=<%=bd.getContactNo()%> readonly="readonly">
							</p>
						</div>
						<div class="col-md-3">
							<p>Email Id</p>
						</div>
						<div class="col-md-3">
							<p>
								<input type="text" class="form-control" name="email"
									value=<%=bd.getEmailId()%> readonly="readonly">
							</p>
						</div>
					</div>
					<div class="row w-100 ml-0 py-2 text-center">
						<div class="col-md-3">
							<p>Adults</p>
						</div>
						<div class="col-md-3">
							<p>
								<input type="text" name="adult" class="form-control"
									value=<%=bd.getAdult_num()%> readonly="readonly">
							</p>
						</div>
						<div class="col-md-3">
							<p>Children</p>
						</div>
						<div class="col-md-3">
							<p>
								<input type="text" name="child" class="form-control"
									value=<%=bd.getChild_num()%> readonly="readonly">
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row w-100 ml-0 py-2 text-center">
				<div class="col-md-4">
					<p>
							Total Fare :
							<%=bd.getAmount() %></p>
				</div>
				<%
				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
				Date journeyDate = sd.parse(bd.getDate_of_travel());  
				//String departureTime = booking.getFlight().getDeparture_time();
				Date d2 = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
				long difference = journeyDate.getTime() - d2.getTime();
				float days = (difference / (60 * 60 * 1000 * 24) + 1);
				long diffHours = difference / (60 * 60 * 1000) % 24;
				System.out.println(diffHours);
				System.out.println(days);
				if (days < 0) 
				{
					//result = false;
					System.out.println("Cancel not possible");
				}
				else 
				{
					double netFare = bd.getAmount();
					int refundFare = 0;
					if (days >= 7 && days <= 21) 
					{
						refundFare = (int) (netFare * 0.90);
						System.out.println("You get 90% dicount in your ticket"+refundFare);
					} 
					else if (days >= 3 && days <= 6) 
					{
						refundFare = (int) (netFare * 0.50);
						System.out.println("You get 50% dicount in your ticket");
					}
					else if (days >= 1 && days <= 2)
					{
						refundFare = (int) (netFare * 0.25);
						System.out.println("You get 25% dicount in your ticket");
					}
					else if (days == 0) 
					{
						refundFare = (int) (netFare * 0.10);
						System.out.println("You get 10% dicount in your ticket");
					}
					%>
					<div class="col-md-4">
					<p>
							Refund Amount :
							<%=refundFare%></p>
					<p>
							Cancellation Charges:
							<%
								int passengers = bd.getAdult_num()+bd.getChild_num();
								int cancellationCharges = passengers * 200;
							%><%=cancellationCharges %></p>
					</div>
					<div class="col-md-4">
						<p>
							<button type="Submit" name="submit" class="btn btn-success">Cancel Booking</button>
						</p>
					</div>
			</div>
		</form>
	</div>
</div>
<%}} %>
<%@include file="Footer.jsp" %>
</body>
</html>