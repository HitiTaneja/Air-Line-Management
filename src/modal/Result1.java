package modal;

public class Result1 
{
	private String flight_days, flight_timings, flight_plane_type, flight_classes;
	private int flight_seat_available, flight_price;
	
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
	public int getFlight_seat_available() {
		return flight_seat_available;
	}
	public void setFlight_seat_available(int flight_seat_available) {
		this.flight_seat_available = flight_seat_available;
	}
	public int getFlight_price() {
		return flight_price;
	}
	public void setFlight_price(int flight_price) {
		this.flight_price = flight_price;
	}
	@Override
	public String toString() {
		return "Result1 [flight_days=" + flight_days + ", flight_timings=" + flight_timings + ", flight_plane_type="
				+ flight_plane_type + ", flight_classes=" + flight_classes + ", flight_seat_available="
				+ flight_seat_available + ", flight_price=" + flight_price + "]";
	}
	
	

}
