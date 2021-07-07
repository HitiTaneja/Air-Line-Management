<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add-Ons</title>
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
<form action="AddOns" method="post">
	<div id="flight-search" class="container rounded mt-3 p-0">
		<div class="col text-center">
			<div class="row w-200 ml-10 py-4 border-bottom text-center bg-dark text-white">
				<div class="container rounded mt-2 p-10">Add-Ons</div>
			</div>
		</div>
		<br>
		<input type="hidden" id="pnr_number" name="pnr_number" value="<%=request.getAttribute("pnr_number")%>">
		<input type="hidden" id="amount" name="amount" value="<%=request.getAttribute("amount")%>">
		<input type="hidden" id="jdate" name="jdate" value="<%=request.getAttribute("jdate")%>">
		<input type="hidden" id="passenger" name="passenger" value="<%=request.getAttribute("passenger")%>">
		<input type="hidden" id="adult" name="adult" value="<%=request.getAttribute("adult")%>">
		<input type="hidden" id="child" name="child" value="<%=request.getAttribute("child")%>">
		<div class="form-group row">
			<label for="category" class="col-sm-2 col-form-label">Select Category</label>
				<div class="col-sm-10">
					<input type="radio" id="category" name= "category"value="Student">Student<br>
					<input type="radio" id="category" name= "category"value="Handicapped">Handicapped<br>
					<input type="radio" id="category" name= "category"value="Senior Citizen">Senior Citizen<br>
					<input type="radio" id="category" name= "category"value="Airline Staff">Airline Staff<br>
					<input type="radio" id="category" name= "category"value="Defense Personnal">Defense Personnel<br>
				</div>
		</div>
		<br>
		<div class="form-group row">
			<label for="seat_location" class="col-sm-2 col-form-label">Select Seat Location with price</label>
				<div class="col-sm-10">
					<input type="radio" id="seat_location" name= "seat_location" value="Front_Window">Front Window - 500<br>
					<input type="radio" id="seat_location" name= "seat_location"value="Font Aisle">Font Aisle - 500<br>
					<input type="radio" id="seat_location" name= "seat_location"value="Front Near Emergency">Front Near Emergency - 500<br>
					<input type="radio" id="seat_location" name= "seat_location"value="Middle Window">Middle Window - 250<br>
					<input type="radio" id="seat_location" name= "seat_location"value="Middle Aisle">Middle Aisle - 250<br>
					<input type="radio" id="seat_location" name= "seat_location"value="Middle Near Emergency">Middle Near Emergency - 250<br>
					<input type="radio" id="seat_location" name= "seat_location"value="Back Window">Back Window - 100<br>
					<input type="radio" id="seat_location" name= "seat_location"value="Back Aisle">Back Aisle - 100<br>
					<input type="radio" id="seat_location" name= "seat_location"value="Back Near Emergency">Back Near Emergency - 100<br>
				</div>
		</div>
		<div class="form-group row">
			<label for="meal_type" class="col-sm-2 col-form-label">Select Meal Type with price</label>
				<div class="col-sm-10">
					<input type="radio" id="meal_type" name= "meal_type" value="Veg Meal">Veg Meal - 500<br>
					<input type="radio" id="meal_type" name= "meal_type"value="Non Veg Meal">Non Veg Meal - 500<br>
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