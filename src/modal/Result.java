package modal;

public class Result 
{
	private String flight_days, flight_timings, flight_plane_type, flight_classes;	
	

	public String getFlight_days() {
		return flight_days;
	}

	public void setFlight_days(String flight_days) {
		this.flight_days = flight_days;
	}

	public String getFlight_timings() {
		return flight_timings;
	}

	public void setFlight_timings(String flight_timings) {
		this.flight_timings = flight_timings;
	}

	public String getFlight_plane_type() {
		return flight_plane_type;
	}

	public void setFlight_plane_type(String flight_plane_type) {
		this.flight_plane_type = flight_plane_type;
	}

	public String getFlight_classes() {
		return flight_classes;
	}

	public void setFlight_classes(String flight_classes) {
		this.flight_classes = flight_classes;
	}

	@Override
	public String toString() {
		return flight_days + ", "+flight_timings +", "+ flight_plane_type + ", "+ flight_classes ;
	}
	
	public boolean equals(Result ob)
	{
		if(ob.flight_classes.equals(this.flight_classes) && ob.flight_days.equals(this.flight_days) && ob.flight_plane_type.equals(this.flight_plane_type) && ob.flight_timings.equals(this.flight_timings))
			return true;
		else
			return false;
	}

}
