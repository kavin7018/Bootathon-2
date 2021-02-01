package dao;

import Entity.Register;

public interface RegisterDAO {
	boolean AddClient(Register register);
	
	boolean update(Register register);
	
	boolean delete(int id);
	
}
