package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Clients;
import Entity.Register;
import dao.ClientDAO;
import dao.ClientDAOImpl;
import dao.RegisterDAO;
import dao.RegisterDAOImpl;

public class ClientController extends HttpServlet{

	private static final long serialVersionUID = 1608889138209781781L;
	Clients clients = null;
	ClientDAO clientdao = null;
	RequestDispatcher dispatch = null;
	RegisterDAO registerdao = null;
	
	public ClientController() {
		clientdao = new ClientDAOImpl();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if(action==null) {
			action="home";
		}
		
		switch(action) {
		case "home":
			resp.sendRedirect("Home.jsp");
			break;
			
		case "LIST":
			ListProfile(req,resp);
			break;
			
		case "EDIT":
			getSingleClient(req,resp);
			break;
			
		default:
			resp.sendRedirect("Home.jsp");
			break;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String username = req.getParameter("username");
		String dob = req.getParameter("dob");
		String gender = req.getParameter("gender");
		String country = req.getParameter("country");
				
		Register register = new Register();
		register.setEmail(email);
		register.setPassword(password);
		register.setUsername(username);
		register.setGender(gender);
		register.setDob(dob);
		register.setCountry(country);
		register.setId(Integer.parseInt(id));
		
		clientdao = new ClientDAOImpl();
		if(clientdao.update(register)) {
			req.setAttribute("message", "Updated Succesfully");
		}
		ListProfile(req,resp);
	}
	
	
	public void ListProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		clients = clientdao.get_details_myprofile(email);
		req.setAttribute("client", clients);
		dispatch = req.getRequestDispatcher("/views/Profile.jsp");
		dispatch.forward(req, resp);
	}
	
	public void getSingleClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		clients = clientdao.get_details_myprofile(email);
		req.setAttribute("client", clients);
		dispatch = req.getRequestDispatcher("/views/ProfileEdit.jsp");
		dispatch.forward(req, resp);
	}
}