package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entity.Login;
import dao.LoginDAO;
import dao.loginDAOImpl;

public class LoginController extends HttpServlet {

	private static final long serialVersionUID = -7036460655583227160L;
	LoginDAO loginDAO = null;
	public LoginController(){
		loginDAO = new loginDAOImpl();
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
			resp.sendRedirect("AdminController?action=LIST");
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
