package demo.repositories;

import java.util.List;

import demo.models.*;

public interface InvoiceRepository {
	public Invoice findByFbnumber(Long fbnumber);
	public List<Invoice> findByProno(String prono);
	public List<Invoice> findAll();
	public List<Invoice> findAll(int page, int page_size);
	public List<Invoice> findByClient(String client);
	public List<Invoice> findByCarrier(String carrier);
	public Boolean save(Invoice client);
	public Boolean remove(Long fbnumber);
}
