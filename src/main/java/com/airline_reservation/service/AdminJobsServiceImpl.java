package com.airline_reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.airline_reservation.dao.AdminJobsDaoImpl;
//import com.airline_reservation.model.Flights;
import com.airline_reservation.model.Admin;
import com.airline_reservation.model.Flights;
import com.airline_reservation.model.Route;
import com.airline_reservation.model.User;


@Service("adminjobs")
public class AdminJobsServiceImpl implements AdminJobsServiceIntf{
	@Autowired
	  public AdminJobsDaoImpl adminJobsDaoImpl;
	
	
	@Transactional
	  public Admin checkLogin(Admin admin) {
		return adminJobsDaoImpl.checkLogin(admin);
	  }
	
	@Transactional
	  public boolean addRoute(Route route) {
			return adminJobsDaoImpl.addRoute(route);
		}
	
	@Transactional
	public boolean addFlight(Flights flight) {
		
		return adminJobsDaoImpl.addFlight(flight);
	}
  
	@Transactional
	public boolean deleteFlight(String flight_id) {
		return adminJobsDaoImpl.deleteFlight(flight_id);
	}
	
	 @Transactional
	  public List<User> getUsers(){
		  List<User>  list = adminJobsDaoImpl.getUsers();
		  return list;
	  }
	  
	  @Transactional
	  public User getUser1(String email_id) {
		  return adminJobsDaoImpl.getUser1(email_id);
	  }
	  @Transactional
	public List<Flights> getFlights() {
		List<Flights>  list = adminJobsDaoImpl.getFlights();
		  return list;
	
	}
	  @Transactional
	public Flights getFlight1(String flight_id) {
		  return adminJobsDaoImpl.getFlight1(flight_id);
	}
	  @Transactional
	public List<Flights> searchFlights(String source, String destination) {
		List<Flights> list=adminJobsDaoImpl.searchFlights(source,destination);
		return list;
	}

	  @Transactional
	public List<Route> getRoute() {
		List<Route>  list = adminJobsDaoImpl.getRoute();
		  return list;
	}
	
}
