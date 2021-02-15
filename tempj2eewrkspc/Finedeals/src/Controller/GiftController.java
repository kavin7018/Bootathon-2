package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Gift;
import dao.GiftDAO;
import dao.GiftDAOImpl;

public class GiftController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GiftDAO giftDAO = null;
	
    public GiftController() {
        super();
        giftDAO = new GiftDAOImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String companyName = request.getParameter("companyName");
		String companyURL = request.getParameter("CompanyURL");
		String percentage = request.getParameter("percentage");
		String prname = request.getParameter("prname");
		String description = request.getParameter("description");
		String exDate = request.getParameter("exDate");
		
		Gift gift = new Gift();
		
		gift.setCompanyName(companyName);
		gift.setCompanyURL(companyURL);
		gift.setDescription(description);
		gift.setPrname(prname);
		gift.setPercentage(percentage);
		gift.setExDate(exDate);
				
		if(giftDAO.addGift(gift)){
			response.sendRedirect("HomePage.jsp");
		}
		else{
			response.sendRedirect("HomePage.jsp");
		}
	}
}