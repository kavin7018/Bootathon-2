package dao;

import Entity.Clients;
import Entity.Register;

public interface ClientDAO {
	Clients get_details_myprofile(String email);
	
	boolean update(Register register);
}
