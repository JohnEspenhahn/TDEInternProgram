package demo.models;

import java.lang.reflect.Field;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "nfreight")
@Entity
public class Invoice {
	@Column(columnDefinition="DATE")
	private java.sql.Date dateproc; // Date it was input into the system
	@Column(columnDefinition="VARCHAR(9)")
	private String client;
	@Column(columnDefinition="VARCHAR(4)")
	private String carrier;
	@Column(columnDefinition="VARCHAR(20)")
	private String prono;
	@Column(columnDefinition="DATE")
	private java.sql.Date dateship; // This is the one used for the cutoff?
	@Column(columnDefinition="VARCHAR(200)")
	private String companyfrom;
	@Column(columnDefinition="VARCHAR(200)")
	private String addressfrom;
	@Column(columnDefinition="VARCHAR(10)")
	private String zipfrom;
	@Column(columnDefinition="VARCHAR(30)")
	private String cityfrom;
	@Column(columnDefinition="VARCHAR(2)")
	private String statefrom;
	@Column(columnDefinition="VARCHAR(200)")
	private String addressto;
	@Column(columnDefinition="VARCHAR(10)")
	private String zipto;
	@Column(columnDefinition="VARCHAR(30)")
	private String cityto;
	@Column(columnDefinition="VARCHAR(2)")
	private String stateto;
	@Column(columnDefinition="DECIMAL(12,6)")
	private Double totweight;
	@Column(columnDefinition="DECIMAL(15,4)")
	private Double totbill;
	@Column(columnDefinition="DECIMAL(15,4)")
	private Double corrbill;
	@Column(columnDefinition="VARCHAR(30)")
	private String qtyship;
	@Column(columnDefinition="DATE")
	private java.sql.Date procdate; // Date it was processed for AR
	@Column(columnDefinition="VARCHAR(6)")
	private String billto;
	@Column(columnDefinition="INT(11)")
	private Long invoiceno;
	@Column(columnDefinition="VARCHAR(3)")
	private String currency;
	@Column(columnDefinition="INT(11)")
	private Long statement;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(columnDefinition="BIGINT(13)")
	private Long fbnumber;
	
	public Invoice copy() throws IllegalArgumentException, IllegalAccessException {
		Invoice inv = new Invoice();
		
		Field[] fields = Invoice.class.getDeclaredFields();
		for (Field f: fields) {
			if (f.isAnnotationPresent(Column.class)) {
				f.set(inv, f.get(this));
			}
		}
		
		return inv;
	}
	public void setDateproc(java.sql.Date dateproc) {
		this.dateproc = dateproc;
	}
	public java.sql.Date getDateproc() {
		return this.dateproc;
	}
	public void setClient(String client) {
		if (client == null) return;
		this.client = client.substring(0, Math.min(client.length(), 9));
	}
	public String getClient() {
		return this.client;
	}
	public void setCarrier(String carrier) {
		if (carrier == null) return;
		this.carrier = carrier.substring(0, Math.min(carrier.length(), 4));
	}
	public String getCarrier() {
		return this.carrier;
	}
	public void setProno(String prono) {
		if (prono == null) return;
		this.prono = prono.substring(0, Math.min(prono.length(), 20));
	}
	public String getProno() {
		return this.prono;
	}
	public void setDateship(java.sql.Date dateship) {
		this.dateship = dateship;
	}
	public java.sql.Date getDateship() {
		return this.dateship;
	}
	public void setZipfrom(String zipfrom) {
		if (zipfrom == null) return;
		this.zipfrom = zipfrom.substring(0, Math.min(zipfrom.length(), 10));
	}
	public String getZipfrom() {
		return this.zipfrom;
	}
	public void setCityfrom(String cityfrom) {
		if (cityfrom == null) return;
		this.cityfrom = cityfrom.substring(0, Math.min(cityfrom.length(), 30));
	}
	public String getCityfrom() {
		return this.cityfrom;
	}
	public void setStatefrom(String statefrom) {
		if (statefrom == null) return;
		this.statefrom = statefrom.substring(0, Math.min(statefrom.length(), 2));
	}
	public String getStatefrom() {
		return this.statefrom;
	}
	public void setZipto(String zipto) {
		if (zipto == null) return;
		this.zipto = zipto.substring(0, Math.min(zipto.length(), 10));
	}
	public String getZipto() {
		return this.zipto;
	}
	public void setCityto(String cityto) {
		if (cityto == null) return;
		this.cityto = cityto.substring(0, Math.min(cityto.length(), 30));
	}
	public String getCityto() {
		return this.cityto;
	}
	public void setStateto(String stateto) {
		if (stateto == null) return;
		this.stateto = stateto.substring(0, Math.min(stateto.length(), 2));
	}
	public String getStateto() {
		return this.stateto;
	}
	public void setTotweight(Double totweight) {
		this.totweight = totweight;
	}
	public Double getTotweight() {
		return this.totweight;
	}
	public void setTotbill(Double totbill) {
		this.totbill = totbill;
	}
	public Double getTotbill() {
		return (this.totbill == null ? 0 : this.totbill);
	}
	public void setCorrbill(Double corrbill) {
		this.corrbill = corrbill;
	}
	public Double getCorrbill() {
		return (this.corrbill == null ? 0 : this.corrbill);
	}
	public void setQtyship(String qtyship) {
		this.qtyship = qtyship;
	}
	public String getQtyship() {
		return this.qtyship;
	}
	public void setProcdate(java.sql.Date procdate) {
		this.procdate = procdate;
	}
	public java.sql.Date getProcdate() {
		return this.procdate;
	}
	public void setBillto(String billto) {
		if (billto == null) return;
		this.billto = billto.substring(0, Math.min(billto.length(), 6));
	}
	public String getBillto() {
		return this.billto;
	}
	public void setInvoiceno(Long invoiceno) {
		this.invoiceno = invoiceno;
	}
	public Long getInvoiceno() {
		return this.invoiceno;
	}
	public void setCurrency(String currency) {
		if (currency == null) this.currency = null;
		else this.currency = currency.substring(0, Math.min(currency.length(), 3));
	}
	public String getCurrency() {
		return this.currency;
	}
	public void setStatement(Long statement) {
		this.statement = statement;
	}
	public Long getStatement() {
		return this.statement;
	}
	public void setFbnumber(Long fbnumber) {
		this.fbnumber = fbnumber;
	}
	public Long getFbnumber() {
		return this.fbnumber;
	}
	public void setCompanyfrom(String companyfrom) {
		this.companyfrom = companyfrom;
	}
	public String getCompanyfrom() {
		return this.companyfrom;
	}
	public void setAddressfrom(String addressfrom) {
		this.addressfrom = addressfrom;
	}
	public String getAddressfrom() {
		return this.addressfrom;
	}
	public void setAddressto(String addressto) {
		this.addressto = addressto;
	}
	public String getAddressto() {
		return this.addressto;
	}
	
	@Override
	public String toString() {
		return "(" + this.getFbnumber() + ") Pro:" + this.getProno() + " Carrier:" + this.getCarrier();  
	}
}
