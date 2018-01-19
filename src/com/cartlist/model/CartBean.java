/**
 * 
 */
package com.cartlist.model;

import java.util.ArrayList;


public class CartBean {
	private ArrayList<ProductBean> cart = new ArrayList<>();

	/**
	 * @return the cart
	 */
	public ArrayList<ProductBean> getCart() {
		return cart;
	}

	/**
	 * @param cart the cart to set
	 */
	public void setCart(ArrayList<ProductBean> cart) {
		this.cart = cart;
	}
	
	public void addToCart(ProductBean product){
		boolean exist = false;
		for(int i=0;i<cart.size();i++){
			if(cart.get(i).getProduct().equals(product.getProduct())){
				int quant = cart.get(i).getQuantity();
				cart.get(i).setQuantity(quant + product.getQuantity());
				exist = true;
			}
		}
		if(!exist)
			cart.add(product);
	}
	
	public void addToCart(int index, ProductBean product){
		cart.add(index, product);
	}
	
	public void removeFromCart(int index){
		cart.remove(index);
	}
	
}
