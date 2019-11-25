package com.airline_reservation.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="ROUTE_MASTER")
public class Route {

	@Id
	private String route_id;
	private String source;
	private String destination;
	@OneToMany(mappedBy="route",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	
	private List<Flights> flight_list=new ArrayList<Flights>();
	public String getRoute_id() {
		return route_id;
	}
	public void setRoute_id(String route_id) {
		this.route_id = route_id;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public List<Flights> getFlight_list() {
		return flight_list;
	}
	public void setFlight_list(List<Flights> flight_list) {
		this.flight_list = flight_list;
	}
	public Route() {
		super();
	}
	@Override
	public String toString() {
		return "Route [route_id=" + route_id + ", source=" + source + ", destination=" + destination + ", flight_list="
				+ flight_list + "]";
	}
}
