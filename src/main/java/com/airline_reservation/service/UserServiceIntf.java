package com.airline_reservation.service;

import java.util.Date;
import java.util.List;

import com.airline_reservation.model.Admin;
import com.airline_reservation.model.Booking;
import com.airline_reservation.model.Flights;
import com.airline_reservation.model.User;

public interface UserServiceIntf {	
	public boolean register(User user);
	public User checkUserLogin(User user);
	public List<Flights> searchFlights_user(String source,String destination,Date journey_date, String b_class,int passenger_count);
	public List<Booking> result(String email_id);
}
