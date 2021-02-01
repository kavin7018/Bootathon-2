package demo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import demo.dao.LoginDAO;
import demo.dao.LoginDAOImpl;
import demo.entity.Login;

public class LoginController extends HttpServlet{
	
	private static final long serialVersionUID = -2882422282807205798L;
	
	LoginDAO loginDAO = null;
	
	public LoginController(){
		loginDAO = new LoginDAOImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mailid = req.getParameter("mail-id");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		Login login = new Login();
		login.setEmail(mailid);
		login.setPassword(password);
		
		String status = loginDAO.authenticate(login);
		
		if(status=="True") {
			session.setAttribute("mail-id", login.getEmail());
			resp.sendRedirect("EmployeeController?action=LIST");
		}
		
		else if(status=="False") {
			resp.sendRedirect("index.jsp?status=False");
		}
		
		else if(status=="Error") {
			resp.sendRedirect("index.jsp?status=Error");
		}
	}
}
