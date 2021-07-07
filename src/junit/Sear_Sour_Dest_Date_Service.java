package junit;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import modal.Result1;

class Sear_Sour_Dest_Date_Service
{
	@Test
	void test() 
	{
		service.Sear_Sour_Dest_Date_Service ss = new service.Sear_Sour_Dest_Date_Service();
		String source = "Delhi", destination = "Chandigarh", date = "2035-07-03";
		Result1 ob = new Result1();
		ob.setFlight_classes("Business");
		ob.setFlight_days("M,W,F");
		ob.setFlight_plane_type("Lockheed");
		ob.setFlight_price(800);
		ob.setFlight_seat_available(65);
		ob.setFlight_timings("1:00");
		assertEquals(ob.toString(), ss.select(source, destination, date).toString());
	}
}
