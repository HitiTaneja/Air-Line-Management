<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Fare Summary</title>
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
</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<%
Date d2=new Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String d3=sdf.format(d2);
System.out.println("Date inside jsp "+d3);
int passenger = (int)request.getAttribute("passenger");
int adult = (int)request.getAttribute("adult");
int child = (int)request.getAttribute("child");
float charge = (float)request.getAttribute("amount");
float otherCharges = (float)request.getAttribute("otherCharges");
float amountSub = (float)request.getAttribute("amountSub");
String pnr_number = request.getAttribute("pnr_number").toString();
try
{
	String jdate = request.getAttribute("jdate").toString();
	
	
	Date dateBefore = sdf.parse(jdate);
	Date dateAfter = sdf.parse(d3);
	long difference = dateAfter.getTime() - dateBefore.getTime();
	float days= (difference / (1000*60*60*24));
    System.out.println("Days : "+days);
    
    if(-days>=30){
 	   double temp  = (double)amountSub - (0.25*amountSub);
 	   amountSub = (float) temp;
 	   System.out.println("total after : "+amountSub);
 	   }
    }
	catch(Exception e)
	{
		  e.printStackTrace();
	}
%>
<div id="fare-summary" class="container rounded mt-3 p-5">
		<div class="w-100 ml-0 pt-2">
			<div class="col-md-12">
				<h3 style="color: #007bff">Fare Summary</h3>
				<hr color="#007bff">
				<div class="alert alert-primary">
					<span class="badge badge-primary">Note:</span> Please Make Sure
					Your Details is as per your Govt. Id
				</div>
			</div>

			<form method="post" action="FareSummary" class="bg-white">
				<div class="row w-100 ml-0 py-2 text-center">
					<div class="col-md-4 pt-2">
						<p>No Of Travelers</p>

					</div>
					<div class="col-md-4 pt-2">
						<p>
						<%%>
							<input type="text" class="form-control w-100"
								name="nooftravelers" value="<%= passenger %>" disabled>
						</p>
					</div>
					<div class="col-md-4 pt-2">
						<p></p>

					</div>
					<div class="col-md-4 pt-2">
						<p>Adults</p>

					</div>
					<div class="col-md-4 pt-2">
						<p>
							<input type="text" class="form-control w-100" name="adults"
								value="<%=adult %>" disabled>
						</p>
					</div>

					<div class="col-md-4 pt-3">
						<p></p>
					</div>

					<div class="col-md-4 pt-2">
						<p>Child</p>

					</div>
					<div class="col-md-4 pt-2">
						<p>
							<input type="text" class="form-control w-100" name="child"
							value="<%=child %>" disabled>
						</p>
					</div>
					<div class="col-md-4 pt-3">
						<p></p>
					</div>
					<div class="col-md-4 pt-2">
						<p>Base Fare</p>

					</div>
					<div class="col-md-4 pt-2">
						<p>
							<input type="text" class="form-control w-100" name="basefare"
								value="<%=charge %>" disabled>
						</p>
					</div>
					<div class="col-md-4 pt-3">
						<p></p>
					</div>
					<div class="col-md-4 pt-2">
						<p>Other Charges</p>

					</div>
					<div class="col-md-4 pt-2">
						<p>
							<input type="number" class="form-control w-100" name="mcharge"
								value="<%= otherCharges%>" readonly="readonly">
						</p>
					</div>
					<div class="col-md-4 pt-3">
						<p></p>
					</div>
				<div class="col-md-0 pt-3">
						<p></p>
					</div>
					<div class="col-md-4 pt-2">
						<p>Total Fare + 18% GST</p>

					</div>
					<div class="col-md-3 pt-2">
						<p>
							<input type="text" class="form-control w-100" name="totalfare"
								value="<%=amountSub%>" readonly="readonly">
						</p>
					</div>
					<div class="col-md-1 pt-2">
						<p>=</p>
					</div>
					<div class="col-md-3 pt-2">
						<p>
							<input type="text" class="form-control w-100" id="totalfaregst"name="totalfaregst"
								value="<%=(amountSub * 0.18)%>" readonly="readonly">
						</p>
					</div>
					<div class="col-md-12 pt-2">
						<p>
						<input type="hidden" id="pnr" name="pnr" value="<%=pnr_number%>">
							<button class="btn btn-success" type="Submit">Proceed
								For Payment</button>
							<a href=<%= "\"PayLater.jsp?Id=" + pnr_number + "\"" %> >Pay Later</a>
						</p>
					</div>
				</div>
			</form>

		</div>

	</div>

	<%@include file="Footer.jsp"%>

</body>
</html>