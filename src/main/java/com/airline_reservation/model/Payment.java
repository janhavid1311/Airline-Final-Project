package com.airline_reservation.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Payment {

	@Id
	private long payment_id;
	
	private String card_number;
	private String card_type;
	private String name;
    	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="booking_id")
	private Booking booking;

	public long getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(long payment_id) {
		this.payment_id = payment_id;
	}

	public String getCard_number() {
		return card_number;
	}

	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}

	public String getCard_type() {
		return card_type;
	}

	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

	@Override
	public String toString() {
		return "Payment [payment_id=" + payment_id + ", card_number=" + card_number + ", card_type=" + card_type
				+ ", name=" + name + ", booking=" + booking + "]";
	}

	public Payment() {
		super();
	}


	
	
	}
	

