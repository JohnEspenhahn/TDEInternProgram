package demo.repositories;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceUnit;

import org.springframework.stereotype.Repository;

import demo.models.Invoice;

@Repository
public class InvoiceRepositoryImpl implements InvoiceRepository {

	@PersistenceUnit
	private EntityManagerFactory emf;
	
	private EntityManager getEntityManager() {
		return emf.createEntityManager();
	}
	
	@PostConstruct
	public void init() {
		System.out.println("InvoiceRepository constructed");
	}
	
	@Override
	public List<Invoice> findAll() {
		return findAll(0, 100);
	}

	/**
	 * @param page Page offset in the results
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Invoice> findAll(int page, int page_size) {
		if (page < 0 || page_size <= 0) return new ArrayList<Invoice>();
		
		EntityManager entityManager = getEntityManager();
		List<Invoice> l = null;
		try {
			EntityTransaction t = entityManager.getTransaction();
			t.begin();
			try {
				l = entityManager.createQuery("SELECT invoice FROM Invoice invoice ORDER BY invoice.fbnumber").setFirstResult(page*page_size).setMaxResults(page_size).getResultList();
			} finally {
				t.commit();
			}
		} finally {
			entityManager.close();
		}
		return l;
	}

	@Override
	public Invoice findByFbnumber(Long fbnumber) {
		EntityManager entityManager = getEntityManager();
		Invoice c = null;
		try {
			EntityTransaction t = entityManager.getTransaction();
			t.begin();
			try {
				c = entityManager.find(Invoice.class, fbnumber);
			} finally {
				t.commit();
			}
		} finally {
			entityManager.close();
		}
		return c;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Invoice> findByProno(String prono) {
		EntityManager entityManager = getEntityManager();
		List<Invoice> l = null;
		try {
			EntityTransaction t = entityManager.getTransaction();
			t.begin();
			try {
				l = entityManager.createQuery("SELECT invoice FROM Invoice invoice WHERE invoice.prono LIKE :prono").setParameter("prono", prono).setMaxResults(1000).getResultList();
			} finally {
				t.commit();
			}
		} finally {
			entityManager.close();
		}
		return l;
	}
		
	@Override
	@SuppressWarnings("unchecked")
	public List<Invoice> findByClient(String client) {
		EntityManager entityManager = getEntityManager();
		List<Invoice> l = null;
		try {
			EntityTransaction t = entityManager.getTransaction();
			t.begin();
			try {
				l = entityManager.createQuery("SELECT invoice FROM Invoice invoice WHERE invoice.client =:client").setParameter("client", client).getResultList();
			} finally {
				t.commit();
			}
		} finally {
			entityManager.close();
		}
		return l;
	}

	@Override
	public Boolean save(Invoice invoice) {
		EntityManager entityManager = getEntityManager();
		try {
			EntityTransaction t = entityManager.getTransaction();
			t.begin();
			try {
				if(invoice.getFbnumber() == null) {
					entityManager.persist(invoice);
				}
				Invoice c = entityManager.find(Invoice.class, invoice.getFbnumber());
				if(entityManager.contains(c)) {
					entityManager.merge(invoice);
					entityManager.flush();
				} else {
					entityManager.persist(invoice);
				}
			} catch (Exception up) {
				t.rollback();
			} finally{
				try {
				   if(t.isActive())
				   {
						t.commit();
				   }
				} catch (Exception ex) {
				   t.rollback();
				}
			}
		} finally {
			entityManager.close();
		}
		return false;
	}

	@Override
	public Boolean remove(Long fbnumber) {
		EntityManager entityManager = getEntityManager();
		try {
			EntityTransaction t = entityManager.getTransaction();
			t.begin();
			try {
				Invoice c = entityManager.find(Invoice.class, fbnumber);
				if(entityManager.contains(c)) {
					entityManager.remove(c);
					entityManager.flush();
				}
			} catch (Exception up) {
				t.rollback();
				//throw up;
			} finally{
				try {
				   if(t.isActive())
				   {
						t.commit();
				   }
				} catch (Exception ex) {
				   t.rollback();
				}
			}
		} finally {
			entityManager.close();
		}
		return false;
	}
}
