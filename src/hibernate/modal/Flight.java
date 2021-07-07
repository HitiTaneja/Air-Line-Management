package hibernate.modal;

import java.util.Set;

public class Flight
{
	private String flight_code, source, destination, arrival, departure, status, duration, flighttype, layover_time, 
		days, planetype, class_type;
	private int no_of_stops;
	private Airline airline;
	private Seat_Availability seat_availability;
	private Flight_Price flight_price;
	private Set<Booking_Details> booking_Details;

	public String getClass_type() {
		return class_type;
	}
	public void setClass_type(String class_type) {
		this.class_type = class_type;
	}
	public Set<Booking_Details> getBooking_Details() {
		return booking_Details;
	}
	public void setBooking_Details(Set<Booking_Details> booking_Details) {
		this.booking_Details = booking_Details;
	}
	public Flight_Price getFlight_price() {
		return flight_price;
	}
	public void setFlight_price(Flight_Price flight_price) {
		this.flight_price = flight_price;
	}
	public Seat_Availability getSeat_availability() {
		return seat_availability;
	}
	public void setSeat_availability(Seat_Availability seat_availability) {
		this.seat_availability = seat_availability;
	}
	public Airline getAirline() {
		return airline;
	}
	public void setAirline(Airline airline) {
		this.airline = airline;
	}
	public String getFlight_code() {
		return flight_code;
	}
	public void setFlight_code(String flight_code) {
		this.flight_code = flight_code;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getArrival() {
		return arrival;
	}
	public void setArrival(String arrival) {
		this.arrival = arrival;
	}
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		this.departure = departure;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getFlighttype() {
		return flighttype;
	}
	public void setFlighttype(String flighttype) {
		this.flighttype = flighttype;
	}
	public String getLayover_time() {
		return layover_time;
	}
	public void setLayover_time(String layover_time) {
		this.layover_time = layover_time;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getPlanetype() {
		return planetype;
	}
	public void setPlanetype(String planetype) {
		this.planetype = planetype;
	}
	public int getNo_of_stops() {
		return no_of_stops;
	}
	public void setNo_of_stops(int no_of_stops) {
		this.no_of_stops = no_of_stops;
	}
	@Override
	public String toString() {
		return "Flight [flight_code=" + flight_code + ", source=" + source + ", destination=" + destination
				+ ", arrival=" + arrival + ", departure=" + departure + ", status=" + status + ", duration=" + duration
				+ ", flighttype=" + flighttype + ", layover_time=" + layover_time + ", days=" + days + ", planetype="
				+ planetype + ", no_of_stops=" + no_of_stops + ", airline name=" + airline.getAirlinename() + ", seat_availability="
				+ seat_availability.getBusiness_class() + "]";
	}	
	
}
