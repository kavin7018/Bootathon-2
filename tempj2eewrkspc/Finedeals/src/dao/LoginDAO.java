package dao;

import Entity.Login;

public interface LoginDAO {
	public String authenticate(Login login);
}
