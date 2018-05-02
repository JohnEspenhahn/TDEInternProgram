package main.java.demo.repositories;

import java.util.List;

import main.java.demo.models.*;

public interface InvoiceRepository {
	public Invoice findByFbnumber(Long fbnumber);
	public List<Invoice> findByProno(String prono);
	public List<Invoice> findAll();
	public List<Invoice> findByClient(String client);
	public List<Invoice> findByCarrier(String carrier);
	public Boolean save(Invoice client);
	public Boolean remove(Long fbnumber);
}
