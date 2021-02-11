package dao;

import java.util.List;

import Entity.Clients;
import Entity.Coupon;
import Entity.Register;

public interface ClientDAO {
	Clients get_details_myprofile(String email);
	
	boolean update(Register register);
	
	List<Coupon> getOffers();
}
