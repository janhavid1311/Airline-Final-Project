package com.airline_reservation.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.airline_reservation.dao.UserDaoImpl;
import com.airline_reservation.model.Admin;
import com.airline_reservation.model.Booking;
import com.airline_reservation.model.Flights;
import com.airline_reservation.model.User;


@Service("userService")
public class UserServiceImpl implements UserServiceIntf{
	 @Autowired
	  public UserDaoImpl userDao;

	 @Transactional
	public boolean register(User user) {
		return userDao.register(user);
	}

	 @Transactional
	public User checkUserLogin(User user) {
		return userDao.checkUserLogin(user);
	}
	 @Transactional
		public List<Flights> searchFlights_user(String source, String destination,Date journey_date, String b_class,int passenger_count) {
			List<Flights> list=userDao.searchFlights_user(source,destination,journey_date,b_class,passenger_count);
			return list;
		}
	 
	 @Transactional
		public List<Booking> result(String email_id) {
			 List<Booking> lis = new ArrayList<Booking>();
			 lis = userDao.result(email_id);
			return lis;
		}

}
