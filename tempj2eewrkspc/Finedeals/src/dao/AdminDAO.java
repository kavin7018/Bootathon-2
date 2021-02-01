package dao;

import java.util.List;

import Entity.Clients;

public interface AdminDAO {
	List<Clients> GetAllClients();
	
	Clients getSingleClient(int id);
}
