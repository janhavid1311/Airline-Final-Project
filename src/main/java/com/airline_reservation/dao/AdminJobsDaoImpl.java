package com.airline_reservation.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.airline_reservation.model.Admin;
import com.airline_reservation.model.Flights;
import com.airline_reservation.model.Route;
import com.airline_reservation.model.User;


//import com.airline_reservation.model.Flights;
@Repository
public class AdminJobsDaoImpl implements AdminJobsDaoIntf{
	

	@PersistenceContext
	EntityManager em;
	
	public Admin checkLogin(Admin admin) {
		Admin ad =null;
		try{
			ad=(Admin)em.createQuery("SELECT a FROM Admin a WHERE a.email_id=:email_id and a.password=:password")
		         .setParameter("email_id", admin.getEmail_id())
		         .setParameter("password",admin.getPassword())
		         .getSingleResult();
		}
		catch(Exception e) {
			System.out.println(e); 
			}
		//em.close();
		System.out.println(ad);
		return ad;
	  }

	
	public boolean addRoute(Route route) {
		boolean flag=false;
	    try {
	    	System.out.println(route);
		//em.getTransaction().begin( ); 
		em.persist(route);
		//em.getTransaction().commit();
		//em.close();
		System.out.println("end");
		flag=true;
	    }
	    catch(Exception e) { System.out.println("Error:"+e);  }
	    return flag;
	}

	
	
	public boolean addFlight(Flights flight) {
		boolean flag=false;
	    try {
	    	System.out.println(flight);
		//em.getTransaction().begin( ); 
		em.persist(flight);
		//em.getTransaction().commit();
		//em.close();
		System.out.println("end");
		flag=true;
	    }
	    catch(Exception e) { System.out.println("Error:"+e);  }
	    return flag;
	}
	
	
	
		
	public boolean deleteFlight(String flight_id) {
		System.out.println("Dao:"+flight_id);
		boolean flag=false;
		Query query = em.createNativeQuery("delete from flight_master where flight_id=:id" );
		query.setParameter("id", flight_id);
		int res = query.executeUpdate();
		
		System.out.println(res);
		if(res>0){
			flag=true;
		}
		else{
			System.out.println("Unable to remove flight "+flight_id);
		}
		return flag;
		
 
		

	
	}


	public List<User> getUsers() {
		 @SuppressWarnings("unchecked")
			List<User> users = em.createQuery("SELECT u FROM  User u").getResultList();
		  return  users;
	}


	public User getUser1(String email_id) {
		User user = (User)em.createQuery("SELECT u FROM  User u where u.email_id=:email_id")
				  .setParameter("email_id", email_id)
				  .getSingleResult();
		  return  user;
	}


	public List<Flights> getFlights() {
		@SuppressWarnings("unchecked")
		List<Flights> flights = em.createQuery("SELECT f FROM  Flights f").getResultList();
	  return  flights;
	}


	public Flights getFlight1(String flight_id) {
		Flights flight = (Flights)em.createQuery("SELECT f FROM  Flights f where f.flight_id=:flight_id")
				  .setParameter("flight_id", flight_id)
				  .getSingleResult();
		  return  flight;
	}


	public List<Flights> searchFlights(String source, String destination) {
		@SuppressWarnings("unchecked")
		List<Flights> list = em.createQuery("SELECT f FROM Flights f, Route r where r.source=:source and r.destination=:destination and f.route.route_id=r.route_id")
		                     .setParameter("source", source)
		                     .setParameter("destination", destination)
                             .getResultList();		
		return list;
	}

}

