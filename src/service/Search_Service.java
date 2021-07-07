package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import modal.Flight;
import modal.Result;
import util.Connect;

public class Search_Service
{

	public Result select(String flightId, String name, String source, String destination)
	{
		List<Result> list = new ArrayList<>();		
		ResultSet rs;
		try
		{
			Connection con = Connect.create_connection();
			if(con!=null)
			{
				String sql ="Select fa.FLIGHT_ID , fa.FLIGHT_CLASSES , fa.FLIGHT_SEAT_AVAILABLE, fa.FLIGHT_PRICE , "
						+ "fd.FLIGHT_SOURCE ,fd.FLIGHT_DESTINATION , fd.FLIGHT_DAYS , fd.FLIGHT_TIMINGS , fd.FLIGHT_PLANE_TYPE ,"
						+ " fd.FLIGHT_DATE , fd.FLIGHT_NAME from FLIGHT_DETAILS fd inner join FLIGHT_AVAILABLITY  fa"
						+ " on fa.FLIGHT_ID  = fd.FLIGHT_ID  where fd.FLIGHT_ID =? and fd.FLIGHT_SOURCE = ?"
						+ " and fd.FLIGHT_DESTINATION = ? and fd.FLIGHT_NAME = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,flightId);
				ps.setString(2,source);
				ps.setString(3,destination);
				ps.setString(4,name);
				rs=ps.executeQuery();
				while(rs.next())
				{
					Result res = new Result();
					res.setFlight_classes(rs.getString("flight_classes"));
					res.setFlight_days(rs.getString("flight_days"));
					res.setFlight_plane_type(rs.getString("flight_plane_type"));
					res.setFlight_timings(rs.getString("flight_timings"));
					list.add(res);
				}
				System.out.println(list.get(0));
			}
			else
				System.out.println("Connection object is null");
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return list.get(0);		
	}
}
