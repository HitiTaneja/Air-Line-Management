package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modal.Result1;
import util.Connect;

public class Sear_Sour_Dest_Date_Service 
{
	public Result1 select(String source, String destination, String date) 
	{
		String arr [] = date.split("-");
		String date1 = arr[2].concat("-").concat(arr[1]).concat("-").concat(arr[0]);
		List<Result1> list = new ArrayList<>();
		ResultSet rs;
		try 
		{
			Connection con = Connect.create_connection();
			if(con!=null)
			{
				String sql ="Select fa.FLIGHT_ID , fa.FLIGHT_CLASSES , fa.FLIGHT_SEAT_AVAILABLE, fa.FLIGHT_PRICE , "
					+ "fd.FLIGHT_SOURCE ,fd.FLIGHT_DESTINATION , fd.FLIGHT_DAYS , fd.FLIGHT_TIMINGS , fd.FLIGHT_PLANE_TYPE ,"
					+ " fd.FLIGHT_DATE , fd.FLIGHT_NAME from FLIGHT_DETAILS fd inner join FLIGHT_AVAILABLITY  fa"
					+ " on fa.FLIGHT_ID  = fd.FLIGHT_ID  where fd.FLIGHT_SOURCE = ? and fd.FLIGHT_DESTINATION = ?"
					+ " and fd.FLIGHT_DATE = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,source);
				ps.setString(2, destination);
				ps.setString(3, date1);
				rs=ps.executeQuery();
				while(rs.next())
				{
					Result1 res = new Result1();
					res.setFlight_classes(rs.getString("flight_classes"));
					res.setFlight_days(rs.getString("flight_days"));
					res.setFlight_plane_type(rs.getString("flight_plane_type"));
					res.setFlight_timings(rs.getString("flight_timings"));
					res.setFlight_seat_available(rs.getInt("flight_seat_available"));
					res.setFlight_price(rs.getInt("flight_price"));
					list.add(res);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list.get(0);
	}
}