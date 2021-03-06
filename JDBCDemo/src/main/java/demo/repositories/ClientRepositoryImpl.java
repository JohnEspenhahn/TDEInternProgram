package demo.repositories;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceUnit;

import org.springframework.stereotype.Repository;

import demo.models.Client;

@Repository
public class ClientRepositoryImpl implements ClientRepository {
	
	@PersistenceUnit
	private EntityManagerFactory emf;
	
	private EntityManager getEntityManager() {
		return emf.createEntityManager();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Client> getAll() {
		// Note: do NOT do paginating (stuff with page/page_size)
		EntityManager entityManager = getEntityManager();
		List<Client> l = null;
		try {
			EntityTransaction t = entityManager.getTransaction();
			t.begin();
			try {
				l = entityManager.createQuery("SELECT client FROM Client client").getResultList();
			} finally {
				t.commit();
			}
		} finally {
			entityManager.close();
		}
		
		return l;
	}

}
