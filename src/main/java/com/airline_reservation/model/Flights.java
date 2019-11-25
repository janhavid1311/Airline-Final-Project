package com.airline_reservation.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="FLIGHT_MASTER")
public class Flights {

	@Id
	private String flight_id;
	private String arrival_time;
	private String departure_time;
	private int business_seats;
	private int economy_seats;
	
	@ManyToOne
	@JoinColumn(name="route_id")
	private Route route;
	
	@OneToMany
	@JoinColumn(name="flight_id")
	private List<Booking> booking=new ArrayList<Booking>();
	public String getFlight_id() {
		return flight_id;
	}
	public void setFlight_id(String flight_id) {
		this.flight_id = flight_id;
	}
	public String getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}
	public String getDeparture_time() {
		return departure_time;
	}
	public void setDeparture_time(String departure_time) {
		this.departure_time = departure_time;
	}
	public int getBusiness_seats() {
		return business_seats;
	}
	public void setBusiness_seats(int business_seats) {
		this.business_seats = business_seats;
	}
	public int getEconomy_seats() {
		return economy_seats;
	}
	public void setEconomy_seats(int economy_seats) {
		this.economy_seats = economy_seats;
	}
	public Route getRoute() {
		return route;
	}
	public void setRoute(Route route) {
		this.route = route;
	}
	public Flights() {
		super();
	}
	@Override
	public String toString() {
		return "Flights [flight_id=" + flight_id + ", arrival_time=" + arrival_time + ", departure_time="
				+ departure_time + ", business_seats=" + business_seats + ", economy_seats=" + economy_seats
				+ ", route=" + route + "]";
	} 
}	 
