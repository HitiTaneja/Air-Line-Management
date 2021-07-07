package hibernate.main;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.Util.HibernateUtil;
import hibernate.modal.Booking_Details;
import hibernate.modal.Flight;

public class Search 
{
	public List<Flight> flightSearch(String airline, String source, String destination) 
	{
		System.out.println("Inside search method");
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
		List<Flight> list = (List<Flight>)query.list();
	
		System.out.println("Size "+list.size());
		for(Flight f : list)
		{
			System.out.println("Inside method output "+f.getFlight_code());
		}
		session.close();
		return list;
	}

	public List<Flight> flightSearch(String source, String destination) 
	{
		System.out.println("Inside dource and destination");
		//Get Session
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		//start transaction
		session.beginTransaction();
		Query query = session.createQuery("Select flight from Flight as flight"
				+ " where flight.source =:source and flight.destination =:destination");
		query.setParameter("source", source);
		query.setParameter("destination", destination);
		List<Flight> list = (List<Flight>)query.list();
		System.out.println("Size "+list.size());
		System.out.println("Inside method "+list);
		 for(Flight f : list)
		 {
			System.out.println("Inside method output "+f.getAirline().getAirlinename());
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
		List<Flight> list = (List<Flight>)query.list();
		System.out.println("Size "+list.size());
		 for(Flight f : list)
		 {
			System.out.println("Inside method output "+f.getFlight_code());
		 }
		 session.close();
		return list;
	}

	public List<Booking_Details> searchByPnrNumber(int pnr_number) 
	{
		System.out.println("pnr number inside method "+pnr_number);
		//Get Session
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		//start transaction
		session.beginTransaction();
		Query qu = session.createQuery("FROM Booking_Details where pnr_number =:pnr_number");
		qu.setParameter("pnr_number", pnr_number);
		List<Booking_Details> list = qu.list();
		System.out.println("Size of Result "+list.size());
		for(Booking_Details bd : list)
		{
			System.out.println("Inside method output "+bd.getAirline().getAirlineid());
		}
		session.close();
		return list;		
	}
	
	
}
