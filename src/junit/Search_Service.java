package junit;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;

import modal.Result;

class Search_Service 
{
	@Test
	void select() 
	{
		service.Search_Service ss = new service.Search_Service();
		String flightid ="01A", name ="Air India", source="Delhi", destination="Chandigarh";
		Result ob=new Result();
		ob.setFlight_classes("Business");
		ob.setFlight_days("M,W,F");
		ob.setFlight_plane_type("Lockheed");
		ob.setFlight_timings("1:00");
		assertEquals(ob.toString(), ss.select(flightid, name, source, destination).toString());
	}

}
