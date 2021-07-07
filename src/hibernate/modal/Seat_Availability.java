package hibernate.modal;

public class Seat_Availability
{
	private String flight_code;
	private int business_class, economy_class;
	private Flight flight;
	

	public Flight getFlight() {
		return flight;
	}

	public void setFlight(Flight flight) {
		this.flight = flight;
	}

	public String getFlight_code() {
		return flight_code;
	}

	public void setFlight_code(String flight_code) {
		this.flight_code = flight_code;
	}

	public int getBusiness_class() {
		return business_class;
	}

	public void setBusiness_class(int business_class) {
		this.business_class = business_class;
	}

	public int getEconomy_class() {
		return economy_class;
	}

	public void setEconomy_class(int economy_class) {
		this.economy_class = economy_class;
	}
}
