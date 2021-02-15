package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Entity.Gift;
import Util.DBConnectionUtil;

public class GiftDAOImpl implements GiftDAO {
	Connection connection = null;
	PreparedStatement preparedstatement = null;
	boolean flag = false;

	public boolean addGift(Gift gift) {
		flag = false;
		try {
			String Query = "INSERT INTO gift (company, url, percentage, description, exdate,upvotes,downvotes) VALUES (?,?,?,?,?,?,?)";
			connection = DBConnectionUtil.OpenConnection();
			preparedstatement = connection.prepareStatement(Query);
			preparedstatement.setString(1, gift.getCompanyName());
			preparedstatement.setString(2, gift.getCompanyURL());
			preparedstatement.setString(3, gift.getPercentage());
			preparedstatement.setString(4, gift.getDescription());
			preparedstatement.setString(5, gift.getExDate());
			preparedstatement.setString(6, Integer.toString(0));
			preparedstatement.setString(7, Integer.toString(0));
			ResultSet res = preparedstatement.executeQuery();
			return true;
		}
		catch (Exception e) {
			System.out.println("Error at CouponDAOImpl : "+e);
		}
		return flag;
	}
}
