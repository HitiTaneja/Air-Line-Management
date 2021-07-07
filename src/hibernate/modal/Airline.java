package hibernate.modal;

import java.util.Set;

public class Airline 
{
	private String airlineid, airlinename, threedigitcode;
	private Set<Flight> flight;
	private Set<Booking_Details> booking_Details;

	public Set<Booking_Details> getBooking_Details() {
		return booking_Details;
	}
	public void setBooking_Details(Set<Booking_Details> booking_Details) {
		this.booking_Details = booking_Details;
	}
	public String getAirlineid() {
		return airlineid;
	}

	public void setAirlineid(String airlineid) {
		this.airlineid = airlineid;
	}

	public String getAirlinename() {
		return airlinename;
	}

	public void setAirlinename(String airlinename) {
		this.airlinename = airlinename;
	}

	public String getThreedigitcode() {
		return threedigitcode;
	}

	public void setThreedigitcode(String threedigitcode) {
		this.threedigitcode = threedigitcode;
	}
	

	public Set<Flight> getFlight() {
		return flight;
	}

	public void setFlight(Set<Flight> flight) {
		this.flight = flight;
	}

	@Override
	public String toString() {
		return "Airline [Airlineid " + airlineid + "\nAirlinename " + airlinename + "\nThreedigitcode " + threedigitcode
				+ "]";
	}
}
