package com.airline_reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.airline_reservation.model.Admin;
import com.airline_reservation.model.Booking;
import com.airline_reservation.model.Flights;
import com.airline_reservation.model.Passenger;
import com.airline_reservation.model.Payment;
import com.airline_reservation.model.Route;
import com.airline_reservation.model.User;
import com.airline_reservation.service.UserServiceImpl;



@Controller("userController")
public class UserController {
	@Autowired
	 public UserServiceImpl userRegisterService;

	 @RequestMapping(value = "/register", method = RequestMethod.GET)
	  public ModelAndView showRegister2(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("register");
	    mav.addObject("user", new User());
	    return mav;
	  }
	
	 @RequestMapping(value="/register" ,method=RequestMethod.POST)
		public ModelAndView registerProcess(HttpServletRequest request,HttpServletResponse response) throws ParseException
		{
		 ModelAndView mav= new ModelAndView();
		 String title =request.getParameter("title");
		  String first_name = request.getParameter("first_name");
		  String last_name = request.getParameter("last_name");
		  String email_id = request.getParameter("email_id");
		  String password = request.getParameter("password");
		 SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		 Date dob = formatter1.parse(request.getParameter("dob"));
		  String gender =request.getParameter("gender");
		  long ph_no =Long.parseLong(request.getParameter("ph_no"));
		  
			User user1= new User();
			user1.setTitle(title);
			user1.setFirst_name(first_name);
			user1.setLast_name(last_name);
			user1.setEmail_id(email_id);
			user1.setPassword(password);
			user1.setDob(dob);
			user1.setGender(gender);
			user1.setPh_no(ph_no);
			
			boolean flag=userRegisterService.register(user1);
			
			mav.addObject("title", title);
			mav.addObject("first_name", first_name);
			mav.addObject("last_name", last_name);
			mav.addObject("email_id", email_id);
			mav.addObject("password", password);
			mav.addObject("dob", dob);
			mav.addObject("gender", gender);
			mav.addObject("ph_no", ph_no);
		
			
			 if (flag)
			 {
				 mav.addObject("status", "Thanks for msg..........................");
			 }
			 else
			 {
				 mav.addObject("status", "Thanks for msg..........................");
			 }
			
			 mav.setViewName("user_login");
			 
			 return mav;
		}
	 
	 
	 @RequestMapping(value = "/user_login", method = RequestMethod.GET)
	  public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("user_login");
	    mav.addObject("user", new User());
	    return mav;
	  }

	  @RequestMapping(value = "/user_login", method = RequestMethod.POST)
	  public ModelAndView userloginProcess(HttpServletRequest request, HttpServletResponse response,   @ModelAttribute User user1) {
	    ModelAndView mav = null;
	    User user = userRegisterService.checkUserLogin(user1);
	    if (user != null) {
	      mav = new ModelAndView("welcome_user");
	      mav.addObject("first_name", user.getFirst_name());
	      //session manage
	      HttpSession session= request.getSession();
	      session.setAttribute("email_id", user1.getEmail_id());
	    } else {
	      mav = new ModelAndView("user_login");
	      mav.addObject("message", "Email id or Password is incorrect!!");
	    }
	    return mav;
	  }
	  
	  @RequestMapping(value = "/user_logout", method = RequestMethod.GET)
		public ModelAndView userlogout(HttpServletRequest request, HttpServletResponse response) {
			 HttpSession session =request.getSession(false);
			 session.invalidate();
			 ModelAndView mav = new ModelAndView("user_login");
			 mav.addObject("user_login", new User());
			 return mav;
		 }
	  
	  //search flights
		 @RequestMapping(value = "/search_flights_user", method = RequestMethod.GET)
		 public ModelAndView searchFlights_user(){			 
		 	 ModelAndView mav = new ModelAndView("search_flights_user");
		 	 return mav;
		  }
		 
		 @RequestMapping(value = "/search_flights_user", method = RequestMethod.POST)
			public ModelAndView searchFlightsProcess1(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ParseException {
			 String source = request.getParameter("source");
				String destination = request.getParameter("destination");
				SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
				 Date journey_date = formatter1.parse(request.getParameter("journey_date"));
				 System.out.println("date of journey:"+journey_date);
				String b_class = request.getParameter("class");
				int passenger_count =Integer.parseInt(request.getParameter("passenger_count").trim());
								
				//store booking enquired info in 
				session.setAttribute("source", source);
				session.setAttribute("destination", destination);
				session.setAttribute("journey_date", journey_date);
				session.setAttribute("b_class", b_class);
				session.setAttribute("passenger_count", passenger_count);
								
				List<Flights> flist = userRegisterService.searchFlights_user(source, destination, journey_date,b_class, passenger_count);
				ModelAndView mav = new ModelAndView("search_flights_user");
				mav.addObject("flights_list",flist);
				return mav;
			}  
		 
		 @RequestMapping(value = "/booking2", method = RequestMethod.POST)
			public ModelAndView booking2(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws ParseException {
			 
			 String flight_id = request.getParameter("flight_id");
			 String base_fare_eco1 = request.getParameter("base_fare_eco").trim();
			 System.out.println("base_fare_eco:"+base_fare_eco1);
			 int base_fare_eco =Integer.parseInt(base_fare_eco1);
				
			 String booking_id="B"+(long)new Date().getTime();
			 String source =(String)session.getAttribute("source");
			 String destination =(String)session.getAttribute("destination");
			 String b_class =(String)session.getAttribute("b_class");
			 Date journey_date =(Date)session.getAttribute("journey_date");
			 int passenger_count =(Integer)session.getAttribute("passenger_count");
			 
			Booking booking = new Booking();
			booking.setStatus("confirmed");	
			Flights f = new Flights(); 
			f.setFlight_id(flight_id);
			booking.setFlight(f);
		
			booking.setBooking_date(new Date());
			booking.setB_class(b_class);
			booking.setJourney_date(journey_date);
			booking.setPassenger_count(passenger_count);
			booking.setTotal_fare(passenger_count*base_fare_eco);
			booking.setBooking_id(booking_id);
			
			
			String email_id=(String)session.getAttribute("email_id");
			User user = new User();
			user.setEmail_id(email_id);
			booking.setUser(user);
			
			session.setAttribute("booking", booking);
			
			ModelAndView mav = new ModelAndView("passenger_form");
			mav.addObject("booking",booking);
			return mav;
			 
			 
		 }
		 
		 @RequestMapping(value = "/booking3", method = RequestMethod.POST)
			public ModelAndView booking3(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws ParseException {
		
			 String first_name=request.getParameter("first_name");
			 String last_name = request.getParameter("last_name");
			 int age = Integer.parseInt(request.getParameter("age"));
			 String gender = request.getParameter("gender");
			 String email=request.getParameter("email");
			 
			 Passenger passenger = new Passenger();
			 passenger.setPassenger_id(new Date().getTime());
			 passenger.setGender(gender);
			 passenger.setAge(age);
			 passenger.setFirst_name(first_name);
			 passenger.setLast_name(last_name);
			 passenger.setEmail(email);
			 
			 Booking bookings =(Booking)session.getAttribute("booking");
			 bookings.getPassenger().add(passenger);
			 session.setAttribute("booking",bookings);
			
			 ModelAndView mav = new ModelAndView("make_payment");
			 mav.addObject("booking",bookings);
			 return mav;
				
				
		 }
		 
		 @RequestMapping(value = "/booking4", method = RequestMethod.POST)
			public ModelAndView makepayment(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws ParseException {
		    
				
			 String card_type = request.getParameter("card_type");
			 System.out.println("card type"+card_type);
			String card_number=(request.getParameter("card_number"));
			 System.out.println("card number:"+card_number);

		
			 String name = request.getParameter("name");
			 System.out.println(name);
			
			 Booking booking =(Booking)session.getAttribute("booking");
			 
			 Payment payment = new Payment();
			 payment.setPayment_id(new Date().getTime());
			 payment.setCard_number(card_number);
			 payment.setCard_type(card_type);
			 payment.setName(name);
	         payment.setBooking(booking);
		     booking.setPayment(payment);
			
		    boolean flag1=userRegisterService.makePayment(booking);
	
			 ModelAndView mav = new ModelAndView("mybill");
		     mav.addObject("booking", booking);
			 return mav;
				
				
		 }
	
		 @RequestMapping(value = "/result", method = RequestMethod.GET)
		 public ModelAndView result(HttpSession session){

			 String email_id = (String)session.getAttribute("email_id");			 
			List<Booking> lis = new ArrayList<Booking>();		
			 lis = userRegisterService.result(email_id);
		    for(int i = 0; i < lis.size(); i++)
				 {
				     System.out.println(lis.get(i));
				 }
		 	 ModelAndView mav = new ModelAndView("result");
		 	mav.addObject("booking_list",lis);
		 	 return mav;
		  }
		 
		 @RequestMapping(value = "/cancel_booking", method = RequestMethod.GET)
		 public ModelAndView cancelBooking(HttpServletRequest request, HttpServletResponse response){
			 
		 	 ModelAndView mav = new ModelAndView("cancel_booking");
		 	 mav.addObject("booking",new Booking());
		 	 return mav;
		  } 
		 
		 @RequestMapping(value = "/cancel_booking", method = RequestMethod.POST)
			public ModelAndView deleteTicket(HttpServletRequest request,HttpServletResponse response, @ModelAttribute Booking book)
		 {
			 String booking_id = request.getParameter("booking_id");
			 String email_id = request.getParameter("email_id");
			 System.out.println(booking_id+" "+email_id);
			 boolean flag=userRegisterService.cancelBooking(booking_id,email_id);
				
				ModelAndView mav = new ModelAndView("cancel_booking");
				mav.addObject("flag",flag);
				return mav;
			} 
}
