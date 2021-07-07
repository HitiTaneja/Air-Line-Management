package hibernate.main;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.Util.HibernateUtil;
import hibernate.modal.Booking_Details;
import hibernate.modal.Flight_Price;
import hibernate.modal.Seat_Availability;

public class BookDetails
{
	public static boolean insertValues(Booking_Details bd) 
	{
		boolean flag = false;
		//Get Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		//start transaction
		session.beginTransaction();
		System.out.println(bd.getFlight().getFlight_code());		
		int result = (int) session.save(bd);
		
		System.out.println("Result "+result);
		
		session.getTransaction().commit();
		session.close();
		
		
		String flight_code = bd.getFlight().getFlight_code();
		String class_ty = bd.getFclass().toUpperCase()+"_CLASS";
		int child = bd.getChild_num();
		int adult = bd.getAdult_num();
		int totalPassenger = child+adult;
		
		
		Session session1 = HibernateUtil.getSessionFactory().openSession();
		//start transaction
		session1.beginTransaction();
		Query q1 = session1.createQuery("from Seat_Availability where flight_code =:flight_code");
		q1.setParameter("flight_code", flight_code);
		List<Seat_Availability> l1 = (List<Seat_Availability>)q1.list();
		int updated=0;
		for(Seat_Availability sa : l1)
		{
			if(class_ty.equals("BUSINESS_CLASS"))
			{
				int seat = sa.getBusiness_class();
				updated = seat - totalPassenger;
			}
			else
			{
				int seat = sa.getEconomy_class();
				updated = seat - totalPassenger;
				sa.setEconomy_class(updated);
				session1.update(sa);
			}
			
		}
		session1.getTransaction().commit();
		session1.close();
		
		if(result>= 0)
			flag = true;
		return flag;
	}
	
	
	
	
	public int getFlightPrice(String fclass, int adult, int child, String flight_code)
	{
		System.out.println("fclass "+fclass+" adult "+adult+" child "+child+" flight_code "+flight_code);
		//Get Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		//start transaction
		session.beginTransaction();
		Query qu = session.createQuery("from Flight_Price where flight_code =:flight_code");
		qu.setParameter("flight_code", flight_code);
		List<Flight_Price> list=(List<Flight_Price>)qu.list();
		System.out.println("List Size "+list.size());
	    int ba = 0, bc=0,ea=0,ec=0,totalPrice=0,adultPriceB=0,childPriceB=0,adultPriceE=0,childPriceE=0;
	    for(Flight_Price fp : list)
	    {
	    	if(fclass == "Business")
	    	{
	    		ba = fp.getBusiness_adult();
		    	bc = fp.getBusiness_child();
		    	adultPriceB = ba * adult;
		    	childPriceB = bc * child; 
		    	totalPrice = adultPriceB + childPriceB;
	    	}
	    	else
	    	{
	    		ea = fp.getEconomy_adult();
		    	ec = fp.getEconomy_child();
		    	adultPriceE = ea * adult;
		    	childPriceE = ec * child;
		    	totalPrice = adultPriceE + childPriceE;
	    	}	    	
	    }
	    System.out.println("Total Price "+totalPrice);
	    
	    session.close();
	    return totalPrice;
	}

	public int insertAmount(int pnr_number, float amount) 
	{
		//Get Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		//start transaction
		session.beginTransaction();
		Query qu = session.createQuery("update Booking_Details set amount =:amount where pnr_number =:pnr_number");
		qu.setParameter("amount", amount);
		qu.setParameter("pnr_number", pnr_number);
		int result = qu.executeUpdate();
		System.out.println("Result "+result);
		session.getTransaction().commit();
		session.close();
		return result;
	}

	public int updateStatus(int pnr_number, String status) 
	{
		//Get Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		//start transaction
		session.beginTransaction();
		Query qu = session.createQuery("update Booking_Details set status =:status where pnr_number =:pnr_number");
		qu.setParameter("status", status);
		qu.setParameter("pnr_number", pnr_number);
		int result = qu.executeUpdate();
		System.out.println("Result "+result);
		session.getTransaction().commit();
		session.close();
		return result;
		
	}

	public int cancelTicket(int pnr_number) 
	{
		//Get Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		//start transaction
		session.beginTransaction();
		Query query = session.createQuery("delete Booking_Details where pnr_number =:pnr_number");
		query.setParameter("pnr_number", pnr_number);
		int result = query.executeUpdate();
		System.out.println("Result "+result);
		session.getTransaction().commit();
		session.close();
		return result;
	}
	
	
	

}
