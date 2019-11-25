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
		 System.out.println("DOB:"+dob);
		  //String dob = request.getParameter("dob");
		  String gender =request.getParameter("gender");
		  long ph_no =Long.parseLong(request.getParameter("ph_no"));
		 // String ph_no = request.getParameter("ph_no");
		  
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
			
			 mav.setViewName("success");
			 
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
			public ModelAndView searchFlightsProcess1(HttpServletRequest request,HttpServletResponse response) throws ParseException {
			 String source = request.getParameter("source");
				String destination = request.getParameter("destination");
				SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
				 Date journey_date = formatter1.parse(request.getParameter("journey_date"));
				 System.out.println("date of journey:"+journey_date);
				String b_class = request.getParameter("b_class");
				int passenger_count =Integer.parseInt(request.getParameter("passengers").trim());
				List<Flights> flist = userRegisterService.searchFlights_user(source, destination, journey_date,b_class, passenger_count);
				
				ModelAndView mav = new ModelAndView("search_flights_user");
				mav.addObject("flights_list",flist);
				return mav;
			}  
		 
		 
		 @RequestMapping(value = "/result", method = RequestMethod.GET)
		 public ModelAndView result(HttpSession session){

			 String email_id = (String)session.getAttribute("email_id");
			 
			List<Booking> lis = new ArrayList<Booking>();
		
			 lis = userRegisterService.result(email_id);
			 System.out.println(lis);
			 System.out.println("size"+lis.size());
		    for(int i = 0; i < lis.size(); i++)
				 {
				     System.out.println(lis.get(i));
				 }
		 	 ModelAndView mav = new ModelAndView("result");
		 	mav.addObject("booking_list",lis);
		 	 return mav;
		  }
}
