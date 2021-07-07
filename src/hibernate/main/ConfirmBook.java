package hibernate.main;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;

public class ConfirmBook 
{
	public static int changeStatus(int pnr_number) 
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		//start transaction
		session.beginTransaction();
		Query query = session.createQuery("update Booking_Details set status='Confirmed' where pnr_number =:pnr_number");
		query.setParameter("pnr_number", pnr_number);
		int result = query.executeUpdate();
		session.getTransaction().commit();
		System.out.println("Result "+result);
		/*session.close();*/
		return result;		
	}

}
