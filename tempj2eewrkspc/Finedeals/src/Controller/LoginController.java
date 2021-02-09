 	package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entity.Login;
import Entity.Offers;
import dao.ClientDAO;
import dao.ClientDAOImpl;
import dao.LoginDAO;
import dao.loginDAOImpl;

public class LoginController extends HttpServlet {

	private static final long serialVersionUID = -7036460655583227160L;
	ClientDAO clientDAO = null;
	LoginDAO loginDAO = null;
	List<Offers> list = null;
	RequestDispatcher dispatch = null;
	public LoginController(){
		loginDAO = new loginDAOImpl();
		clientDAO = new ClientDAOImpl();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		Login login = new Login();
		login.setEmail(email);
		login.setPassword(password);
		
		String status = loginDAO.authenticate(login);
		
		if(status=="Admin") {
			session.setAttribute("email", login.getEmail());
			session.setAttribute("password", login.getPassword());
			//resp.sendRedirect("HomePage.jsp");
			resp.sendRedirect("AdminController?action=Front");
			//resp.sendRedirect("ClientController?action=home");
		}
		else if(status=="True") {
			session.setAttribute("email", login.getEmail());
			session.setAttribute("password", login.getPassword());
			req.setAttribute("email", login.getEmail());
			resp.sendRedirect("ClientController?action=home");
		}
		else if(status=="False") {
			resp.sendRedirect("Login.jsp?status=False");
		}
		else if(status=="Error"){
			resp.sendRedirect("Login.jsp?status=Error");
		}
	}
}
