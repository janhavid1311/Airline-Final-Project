package com.airline_reservation.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="BOOKING_MASTER")
public class Booking {
	
	@Id
	private String booking_id;
	private Date booking_date;
	private Date journey_date;
	private String b_class;
	private int passenger_count;

	@ManyToOne
	@JoinColumn(name="flight_id")
	private Flights flight;
	
	@ManyToOne
	@JoinColumn(name="email_id")
	private User user;

	public String getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(String booking_id) {
		this.booking_id = booking_id;
	}

	public Date getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}

	public Date getJourney_date() {
		return journey_date;
	}

	public void setJourney_date(Date journey_date) {
		this.journey_date = journey_date;
	}

	public String getB_class() {
		return b_class;
	}

	public void setB_class(String b_class) {
		this.b_class = b_class;
	}

	public int getPassenger_count() {
		return passenger_count;
	}

	public void setPassenger_count(int passenger_count) {
		this.passenger_count = passenger_count;
	}

	public Flights getFlight() {
		return flight;
	}

	public void setFlight(Flights flight) {
		this.flight = flight;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Booking [booking_id=" + booking_id + ", booking_date=" + booking_date + ", journey_date=" + journey_date
				+ ", b_class=" + b_class + ", passenger_count=" + passenger_count + ", flight=" + flight + ", user="
				+ user + "]";
	}

	public Booking() {
		super();
	}

	
}
