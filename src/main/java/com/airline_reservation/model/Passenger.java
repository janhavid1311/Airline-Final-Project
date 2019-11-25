package com.airline_reservation.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="PASSENGER_MASTER")
public class Passenger {

	@Id
    //@GeneratedValue(strategy = GenerationType.AUTO) 
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQUENCE1")
	//@SequenceGenerator(name="SEQUENCE1", sequenceName="SEQUENCE1", allocationSize=1)
	private long passenger_id;
          private String first_name;
          private String last_name;
          private int age; 
          private String gender;
          private String email;
          @ManyToOne(cascade=CascadeType.ALL)
          @JoinColumn(name="booking_id")
          private Booking booking;
		public long getPassenger_id() {
			return passenger_id;
		}
		public void setPassenger_id(long passenger_id) {
			this.passenger_id = passenger_id;
		}
		public String getFirst_name() {
			return first_name;
		}
		public void setFirst_name(String first_name) {
			this.first_name = first_name;
		}
		public String getLast_name() {
			return last_name;
		}
		public void setLast_name(String last_name) {
			this.last_name = last_name;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public Booking getBooking() {
			return booking;
		}
		public void setBooking(Booking booking) {
			this.booking = booking;
		}
		public Passenger() {
			super();
		}
		@Override
		public String toString() {
			return "Passenger [passenger_id=" + passenger_id + ", first_name=" + first_name + ", last_name=" + last_name
					+ ", age=" + age + ", gender=" + gender + ", email=" + email + ", booking=" + booking + "]";
		}
          
          
	/*
	 * @OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	 * 
	 * @JoinColumn(name="p_id") private Bookings booking;
	 */
      	
	
}
