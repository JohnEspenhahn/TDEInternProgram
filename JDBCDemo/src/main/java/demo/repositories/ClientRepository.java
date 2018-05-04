package demo.repositories;

import java.util.List;

import demo.models.Client;

public interface ClientRepository {
	List<Client> getAll();
}