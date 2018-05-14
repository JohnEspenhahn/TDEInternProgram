package demo.repositories;

import demo.models.Carrier;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceUnit;

import org.springframework.stereotype.Repository;






@Repository
public class CarrierRepositoryImpl implements CarrierRepository {

	@PersistenceUnit
	private EntityManagerFactory emf;
	
	private EntityManager getEntityManager() {
		return emf.createEntityManager();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Carrier> getAll() {
		EntityManager entityManager = getEntityManager();
		List<Carrier> l = null;
		try {
			EntityTransaction t = entityManager.getTransaction();
			t.begin();
			try {
				l = entityManager.createQuery("SELECT carrier FROM Carrier carrier").getResultList();
			} finally {
				t.commit();
			}
		} finally {
			entityManager.close();
		}
		
		return l;
		
		
	}

}
