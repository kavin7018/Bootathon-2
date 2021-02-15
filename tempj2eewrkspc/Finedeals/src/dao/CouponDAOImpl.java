package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Entity.Coupon;
import Util.DBConnectionUtil;

public class CouponDAOImpl implements CouponDAO {
	Connection connection = null;
	PreparedStatement preparedstatement = null;
	boolean flag = false;

	public boolean addCoupon(Coupon coupon) {
		flag = false;
		try {
			String Query = "INSERT INTO coupons(company, code, url,description,upvotes,downvotes, expdate,type) VALUES (?,?,?,?,?,?,?,?)";
			connection = DBConnectionUtil.OpenConnection();
			preparedstatement = connection.prepareStatement(Query);
			preparedstatement.setString(1, coupon.getCompany());
			preparedstatement.setString(2, coupon.getCode());
			preparedstatement.setString(3, coupon.getUrl());
			preparedstatement.setString(4, coupon.getDesc());
			preparedstatement.setString(5, Integer.toString(0));
			preparedstatement.setString(6, Integer.toString(0));
			preparedstatement.setString(7, coupon.getExpdate());
			preparedstatement.setString(8, "coupon");
			ResultSet res = preparedstatement.executeQuery();
			return true;
		}
		catch (Exception e) {
			System.out.println("Error at CouponDAOImpl : "+e);
		}
		
		return flag;
	}

}
