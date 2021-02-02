package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Register;
import dao.RegisterDAO;
import dao.RegisterDAOImpl;

public class RegistrationController extends HttpServlet {

	private static final long serialVersionUID = 8221629696180483248L;
	RequestDispatcher dispatch = null;
	RegisterDAO registerDAO = null; 
	
	public RegistrationController() {
		registerDAO = new RegisterDAOImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String username = req.getParameter("username");
		String gender = req.getParameter("gender");
		String country = req.getParameter("country");
		String dob = req.getParameter("dob");
		
		Register register = new Register();
		register.setEmail(email);
		register.setPassword(password);
		register.setUsername(username);
		register.setGender(gender);
		register.setCountry(country);
		register.setUsername(username);
		register.setDob(dob);
		
		if(registerDAO.AddClient(register)) {
			resp.sendRedirect("Login.jsp?status=Registered");
		}
		else{
			resp.sendRedirect("RegisterJSP.jsp");
		}
	}
}
