package com.airline_reservation.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.airline_reservation.model.Admin;
import com.airline_reservation.model.Booking;
import com.airline_reservation.model.Flights;
import com.airline_reservation.model.Payment;
import com.airline_reservation.model.User;

@Repository("userDao")
public class UserDaoImpl implements UserDaoIntf{

	@PersistenceContext
	EntityManager em;
	public boolean register(User user) {
		boolean flag=false;
	    try {
	    	System.out.println(user);
		/*em.getTransaction().begin( ); */
		em.persist(user);
		//em.getTransaction().commit();
		//em.close();
		System.out.println("end");
		flag=true;
	    }
	    catch(Exception e) { System.out.println("Error:"+e);  }
	    return flag;
	}

	public User checkUserLogin(User user) {
		
			User ad =null;
			try{
				ad=(User)em.createQuery("SELECT u FROM User u WHERE u.email_id=:email_id and u.password=:password")
			         .setParameter("email_id", user.getEmail_id())
			         .setParameter("password",user.getPassword())
			         .getSingleResult();
			}
			catch(Exception e) {
				System.out.println(e); 
				}
			//em.close();
			System.out.println(ad);
			return ad;
	}
	public List<Flights> searchFlights_user(String source, String destination,Date journey_date, String b_class,int passenger_count) {
		
		System.out.println(source+"\n"+destination+"\n"+journey_date+"\n"+passenger_count);
		String sql="select f FROM Flights f, Route r where r.source=:source and r.destination=:destination and f.route.route_id=r.route_id";
		String sql1="select sum(b.passenger_count) FROM Flights f, Booking b where f.flight_id=b.flight.flight_id and f.flight_id=:fid and b.journey_date=:journey_date and b.status='confirmed'";
		List<Flights> finallist = new ArrayList<Flights>();
				
				
				
		@SuppressWarnings("unchecked")
		List<Flights> allflist = em.createQuery(sql)
		                     .setParameter("source", source)
		                     .setParameter("destination", destination)
		                     .getResultList();
		for(Flights f:allflist){
			long totalseat= f.getEconomy_seats();
			long totlreservedseat=0;
			
			List<Object> objs =em.createQuery(sql1).setParameter("fid", f.getFlight_id()).setParameter("journey_date",journey_date).getResultList();
			System.out.println("objs:"+objs);
			if(objs!=null){
				try{
					totlreservedseat=(Long)objs.get(0);
				}
				catch(Exception e){}
			}
			//int totlreservedseat=(Integer)em.createQuery(sql1).getResultList().get(0);
			System.out.println("totalseat:"+totalseat+" \ntotlreservedseat:"+totlreservedseat);
			if ((totalseat-totlreservedseat)>=passenger_count)
				finallist.add(f);
				
		}
		
		return finallist;
	}		
		
	@SuppressWarnings("unchecked")
		public List<Booking> result(String email_id)
		{
			System.out.println("email_id:"+email_id);
			@SuppressWarnings("unchecked")
		
			 List<Booking> lis = new ArrayList<Booking>();
		/* lis = em.createQuery("select f from Booking f where f.user.email_id=:email_id")
					.setParameter("email_id",email_id).getResultList();*/
		 /*lis = em.createNativeQuery("select booking0_.booking_id as booking_id1_1_, booking0_.b_class as b_class2_1_, booking0_.booking_date as booking_date3_1_, booking0_.flight_id as flight_id6_1_, booking0_.journey_date as journey_date4_1_, booking0_.passenger_count as passenger_count5_1_, "
		 		+ "booking0_.email_id as email_id7_1_ from BOOKING_MASTER booking0_ where booking0_.email_id=:email").setParameter("email", email_id).getResultList();		 
		*/
		 
		 lis = em.createNativeQuery("select * from BOOKING_MASTER b where b.email_id=:email").setParameter("email", email_id).getResultList();		 
		 System.out.println(lis);
		
			
			return lis;
		}

	public int addbook(Booking booking){
		

	    
	    	System.out.println(booking);
	
		em.persist(booking);
		
		System.out.println("end");
	
	
	   
	    return 0;
		
	}
	public boolean cancelBooking(String booking_id, String email_id) {
		boolean flag=false;
		
	
		Query query = em.createNativeQuery("update booking_master set status='cancel' "
				+ "where booking_id=:booking_id and email_id=:email_id and journey_date>:curdate ");
		query.setParameter("booking_id", booking_id);
		query.setParameter("email_id", email_id);
		query.setParameter("curdate", new Date());
		int res = query.executeUpdate();
		if(res>0){
			flag=true;
		}
		return flag;
	}
		
		/*
		Query query = em.createQuery("delete from booking_master b where b.booking_id=:booking_id and b.user.email_id=:email_id and b.journey_date>:curdate" );
		query.setParameter("booking_id", booking_id);
		query.setParameter("email_id", email_id);
		query.setParameter("curdate", new Date());
		int res = query.executeUpdate();
		
		//System.out.println(res1+"  "+res2);
		
		if(res>0){
			flag=true;
		}
		else{
			System.out.println("Unable to cancel booking "+booking_id);
		}
		return flag;
		
	} */
		
	public boolean makePayment(Booking booking) {
		boolean flag=false;
	    try {
	    	System.out.println(booking);
		/*em.getTransaction().begin( ); */
		em.persist(booking);
		//em.getTransaction().commit();
		//em.close();
		System.out.println("end");
		flag=true;
	    }
	    catch(Exception e) { System.out.println("Error:"+e);  }
	    return flag;
	}
	

	}


