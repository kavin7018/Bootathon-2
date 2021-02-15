package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Entity.Offer;
import Util.DBConnectionUtil;

public class OfferDAOImpl implements OfferDAO{
	Connection connection = null;
	PreparedStatement preparedstatement = null;
	boolean flag = false;
	
	public boolean addOffer(Offer offer) {
		flag = false;
		try {
			String Query = "INSERT INTO offers (company, url, offerpercentage, product, description, exdate,upvotes,downvotes) VALUES (?,?,?,?,?,?,?,?)";
			connection = DBConnectionUtil.OpenConnection();
			preparedstatement = connection.prepareStatement(Query);
			preparedstatement.setString(1, offer.getCompanyName());
			preparedstatement.setString(2, offer.getCompanyURL());
			preparedstatement.setString(3, offer.getPercentage());
			preparedstatement.setString(4, offer.getPrname());
			preparedstatement.setString(5, offer.getDescription());
			preparedstatement.setString(6, offer.getExDate());
			preparedstatement.setString(7, Integer.toString(0));
			preparedstatement.setString(8, Integer.toString(0));
			ResultSet res = preparedstatement.executeQuery();
			return true;
		}
		catch (Exception e) {
			System.out.println("Error at CouponDAOImpl : "+e);
		}
		return flag;
	}
}
