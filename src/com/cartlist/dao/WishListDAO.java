/**
 * 
 */
package com.cartlist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cartlist.model.ProductBean;
import com.cartlist.model.WishListBean;


public class WishListDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public WishListDAO(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection
					("jdbc:mysql://localhost:3306/mydb","root","123456");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void updateList(ProductBean product, String username) throws SQLException{
		ps = con.prepareStatement("select pquant from wishlist where pname=? and user=?");
		ps.setString(1, product.getProduct());
		ps.setString(2, username);
		rs = ps.executeQuery();
		int x = 0;
		if(rs.next()){
			 x = rs.getInt(1);
		}
		ps = con.prepareStatement("update wishlist set pquant=? where user=?");
		ps.setInt(1, product.getQuantity() + x);
		ps.setString(2, username);
		ps.executeUpdate();
	}
	
	
	
	public void updateQuant(ProductBean product, String username) throws SQLException{
		ps = con.prepareStatement("update wishlist set pquant=? where pname=? and user=?");
		ps.setInt(1, product.getQuantity());
		ps.setString(2, product.getProduct());
		ps.setString(3, username);
		ps.executeUpdate();
	}
	
	public int insertList(ProductBean product, String username) throws SQLException{
		
		ps = con.prepareStatement("insert into wishlist values (default, ?, ?, ?)");
		ps.setString(1, username);
		ps.setString(2, product.getProduct());
		ps.setInt(3, product.getQuantity());
		int x = ps.executeUpdate();
		return x;

	}
	
	public WishListBean getList(String username) throws SQLException{
		WishListBean wishlist = new WishListBean();
		ArrayList<ProductBean> pList = new ArrayList<>();
		ps = con.prepareStatement("select pname, pquant from wishlist where user=?");
		ps.setString(1, username);
		rs = ps.executeQuery();
		while(rs.next()){
			ProductBean product = new ProductBean();
			product.setProduct(rs.getString(1));
			product.setQuantity(rs.getInt(2));
			pList.add(product);
		}
		wishlist.setWishlist(pList);
		
		return wishlist;
	}
	
	public void deleteFromList(ProductBean product, String username) throws SQLException{
		ps = con.prepareStatement("delete from wishlist where pname=? and pquant=? and user=?");
		ps.setString(1, product.getProduct());
		ps.setInt(2, product.getQuantity());
		ps.setString(3, username);
		ps.executeUpdate();
	}
	
	
	
}
