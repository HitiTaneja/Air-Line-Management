package hibernate.modal;

public class Flight_Price
{
	private String flight_code;
	private int business_adult, business_child, economy_adult, economy_child;
	private Flight flight;
	public String getFlight_code() {
		return flight_code;
	}
	public void setFlight_code(String flight_code) {
		this.flight_code = flight_code;
	}
	public int getBusiness_adult() {
		return business_adult;
	}
	public void setBusiness_adult(int business_adult) {
		this.business_adult = business_adult;
	}
	public int getBusiness_child() {
		return business_child;
	}
	public void setBusiness_child(int business_child) {
		this.business_child = business_child;
	}
	public int getEconomy_adult() {
		return economy_adult;
	}
	public void setEconomy_adult(int economy_adult) {
		this.economy_adult = economy_adult;
	}
	public int getEconomy_child() {
		return economy_child;
	}
	public void setEconomy_child(int economy_child) {
		this.economy_child = economy_child;
	}
	public Flight getFlight() {
		return flight;
	}
	public void setFlight(Flight flight) {
		this.flight = flight;
	}
}
