package demo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.dao.EmployeeDAO;
import demo.dao.EmployeeDAOImpl;
import demo.entity.Employee;

//@WebServlet("/EmployeeController")
public class EmployeeController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	RequestDispatcher  dispatcher = null;
	EmployeeDAO employeeDAO = null;
	List<Employee> list;
	
	public EmployeeController(){
		employeeDAO = new EmployeeDAOImpl();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action==null) {
			action = "LIST";
		}
		
		switch(action) {
			case "LIST":
				listEmployees(request,response);
				break;
				
			case "EDIT":
				getsingleEmployee(request,response);
				break;
				
			case "DELETE":
				deleteEmployee(request,response);
				
			default:
				listEmployees(request,response);
				break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Name = request.getParameter("name");
		String id = request.getParameter("id");
		String dob = request.getParameter("dob");
		String dept = request.getParameter("dept");
		
		Employee e = new Employee();
		e.setName(Name);
		e.setDob(dob);
		e.setDept(dept);
		
		if(id.isEmpty() || id==null) {
			if(employeeDAO.save(e)) {
				request.setAttribute("Message", "Added Successfully");
			}
		}
		else {
			e.setId(Integer.parseInt(id));
			if(employeeDAO.update(e)) {
				request.setAttribute("Message", "Updated Successfully");
			}
		}
		listEmployees(request,response);
	}
	
	public void listEmployees(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		list = employeeDAO.get();
		request.setAttribute("list", list);
		dispatcher = request.getRequestDispatcher("/views/employee-list.jsp");
		dispatcher.forward(request, response);
	}
	
	public void getsingleEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Employee employee =  new EmployeeDAOImpl().get(Integer.parseInt(id));
		request.setAttribute("Employee", employee);
		dispatcher = request.getRequestDispatcher("/views/employee-add.jsp");
		dispatcher.forward(request, response);
	}
	
	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(employeeDAO.delete(Integer.parseInt(id))) {
			request.setAttribute("Message", "Deleted Successfully");
		}
		listEmployees(request,response);
	}
}
