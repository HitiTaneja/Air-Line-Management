<%@page import="hibernate.modal.Booking_Details"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
function printDiv(divName){
	var printContents = document.getElementById(divName).innerHTML;
	var originalContents = document.body.innerHTML;
	document.body.innerHTML = printContents;
	window.print();
	document.body.innerHTML = originalContents;
}
</script>
<title>Booking Details</title>
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
<div id ="bookingPrint">
	<div id="booking" class="container rounded mt-3 py-3 px-5">
		<div class="w-100 ml-0">
			<div class="row w-100 ml-0 py-2 ">
				<div class="col-md-12">
					<h3 style="color: #007bff">Booking Details</h3>
					<hr color="#007bff">
				</div>
			</div>
			<form action=" " method="post" class="bg-white" >
				<div class="row w-100 ml-0 py-2 text-center">
					<div class="col-md-2">
						<p><img src=<%=imagename%> alt="logo" style="width: 50px; border-radius: 0.5rem;"></p>
						<p><%=bd.getAirline().getAirlinename()%>
						-
						<%=bd.getFlight().getFlight_code()%></p>
					</div>
					<div class="col-md-2">
						<p><%=bd.getFlight().getDeparture()%></p>
						<p class="text-muted"><%=bd.getFlight().getSource()%></p>
					</div>
					<div class="col-md-2">
						<p>1 Day</p>
					</div>
					<div class="col-md-2">
						<p>Class Type</p>
						<p><%=bd.getFclass()%></p>
					</div>
					<div class="col-md-2">
						<p>Travelers</p>
						<p><%=bd.getAdult_num()+bd.getChild_num()%></p>
					</div>	
				</div>
				<div class="row w-100 ml-0 py-2 text-center">
					<div class="col-md-3">
						<p>PNR Number</p>
					</div>
					<div class="col-md-3">
						<p><input type="text" name="bookid" class="form-control" value=<%=bd.getPnr_number()%> readonly="readonly"></p>
					</div>
					<div class="col-md-3">
						<p>Booking Status</p>
					</div>
					<div class="col-md-3">
						<p><input type="text" class="form-control" name="bookstatus" value=<%=bd.getStatus()%> readonly="readonly"></p>
					</div>
				</div>
				<div class="row w-100 ml-0 py-2 text-center">
					<div class="col-md-3">
						<p>Airline Id</p>
					</div>
					<div class="col-md-3">
						<p><input type="text" class="form-control" name="jdate" value=<%=bd.getAirline().getAirlineid()%> readonly="readonly"></p>
					</div>
					<div class="col-md-3">
						<p>Date Of Journey</p>
					</div>
					<div class="col-md-3">
						<p><input type="text" class="form-control" name="jdate" value=<%=bd.getDate_of_travel()%> readonly="readonly"></p>
					</div>
				</div>
				<div class="card mt-2 mx-3" >
					<div class="card-header bg-dark text-white text-capitalize">Passenger Details</div>
					<div class="card-body">
						<div class="row w-100 ml-0 py-2 text-center">
							<div class="col-md-3">
								<p>Contact No</p>
							</div>
							<div class="col-md-3">
								<p> <input type="text" class="form-control" name="contactNo" value=<%=bd.getContactNo()%> readonly="readonly"></p>
							</div>
							<div class="col-md-3">
								<p>Email Id</p>
							</div>
							<div class="col-md-3">
								<p> <input type="text" class="form-control" name="email" value=<%=bd.getEmailId()%> readonly="readonly"></p>
							</div>
						</div>
						<div class="row w-100 ml-0 py-2 text-center">
							<div class="col-md-3">
								<p>Adults</p>
							</div>
							<div class="col-md-3">
								<p> <input type="text" name="adult" class="form-control" value=<%=bd.getAdult_num()%> readonly="readonly"></p>
							</div>
							<div class="col-md-3">
								<p>Children</p>
							</div>
							<div class="col-md-3">
								<p> <input type="text" name="child" class="form-control" value=<%=bd.getChild_num()%> readonly="readonly"></p>
							</div>
						</div>
					</div>
				</div>
				<br>
				<p align="center"><button class="btn btn-success" onclick="printDiv('bookingPrint')">Print</button></p>
			</form>
		</div>
	</div>
</div>
<%} %>
<%@include file="Footer.jsp" %>
</body>
</html>