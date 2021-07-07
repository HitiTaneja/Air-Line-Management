package hibernate.main;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.Util.HibernateUtil;
import hibernate.modal.Concession;
import hibernate.modal.Requirement_Concession;

public class AddOnsDetails 
{

	public float getAddOnsPrice(String category, String seat_location, String meal_type, float amount) 
	{
		System.out.println("category "+category+" seat_location "+seat_location+" meal_type "+meal_type+" amount "+amount);
		//Get Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		//start transaction
		session.beginTransaction();
		Query qu = session.createQuery("from Concession where category =:category");
		qu.setParameter("category", category);
		List<Concession> list = (ArrayList<Concession>)qu.list();
		System.out.println("list of category "+list.size());
		float concession = 0;
		
		for(Concession con : list)
		{
			concession = con.getDiscount();
		}
		float temp = concession*amount;
		float te = temp/100;
		float categoryCon = amount + te;
		System.out.println("temp "+temp+" concession "+concession+" category Con "+categoryCon);
		
		Query que = session.createQuery("from Requirement_Concession where category =:category");
		que.setParameter("category", seat_location);
	
		List<Requirement_Concession> list1 = (ArrayList<Requirement_Concession>)que.list();
		float seatPrice = 0; 
		for(Requirement_Concession con : list1)
		{
			seatPrice = con.getPrice();
		}
		float seatCon = categoryCon + seatPrice;
		System.out.println("seatCon "+seatCon);
		
		Query quer = session.createQuery("from Requirement_Concession rc where rc.category =:meal_type");
		quer.setParameter("meal_type", meal_type);
		List<Requirement_Concession> list12 = (ArrayList<Requirement_Concession>)quer.list();
		float mealPrice = 0; 
		for(Requirement_Concession con : list12)
		{
			mealPrice = con.getPrice();
		}
		float mealCon = seatCon + mealPrice;
		System.out.println("mealCon "+mealCon);
		return mealCon;
	}
	

}
