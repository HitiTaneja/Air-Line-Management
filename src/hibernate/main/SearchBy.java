package hibernate.main;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import hibernate.modal.*;
import hibernate.Util.HibernateUtil;

public class SearchBy 
{

	public List searchByDate() 
	{
		//System.out.println("Inside service class method");
		//Get Session
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		//start transaction
		session.beginTransaction();
		
		Query query = session.createQuery("Select flight FROM Airline airline inner join"
				+ " airline.flight as flight");
		 List<Flight> list =query.list();
		 System.out.println("Size "+list.size());
		 
		 for(Flight f : list)
		 {
			 System.out.println("Inside method output "+f.getFlight_code());
		 }
		 session.close();
		return list;
	}

	public List<Flight> searchByFlightNo(String flightNo) 
	{
		//Get Session
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		//start transaction
		session.beginTransaction();
		Query query = session.createQuery("Select flight FROM Airline airline inner join"
				+ " airline.flight as flight where flight.flight_code =:flightNo");
		query.setParameter("flightNo", flightNo);
		List<Flight> list = query.list();
		System.out.println("Size "+list.size());
		 for(Flight f : list)
		 {
			System.out.println("Inside method output "+f.getFlight_code());
		 }
		 session.close();
		return list;
	}

	public List<Flight> searchByASD(String airline, String source, String destination) 
	{
		//Get Session
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		//start transaction
		session.beginTransaction();
		Query query = session.createQuery("Select flight FROM Airline airline inner join"
				+ " airline.flight as flight where airline.airlinename =:airline and flight.source =:source and"
				+ " flight.destination =:destination");
		query.setParameter("airline", airline);
		query.setParameter("source", source);
		query.setParameter("destination", destination);
		List<Flight> list = query.list();
		System.out.println("Size "+list.size());
		 for(Flight f : list)
		 {
			System.out.println("Inside method output "+f.getFlight_code());
		 }
		 session.close();
		return list;

	}

	public List<Flight> searchBySD(String source, String destination) 
	{
		//Get Session
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		//start transaction
		session.beginTransaction();
		Query query = session.createQuery("Select flight from Flight as flight"
				+ " where flight.source =:source and flight.destination =:destination");
		query.setParameter("source", source);
		query.setParameter("destination", destination);
		List<Flight> list = query.list();
		System.out.println("Size "+list.size());
		System.out.println("Inside method "+list);
		 for(Flight f : list)
		 {
			System.out.println("Inside method output "+f.getAirline().getAirlinename());
		 }
		 session.close();
		return list;
	}
}