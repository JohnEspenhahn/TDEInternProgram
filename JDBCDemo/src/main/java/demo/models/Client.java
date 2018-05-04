package demo.models;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.Column;

@Table(name = "client")
@Entity
public class Client {
	/*
	 *  The @Id column is the most important column
	 *  	it uniquely identifies an entry in the client table
	 *  	every model needs an @Id column (it corresponds to the
	 *  	column in the database that is tagged "PRIMARY KEY"
	 */
	@Id
	@Column(columnDefinition="VARCHAR(9)")
	private String client;
	
	/*
	 * A small selection of the other columns
	 */
	
	@Column(columnDefinition="VARCHAR(100)")
	private String name; // We need name for the demo (see invoiceEdit.html)
	@Column(columnDefinition="VARCHAR(100)")
	private String address1;
	@Column(columnDefinition="VARCHAR(100)")
	private String address2;
	@Column(columnDefinition="VARCHAR(100)")
	private String city;
	@Column(columnDefinition="VARCHAR(2)")
	private String state;
	@Column(columnDefinition="VARCHAR(10)")
	private String zipcode;
	
	/*
	 * Every column we defined above needs to have a setter and a getter
	 */

	/**
	 * Set the "client" column, validating that the input is not longer
	 * than the length defined in the database
	 * @param client The inputted value
	 */
	public void setClient(String client) {
		final int MAXLENGTH = 9;
		if (client == null) {
			// Handles null case
			this.client = null;
		} else {
			// Get the "substring" of client that is at most MAXLENGTH characters long
			this.client = client.substring(0,Math.min(client.length(), MAXLENGTH));
		}
	}
	public String getClient() {
		return this.client;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return this.name;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress1() {
		return this.address1;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress2() {
		return this.address2;
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
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getZipcode() {
		return this.zipcode;
	}
}
