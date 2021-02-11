package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Clients;
import Entity.Coupon;
import Entity.Register;
import dao.AdminDAO;
import dao.AdminDAOImpl;
import dao.ClientDAO;
import dao.ClientDAOImpl;
import dao.RegisterDAO;
import dao.RegisterDAOImpl;

public class AdminController extends HttpServlet{

	private static final long serialVersionUID = 3054414477752161268L;
	AdminDAO adminDAO = null;
	RegisterDAO registerDAO = null;
	ClientDAO clientdao = null;
	List<Clients> list = null;
	RequestDispatcher dispatch = null;
	Clients client = null;

	public AdminController() {
		adminDAO = new AdminDAOImpl();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		if(action==null) {
			action="Front";
		}
		
		switch(action) {
		case "Front":
			getFrontPage(req,resp);
			break;
		case "LIST":
			ListAllClients(req,resp);
			break;
			
		case "EDIT":
			getSingleClient(req,resp);
			break;
			
		case "DELETE":
			deleteClient(req,resp);
			break;
			
		default:
			ListAllClients(req,resp);
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
		
		if(id.isEmpty() || id=="") {
			registerDAO = new RegisterDAOImpl();
			if(registerDAO.AddClient(register)) {
				req.setAttribute("Message", "Inserted Successfully");
			}
		}
		else {
			register.setId(Integer.parseInt(id));
			registerDAO = new RegisterDAOImpl();
			if(registerDAO.update(register)) {
				req.setAttribute("Message", "Updated Successfully");
			}
		}
		ListAllClients(req,resp);
	}
	
	public void getFrontPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		clientdao = new ClientDAOImpl();
		List<Coupon> offers = clientdao.getOffers(); 
		req.setAttribute("offers",offers);
		dispatch = req.getRequestDispatcher("HomePage.jsp"); 
		dispatch.forward(req,resp);
	}
	
	public void ListAllClients(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		list = adminDAO.GetAllClients();
		req.setAttribute("list", list);
		dispatch = req.getRequestDispatcher("/views/Client-list.jsp");
		dispatch.forward(req, resp);
	}
	
	public void getSingleClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		client = adminDAO.getSingleClient(Integer.parseInt(id));
		req.setAttribute("client", client);
		dispatch = req.getRequestDispatcher("/views/Client-add.jsp");
		dispatch.forward(req, resp);
	}
	
	public void deleteClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		registerDAO = new RegisterDAOImpl();
		if(registerDAO.delete(Integer.parseInt(id))) {
			req.setAttribute("Message", "Deleted Successfully");
		}
		ListAllClients(req,resp);
	}
}
