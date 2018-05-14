package demo.models;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.Column;
import java.sql.Date;

@SuppressWarnings("unused")
@Table(name = "carrier")
@Entity
public class Carrier {
	
	@Id
	@Column(columnDefinition="VARCHAR(9)")
	private String carrier;
	
	@Column(columnDefinition="VARCHAR(100)")
	private String name; 
	@Column(columnDefinition="VARCHAR(100)")
	private String address1;
	@Column(columnDefinition="VARCHAR(100)")
	private String city;
	@Column(columnDefinition="VARCHAR(2)")
	private String state;
	@Column(columnDefinition="VARCHAR(10)")
	private String zip;
	@Column(columnDefinition="DATE")
	private java.sql.Date payDate;
	@Column(columnDefinition="DATE")
	private java.sql.Date start;
	@Column(columnDefinition="VARCHAR(8)")
	private String password;
	
	public void setCarrier(String carrier) {
		final int MAXLENGTH = 9;
		if(carrier == null) {
			this.carrier = null;
		} else {
			this.carrier = carrier.substring(0,Math.min(carrier.length(), MAXLENGTH));
		}
	}
	
	public String getCarrier() {
		return this.carrier;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
	
	public void setAddress1(String address) {
		this.address1 = address;
	}
	
	public String getAddress1() {
		return this.address1;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getCity() {
		return this.city;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public String getState() {
		return this.state;
	}
	
	public void setZip(String zip) {
		this.zip = zip;
	}
	
	public String getZip() {
		return this.zip;
	}
	
	public void setPayDate(java.sql.Date date) {
		this.payDate = date;
	}
	
	public java.sql.Date getPayDate() {
		return this.payDate;
	}
	
	public void setStartDate(java.sql.Date date) {
		this.start = date;
	}
	
	public java.sql.Date getStartDate() {
		return this.start;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return this.password;
	}
	
}
