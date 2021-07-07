package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modal.Flight;
import util.Connect;

public class Sear_Name_Sour_Desti_Service
{

	public List<Flight> search(String airline, String source, String destination) 
	{
		List<Flight> list = new ArrayList<>();
		ResultSet rs;
		try 
		{
			Connection con = Connect.create_connection();
			if(con!=null)
			{
				String sql ="Select fa.FLIGHT_ID , fa.FLIGHT_CLASSES , fa.FLIGHT_SEAT_AVAILABLE, fa.FLIGHT_PRICE , fd.FLIGHT_SOURCE ,"
						+ "fd.FLIGHT_DESTINATION , fd.FLIGHT_DAYS , fd.FLIGHT_TIMINGS , fd.FLIGHT_PLANE_TYPE , fd.FLIGHT_DATE , fd.FLIGHT_NAME "
						+ "from FLIGHT_DETAILS fd inner join FLIGHT_AVAILABLITY  fa on fa.FLIGHT_ID  = fd.FLIGHT_ID  where fd.FLIGHT_NAME =? and fd.FLIGHT_SOURCE=?"
						+ "and fd.FLIGHT_DESTINATION=?";
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, airline);
				ps.setString(2, source);
				ps.setString(3, destination);
				rs = ps.executeQuery();
				while(rs.next())
				{
					Flight f = new Flight();
					f.setFlight_id(rs.getString("flight_id"));
					f.setFlight_classes(rs.getString("flight_classes"));
					f.setFlight_seat_available(rs.getInt("flight_seat_available"));
					f.setFlight_price(rs.getInt("flight_price"));
					f.setFlight_source(rs.getString("flight_source"));
					f.setFlight_destination(rs.getString("flight_destination"));
					f.setFlight_days(rs.getString("flight_days"));
					f.setFlight_timings(rs.getString("flight_timings"));
					f.setFlight_plane_type(rs.getString("flight_plane_type"));
					f.setFlight_date(rs.getString("flight_date"));
					f.setFlight_name(rs.getString("flight_name"));
					list.add(f);					
				}
			}
			else
				System.out.println("Connection object is null");
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}
}
