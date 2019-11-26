package com.airline_reservation.service;

import java.util.List;

import com.airline_reservation.model.Admin;
import com.airline_reservation.model.Flights;
import com.airline_reservation.model.Route;
import com.airline_reservation.model.User;

public interface AdminJobsServiceIntf {

	public Admin checkLogin(Admin admin);
	public boolean addRoute(Route route);
	public boolean addFlight(Flights flight);
	public boolean deleteFlight(String flight_id);
	 public List<User> getUsers();
	 public User getUser1(String email_id);
	 public List<Flights> getFlights();
	 public Flights getFlight1(String flight_id);
	 public List<Route> getRoute();
	 public List<Flights> searchFlights(String source,String destination);
}
