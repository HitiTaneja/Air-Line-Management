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
<title>Search By Airline Name, Source and Destination</title>
</head>
<body>
<form action="SearchByASD" method = "post">
<%
Session sessn = HibernateUtil.getSessionFactory().getCurrentSession();
sessn.beginTransaction();

%>
	 Enter Airline Name : 
	<select name = "airline" id = "airline">
	<% Query query = sessn.createQuery("Select airlinename from Airline");
	 List<Airline> list =query.list();
		for(int i = 0;i<list.size();i++)
	 	{ %>
			<option value="<%=list.get(i)%>"><%=list.get(i) %></option>
	<%} %>	
	</select>
	<br> 
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
	<button>Submit</button>
</form>
</body>
</html>