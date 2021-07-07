<%@page import="hibernate.main.BookDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Make Payment</title>
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
<form action="ResultBooking" method="post">
	<div id="flight-search" class="container rounded mt-3 p-0">
		<div class="col text-center">
			<div class="row w-200 ml-10 py-4 border-bottom text-center bg-dark text-white">
				<div class="container rounded mt-2 p-10">Payment Details</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="pnr_number" class="col-sm-2 col-form-label">PNR Number</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="pnr_number" name= "pnr_number"value="<%=request.getAttribute("pnr_number")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="flight_code" class="col-sm-2 col-form-label">Flight Code</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="flight_code" name= "flight_code"value="<%=request.getAttribute("flight_code")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="airlineid" class="col-sm-2 col-form-label">Airline Id</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="airlineid" name= "airlineid"value="<%=request.getAttribute("airlineid")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="class_type" class="col-sm-2 col-form-label">Class Type</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="class_type" name= "class_type"value="<%=request.getAttribute("class_type")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="source" class="col-sm-2 col-form-label">Source</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="source" name= "source"value="<%=request.getAttribute("source")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="destination" class="col-sm-2 col-form-label">Destination</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="destination" name= "destination"value="<%=request.getAttribute("destination")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="jdate" class="col-sm-2 col-form-label">Date of Travel</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="jdate" name= "jdate"value="<%=request.getAttribute("jdate")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="child" class="col-sm-2 col-form-label">No. of Child</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="child" name= "child"value="<%=request.getAttribute("child")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="adult" class="col-sm-2 col-form-label">No. of Adult</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="adult" name= "adult"value="<%=request.getAttribute("adult")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="pass1" class="col-sm-2 col-form-label">Passenger Name</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="pass1" name= "pass1"value="<%=request.getAttribute("pass1")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="pass2" class="col-sm-2 col-form-label">Passenger Name</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="pass2" name= "pass2"value="<%=request.getAttribute("pass2")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="pass3" class="col-sm-2 col-form-label">Passenger Name</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="pass3" name= "pass3"value="<%=request.getAttribute("pass3")%>">
				</div>
		</div>
		<div class="form-group row">
			<label for="pass4" class="col-sm-2 col-form-label">Passenger Name</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="pass4" name= "pass4"value="<%=request.getAttribute("pass4")%>">
				</div>
		</div>
	<%
		BookDetails bd =  new BookDetails();
		String fclass = request.getAttribute("class_type").toString();
		int adult = (int)request.getAttribute("adult");
		int child = (int)request.getAttribute("child");
		String flight_code = request.getAttribute("flight_code").toString();
		int totalPrice = bd.getFlightPrice(fclass, adult, child, flight_code);	
	%>
	<div class="form-group row">
		<label for="amount" class="col-sm-2 col-form-label">Amount to be paid</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext"
					id="amount" name= "amount"value="<%=totalPrice%>">
			</div>
	</div>
	<div class="col text-center">
	<button class="btn btn-dark ">Proceed</button>
	</div>
	</div>
</form>
<%@include file="Footer.jsp" %>

</body>
</html>