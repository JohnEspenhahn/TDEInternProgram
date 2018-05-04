package demo.repositories;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
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

	@Override
	public List<Client> getAll() {
		// TODO write this based on InvoiceRepositoryImpl
		// Note: do NOT do paginating (stuff with page/page_size)
		
		return null;
	}

}
