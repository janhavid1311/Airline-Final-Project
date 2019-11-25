/*package com.airline_reservation.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
ID
FLIGHT_ID
BASE_FARE_ECO
BASE_FARE_BUSI
FUEL_CHARGE
SECURITY_FEE
DEV_FEE
VARIABLE_CHARGES

//@Entity
//@Table(name="TICKET_FARE_MASTER")
public class Ticket_Fare {

	@Id 
	@GeneratedValue(strategy = GenerationType.AUTO)   
	private int id;
	private int base_fare_eco;
	private int base_fare_busi;
	private int fuel_charge;
	private int security_fee;
	private int dev_fee;
	private int variable_charges;

	@OneToOne
    @JoinColumn(name="flight_id")
    private Flights flight;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public int getSecurity_fee() {
		return security_fee;
	}

	public void setSecurity_fee(int security_fee) {
		this.security_fee = security_fee;
	}

	public int getDev_fee() {
		return dev_fee;
	}

	public void setDev_fee(int dev_fee) {
		this.dev_fee = dev_fee;
	}

	public int getVariable_charges() {
		return variable_charges;
	}

	public void setVariable_charges(int variable_charges) {
		this.variable_charges = variable_charges;
	}

	public Flights getFlight() {
		return flight;
	}

	public void setFlight(Flights flight) {
		this.flight = flight;
	}

	public Ticket_Fare() {
		super();
	}

	@Override
	public String toString() {
		return "Ticket_Fare [id=" + id + ", base_fare_eco=" + base_fare_eco + ", base_fare_busi=" + base_fare_busi
				+ ", fuel_charge=" + fuel_charge + ", security_fee=" + security_fee + ", dev_fee=" + dev_fee
				+ ", variable_charges=" + variable_charges + ", ]";
	}
	
	
}
*/