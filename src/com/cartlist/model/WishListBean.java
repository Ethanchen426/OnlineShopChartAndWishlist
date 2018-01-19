/**
 * 
 */
package com.cartlist.model;

import java.util.ArrayList;



public class WishListBean {
	private ArrayList<ProductBean> wishlist = new ArrayList<>();
	private String username;
	/**
	 * @return the wishlist
	 */
	public ArrayList<ProductBean> getWishlist() {
		return wishlist;
	}
	/**
	 * @param wishlist the wishlist to set
	 */
	public void setWishlist(ArrayList<ProductBean> wishlist) {
		this.wishlist = wishlist;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	public boolean addToWishList(ProductBean product){
		boolean exist = false;
		boolean update = false;
		for(int i=0;i<wishlist.size();i++){
			if(wishlist.get(i).getProduct().equals(product.getProduct())){
				int quant = wishlist.get(i).getQuantity();
				wishlist.get(i).setQuantity(quant + product.getQuantity());
				exist = true;
				update = true;
			}
		}
		if(!exist)
			wishlist.add(product);
		
		return update;
	}
	
	public void addToWishlist(int index, ProductBean product){
		wishlist.add(index, product);
	}
	
	public void removeFromList(int index){
		wishlist.remove(index);
	}
	

	
}
