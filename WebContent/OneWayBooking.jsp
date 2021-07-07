<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>One Way Booking</title>
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

#passenger-details {
	background: #fff;
	min-height: 50vh;
}

#fare-summary {
	background: #fff;
	min-height: 50vh;
}

.div-headers {
	font-size: 1.3rem;
}

.description {
	font-size: 0.6em;
}

.booking-radio {
	display: inline-block !important;
	opacity: 1 !important;
	width: 20px;
}

.radio-text {
	margin-top: -1rem;
}

.booking-checkbox {
	display: inline-block !important;
	opacity: 1 !important;
	width: 20px;
}

.checkbox-text {
	margin-top: -1rem;
}

#flight-search {
	background: #fff;
	min-height: 20vh;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
<form action="Booking" method="post">
	<div id="flight-search" class="container rounded mt-3 p-0">
		<div class="col text-center">
			<div class="row w-200 ml-10 py-4 border-bottom text-center bg-dark text-white">
				<div class="container rounded mt-2 p-10">Booking Details</div>
			</div>
			<div class="form-group row">
				<label for="flight_code" class="col-sm-2 col-form-label">Flight Code</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="flight_code" name= "flight_code"value="<%=request.getParameter("flight_code")%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="airlineid" class="col-sm-2 col-form-label">Airline Id</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="airlineid" name="airlineid" value="<%=request.getParameter("airlineid")%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="class_type" class="col-sm-2 col-form-label">Class
					Type</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="class_type" name="class_type" value="<%=request.getParameter("class_type")%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="source" class="col-sm-2 col-form-label">Source</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext"
						id="source" name="source" value="<%=request.getParameter("source")%>">
					</div>
			</div>
			<div class="form-group row" >
				<label for="destination" class="col-sm-2 col-form-label">Destination</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext"
							id="destination" name="destination" value="<%=request.getParameter("destination")%>">
					</div>
			</div>
			<div class="form-group row">
				<label for="jdate" class="col-sm-2 col-form-label">Date of Travel</label>
				<div class="col-sm-10">
				<%-- <%String jdate = request.getParameter("jdate").toString();
						SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
						Date da = sdf.parse(jdate);%> --%>
					<input type="text" readonly class="form-control-plaintext"
					id="jdate" name="jdate" value="<%=request.getParameter("jdate")%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="child" class="col-sm-2 col-form-label">No of Child</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="child" name="child" value="<%=request.getParameter("child")%>" >
				</div>
			</div>
			<div class="form-group row">
				<label for="adult" class="col-sm-2 col-form-label">No of Adult</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
					id="adult" name="adult" value="<%=request.getParameter("adult")%>" >
				</div>
			</div>
			<div class="form-group row">
				<label for="pass1" class="col-sm-2 col-form-label">Passenger Name 1</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="pass1" name="pass1" placeholder="Enter passenger name 1" >
				</div>
			</div>
			<div class="form-group row">
				<label for="pass2" class="col-sm-2 col-form-label">Passenger Name 2</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="pass2" name="pass2" placeholder="Enter passenger name 2" >
				</div>
			</div>
			<div class="form-group row" >
				<label for="pass3" class="col-sm-2 col-form-label">Passenger Name 3</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="pass3" name="pass3" placeholder="Enter passenger name 3">
				</div>
			</div>
			<div class="form-group row">
				<label for="pass4" class="col-sm-2 col-form-label">Passenger Name 4</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="pass4" name="pass4" placeholder="Enter passenger name 4" >
				</div>
			</div>
			<div class="form-group row">
				<label for="contactNo" class="col-sm-2 col-form-label">Contact Number</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="contactNo" name="contactNo" placeholder="Enter contact number" >
				</div>
			</div>
			<div class="form-group row">
				<label for="emailId" class="col-sm-2 col-form-label">Email Id</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="emailId" name="emailId" placeholder="Enter email id" >
				</div>
			</div>
				<button class="btn btn-dark ;col text-center">Proceed</button>      		
   		</div>
	</div>
</form>
	<%@include file="Footer.jsp" %>
</body>
</html>