package hibernate.modal;

public class Booking_Details 
{
	private String flight_code, airlineid, pass_name1, pass_name2, pass_name3, pass_name4, fclass ,status, date_of_travel,emailId,contactNo;
	private Flight flight;
	private int pnr_number, child_num, adult_num;
	private float amount;
	private Airline airline;
	
	public Booking_Details() {}
	
	public Booking_Details(String airlineid, String pass_name1, String pass_name2, String pass_name3, String pass_name4, String fclass, String status, 
			String date_of_travel, int child_num, int adult_num, String flight_code, int pnr_number, float amount, String contactNo, String emailId)
	{
		this.flight_code = flight_code;
		this.airlineid = airlineid;
		this.pass_name1 = pass_name1;
		this.pass_name2 = pass_name2;
		this.pass_name3 = pass_name3;
		this.pass_name4 = pass_name4;
		this.fclass = fclass;
		this.status = status;
		this.date_of_travel = date_of_travel;
		this.pnr_number = pnr_number;
		this.child_num = child_num;
		this.adult_num = adult_num;
		this.amount = amount;
		this.contactNo = contactNo;
		this.emailId = emailId;
	}
	
	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
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

	public String getAirlineid() {
		return airlineid;
	}

	public void setAirlineid(String airlineid) {
		this.airlineid = airlineid;
	}

	public String getPass_name1() {
		return pass_name1;
	}

	public void setPass_name1(String pass_name1) {
		this.pass_name1 = pass_name1;
	}

	public String getPass_name2() {
		return pass_name2;
	}

	public void setPass_name2(String pass_name2) {
		this.pass_name2 = pass_name2;
	}

	public String getPass_name3() {
		return pass_name3;
	}

	public void setPass_name3(String pass_name3) {
		this.pass_name3 = pass_name3;
	}

	public String getPass_name4() {
		return pass_name4;
	}

	public void setPass_name4(String pass_name4) {
		this.pass_name4 = pass_name4;
	}

	public String getFclass() {
		return fclass;
	}

	public void setFclass(String fclass) {
		this.fclass = fclass;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDate_of_travel() {
		return date_of_travel;
	}

	public void setDate_of_travel(String date_of_travel) {
		this.date_of_travel = date_of_travel;
	}

	public Flight getFlight() {
		return flight;
	}

	public void setFlight(Flight flight) {
		this.flight = flight;
	}

	public int getPnr_number() {
		return pnr_number;
	}

	public void setPnr_number(int pnr_number) {
		this.pnr_number = pnr_number;
	}

	public int getChild_num() {
		return child_num;
	}

	public void setChild_num(int child_num) {
		this.child_num = child_num;
	}

	public int getAdult_num() {
		return adult_num;
	}

	public void setAdult_num(int adult_num) {
		this.adult_num = adult_num;
	}
	
}
