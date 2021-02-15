package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Coupon;
import dao.CouponDAO;
import dao.CouponDAOImpl;

public class CouponController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CouponDAO couponDAO = null;
       
    public CouponController() {
        super();
        couponDAO = new CouponDAOImpl();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String companyName = request.getParameter("companyName");
		String companyURL = request.getParameter("companyURL");
		String code = request.getParameter("code");
		String description = request.getParameter("description");
		String expdate = request.getParameter("exDate");
		
		Coupon coupon = new Coupon();
		coupon.setCompany(companyName);
		coupon.setUrl(companyURL);
		coupon.setDesc(description);
		coupon.setCode(code);
		coupon.setExpdate(expdate);
		
		if(couponDAO.addCoupon(coupon)){
			response.sendRedirect("HomePage.jsp");
		}
		else{
			response.sendRedirect("HomePage.jsp");
		}
	}

}
