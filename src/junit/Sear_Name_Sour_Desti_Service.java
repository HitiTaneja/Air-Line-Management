package junit;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;

import modal.Flight;

class Sear_Name_Sour_Desti_Service
{
	@Test
	void test() 
	{
		service.Sear_Name_Sour_Desti_Service ss = new service.Sear_Name_Sour_Desti_Service();
		String flight_name="Air India", flight_source="Delhi", flight_destination="Chandigarh";
		List<Flight> list = new ArrayList<>();
		Flight f = new Flight();
		f.setFlight_id("01A");
		f.setFlight_source("Delhi");
		f.setFlight_destination("Chandigarh");
		f.setFlight_days("M,W,F");
		f.setFlight_timings("1:00");
		f.setFlight_plane_type("Lockheed");
		f.setFlight_classes("Business");
		f.setFlight_date("18-07-19");
		f.setFlight_seat_available(65);
		f.setFlight_price(800);
		list.add(f);
		assertEquals(list.toString(), ss.search(flight_name, flight_source, flight_destination).toString());
	}

}
