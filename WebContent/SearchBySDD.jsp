<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="org.hibernate.Session"%>
    <%@ page import = "hibernate.util.HibernateUtil" %>
    <%@ page import = "org.hibernate.Query" %>
    <%@ page import = "hibernate.modal.Airline" %>
    <%@ page import = "java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>Search By Source Destination and Date</title>
</head>
<body>
<%
Session sessn = HibernateUtil.getSessionFactory().getCurrentSession();
sessn.beginTransaction();
%>
<form action ="SearchBySD" method = "post">
Enter Source :
	<select name = "source" id = "source">
	<% Query quey = sessn.createQuery("Select cname from City");
	 List<Airline> lit =quey.list();
		for(int i = 0;i<lit.size();i++)
	 	{ %>
			<option value="<%=lit.get(i)%>"><%=lit.get(i) %></option>
	<%} %>	
	</select> 
	<br>
	Enter Destination :
	<select name = "destination" id = "destination">
	<% Query quy = sessn.createQuery("Select cname from City");
	 List<Airline> lt =quy.list();
		for(int i = 0;i<lt.size();i++)
	 	{ %>
			<option value="<%=lt.get(i)%>"><%=lt.get(i) %></option>
	<%}sessn.close(); %>	
	</select> 
	<br>
	Enter date : <input required  id="date-withminvalue" type="date" name="date-withminvalue" min="2000-01-02">
	<button>Submit</button>
</form>
<script>
$(document).ready(function() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yy = today.getFullYear();
	if (dd<10) {
		dd = '0' + dd;
	}
	if (mm<10) {
		mm = '0' + mm;
	}
	var rightnow = yy + '-' + mm + '-' + dd;
	$('#date-withminvalue').attr('min', rightnow);
});
</script>
</body>
</html>