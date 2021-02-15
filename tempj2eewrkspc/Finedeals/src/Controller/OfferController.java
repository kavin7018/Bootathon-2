package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Offer;
import dao.OfferDAO;
import dao.OfferDAOImpl;

public class OfferController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OfferDAO offerDAO = null;
       
    public OfferController() {
        super();
        offerDAO = new OfferDAOImpl();
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
		
		Offer offer = new Offer();
		
		offer.setCompanyName(companyName);
		offer.setCompanyURL(companyURL);
		offer.setDescription(description);
		offer.setPrname(prname);
		offer.setPercentage(percentage);
		offer.setExDate(exDate);
		
		if(offerDAO.addOffer(offer)){
			response.sendRedirect("HomePage.jsp");
		}
		else{
			response.sendRedirect("HomePage.jsp");
		}
	}

}
