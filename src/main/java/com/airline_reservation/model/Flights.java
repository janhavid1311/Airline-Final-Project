package com.airline_reservation.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
	private int base_fare_eco;
	private int base_fare_busi;
	private int fuel_charge;
	@Column(name="security_fee")
	private int sec_fee;
	
	private int dev_fee;
	
	public int getBase_fare_eco() {
		return base_fare_eco;
	}
	public void setBase_fare_eco(int base_fare_eco) {
		this.base_fare_eco = base_fare_eco;
	}
	public int getBase_fare_busi() {
		return base_fare_busi;
	}
	public void setBase_fare_busi(int base_fare_busi) {
		this.base_fare_busi = base_fare_busi;
	}
	public int getFuel_charge() {
		return fuel_charge;
	}
	public void setFuel_charge(int fuel_charge) {
		this.fuel_charge = fuel_charge;
	}
	public int getSec_fee() {
		return sec_fee;
	}
	public void setSec_fee(int sec_fee) {
		this.sec_fee = sec_fee;
	}
	public int getDev_fee() {
		return dev_fee;
	}
	public void setDev_fee(int dev_fee) {
		this.dev_fee = dev_fee;
	}
	@ManyToOne
	@JoinColumn(name="route_id")
	private Route route;
	
	@OneToMany
	@JoinColumn(name="flight_id")
	private List<Booking> booking=new ArrayList<Booking>();
	
	

	public List<Booking> getBooking() {
		return booking;
	}
	public void setBooking(List<Booking> booking) {
		this.booking = booking;
	}
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
	
	
	/*public Ticket_Fare getTicket_Fare() {
		return ticket_Fare;
	}
	public void setTicket_Fare(Ticket_Fare ticket_Fare) {
		this.ticket_Fare = ticket_Fare;
	}*/
	
	/*@Override
	public String toString() {
		return "Flights [flight_id=" + flight_id + ", arrival_time=" + arrival_time + ", departure_time="
				+ departure_time + ", business_seats=" + business_seats + ", economy_seats=" + economy_seats
				+ ", route=" + route + ", booking=" + booking + "]";
	}
	*/
	} 

