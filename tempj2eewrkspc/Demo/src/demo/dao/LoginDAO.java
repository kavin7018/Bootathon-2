package demo.dao;

import demo.entity.Login;

public interface LoginDAO {
	public String authenticate(Login login);
}
