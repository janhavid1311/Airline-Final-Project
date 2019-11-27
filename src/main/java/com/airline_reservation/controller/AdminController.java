package com.airline_reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.airline_reservation.model.Admin;
import com.airline_reservation.model.Flights;
import com.airline_reservation.model.Route;
import com.airline_reservation.model.User;
import com.airline_reservation.service.AdminJobsServiceImpl;


@Controller("adminController")
public class AdminController {

	@Autowired
	public AdminJobsServiceImpl adminServiceImpl;
	
	@RequestMapping(value = "/admin_login", method = RequestMethod.GET)
	  public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("admin_login");
	    mav.addObject("admin", new Admin());
	    return mav;
	  }

	  @RequestMapping(value = "/admin_login", method = RequestMethod.POST)
	  public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,   @ModelAttribute Admin ladmin) {
	    ModelAndView mav = null;
	    Admin admin = adminServiceImpl.checkLogin(ladmin);
	    if (admin != null) {
	      mav = new ModelAndView("welcome");
	      mav.addObject("name", admin.getName());
	      //session manage
	      HttpSession session= request.getSession();
	      session.setAttribute("email_id", ladmin.getEmail_id());
	    } else {
	      mav = new ModelAndView("admin_login");
	      mav.addObject("message", "Email id or Password is incorrect!!");
	    }
	    return mav;
	  }
	  
	  @RequestMapping(value = "/admin_logout", method = RequestMethod.GET)
		public ModelAndView adminlogout(HttpServletRequest request, HttpServletResponse response) {
			 HttpSession session =request.getSession(false);
			 session.invalidate();
			 ModelAndView mav = new ModelAndView("admin_login");
			 mav.addObject("admin_login", new Admin());
			 return mav;
		 }


	  @RequestMapping(value = "/add_route", method = RequestMethod.GET)
	  public ModelAndView addRoute(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("add_route");
	    mav.addObject("route", new Route());
	    return mav;
	  }
	
	 @RequestMapping(value="/add_route" ,method=RequestMethod.POST)
		public ModelAndView addRouteProcess(HttpServletRequest request,HttpServletResponse response)
		{
		 String route_id =request.getParameter("route_id");
		  String source = request.getParameter("source");
		  String destination = request.getParameter("destination");
		  
		  
			Route route= new Route();
			route.setRoute_id(route_id);
			route.setSource(source);
			route.setDestination(destination);
			
			boolean flag=adminServiceImpl.addRoute(route);
			ModelAndView mav= new ModelAndView();
			mav.addObject("route_id", route_id);
			mav.addObject("source", source);
			mav.addObject("destination", destination);	
			
			 if (flag)
			 {
				 mav.addObject("status", "Thanks for msg..........................");
			 }
			 else
			 {
				 mav.addObject("status", "Thanks for msg..........................");
			 }
			
			 mav.setViewName("add_route");
			 
			 return mav;
		}
	 
	 
	 @RequestMapping(value = "/add_flight", method = RequestMethod.GET)
	  public ModelAndView addFlight(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("add_flight");
	    mav.addObject("flight", new Flights());
	    return mav;
	  }
	
	 @RequestMapping(value="/add_flight" ,method=RequestMethod.POST)
		public ModelAndView addFlightProcess(HttpServletRequest request,HttpServletResponse response)
		{
		 String flight_id =request.getParameter("flight_id");
		  String arrival_time = request.getParameter("arrival_time");
		  String departure_time = request.getParameter("departure_time");
		  
		  int business_seats =Integer.parseInt(request.getParameter("business_seats"));
		  int economy_seats =Integer.parseInt(request.getParameter("economy_seats"));
		  
		  int base_fare_eco =Integer.parseInt(request.getParameter("base_fare_eco"));
		  int base_fare_busi =Integer.parseInt(request.getParameter("base_fare_busi"));
		  int fuel_charge =Integer.parseInt(request.getParameter("fuel_charge"));
		  int sec_fee =Integer.parseInt(request.getParameter("sec_fee"));
		  int dev_fee =Integer.parseInt(request.getParameter("dev_fee"));
		 
		  Route route1=new Route();
		  route1.setRoute_id(request.getParameter("route_id"));
		 
			Flights flight= new Flights();
			flight.setFlight_id(flight_id);
			flight.setArrival_time(arrival_time);
			flight.setDeparture_time(departure_time);
			flight.setBusiness_seats(business_seats);
			flight.setEconomy_seats(economy_seats);
			flight.setRoute(route1);
			flight.setBase_fare_eco(base_fare_eco);
			flight.setBase_fare_busi(base_fare_busi);
			flight.setFuel_charge(fuel_charge);
			flight.setSec_fee(sec_fee);
			flight.setDev_fee(dev_fee);

			
			boolean flag=adminServiceImpl.addFlight(flight);
			ModelAndView mav= new ModelAndView();
			mav.addObject("flight_id", flight_id);
			mav.addObject("arrival_time", arrival_time);
			mav.addObject("departure_time", departure_time);	
			mav.addObject("business_seats", business_seats);
			mav.addObject("economy_seats", economy_seats);
			mav.addObject("base_fare_eco", base_fare_eco);
			mav.addObject("base_fare_busi", base_fare_busi);
			mav.addObject("fuel_charge", fuel_charge);
			mav.addObject("sec_fee", sec_fee);
			mav.addObject("dev_fee", dev_fee);
			
			 if (flag)
			 {
				 mav.addObject("status", "Thanks for msg..........................");
			 }
			 else
			 {
				 mav.addObject("status", "Thanks for msg..........................");
			 }
			
			 mav.setViewName("add_flight");
			 
			 return mav;
		}
	

	 @RequestMapping(value = "/delete_flight", method = RequestMethod.GET)
	  public ModelAndView deleteFlight(HttpServletRequest request, HttpServletResponse response) {
		 System.out.println("Controller");
	    ModelAndView mav = new ModelAndView("delete_flight");
	    mav.addObject("flight", new Flights());
	    return mav;
	  }
	 
	 @RequestMapping(value = "/delete_flight", method = RequestMethod.POST)
		public ModelAndView deleteFlightProcess(HttpServletRequest request,HttpServletResponse response) {
		 System.out.println("Controller");
			String flight_id = request.getParameter("flight_id");
			System.out.println(flight_id);
			
			boolean flag=adminServiceImpl.deleteFlight(flight_id);
			
			ModelAndView mav = new ModelAndView("view_flights");
			mav.addObject("flag",flag);
			return mav;
		}  
	 
	 
	 @RequestMapping(value = "/view_users", method = RequestMethod.GET)
	 public ModelAndView viewUsers() {
	 	List<User>  userlist = adminServiceImpl.getUsers();
	 	 ModelAndView mav = new ModelAndView("view_users");
	 	 mav.addObject("userlist", userlist);
	 	 return mav;
	  }
	 @RequestMapping(value = "/view_flights", method = RequestMethod.GET)
	 public ModelAndView viewFlights() {
	 	List<Flights>  flightlist = adminServiceImpl.getFlights();
	 	 ModelAndView mav = new ModelAndView("view_flights");
	 	 mav.addObject("flightlist", flightlist);
	 	 return mav;
	  }
	 
	 @RequestMapping(value = "/search_flights", method = RequestMethod.GET)
	 public ModelAndView searchFlights(){
		 
	 	 ModelAndView mav = new ModelAndView("search_flights");
	 	 return mav;
	  }
	 
	 @RequestMapping(value = "/search_flights", method = RequestMethod.POST)
		public ModelAndView searchFlightsProcess(HttpServletRequest request,HttpServletResponse response) {
		 String source = request.getParameter("source");
			String destination = request.getParameter("destination");
			List<Flights> list = adminServiceImpl.searchFlights(source, destination);
			
			ModelAndView mav = new ModelAndView("search_flights");
			mav.addObject("flightslist",list);
			return mav;
		}  
	 
	 @RequestMapping(value = "/view_route", method = RequestMethod.GET)
	 public ModelAndView viewRoute() {
	 	List<Route>  routelist = adminServiceImpl.getRoute();
	 	 ModelAndView mav = new ModelAndView("view_route");
	 	 mav.addObject("routelist", routelist);
	 	 return mav;
	  }
	 
}
