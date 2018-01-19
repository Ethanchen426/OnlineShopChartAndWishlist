<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cartlist.model.CartBean"%>
<%@ page import="com.cartlist.model.UserBean"%>
<%@ page import="com.cartlist.model.WishListBean"%>
<%@ page import="com.cartlist.dao.WishListDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRUD</title>
</head>
<body>
	<jsp:useBean id="cart" class="com.cartlist.model.CartBean">
		<jsp:setProperty name="cart" property="*" />
	</jsp:useBean>

	<jsp:useBean id="wishlist" class="com.cartlist.model.WishListBean">
		<jsp:setProperty name="wishlist" property="*" />
	</jsp:useBean>
	<jsp:useBean id="wishlist_obj" class="com.cartlist.dao.WishListDAO" />

	<jsp:useBean id="product" class="com.cartlist.model.ProductBean">
		<jsp:setProperty name="product" property="*" />
	</jsp:useBean>

	<jsp:useBean id="user" class="com.cartlist.model.UserBean">
		<jsp:setProperty name="user" property="*" />
	</jsp:useBean>


	<%
		String action = request.getParameter("action");
		cart = (CartBean) session.getAttribute("cart");
		String username = (String) session.getAttribute("user");
		wishlist = (WishListBean) session.getAttribute("wishlist");

		if (action.equals("Add To Cart")) {

			if (cart == null) {
				cart = new CartBean();
			}

			cart.addToCart(product);

			session.setAttribute("cart", cart);

			response.sendRedirect("myCart.jsp");

		} else if (action.equals("Delete")) {
			int id = Integer.parseInt(request.getParameter("id"));

			cart.removeFromCart(id);

			session.setAttribute("cart", cart);

			response.sendRedirect("myCart.jsp");


		} else if (action.equals("Update")) {
			int id = Integer.parseInt(request.getParameter("id"));

			cart.removeFromCart(id);
			cart.addToCart(id, product);

			session.setAttribute("cart", cart);

			response.sendRedirect("myCart.jsp");

		} else if (action.equals("Add To Wishlist")) {
			
			if(username == null){
				response.sendRedirect("portal.jsp");
			}else{
				if (wishlist == null) {
					wishlist = new WishListBean();
					wishlist.setUsername(username);
				}
				
				
				boolean update = wishlist.addToWishList(product);
				if(update){
					wishlist_obj.updateList(product, username);
				}else{
					wishlist_obj.insertList(product, username);
				}
				
				session.setAttribute("wishlist", wishlist);
				
				response.sendRedirect("myWishList.jsp");	
			}

		} else if (action.equals("Update List")){
			int id = Integer.parseInt(request.getParameter("wish_id"));
			
			wishlist.removeFromList(id);
			wishlist.addToWishlist(id, product);
			
			session.setAttribute("wishlist", wishlist);
			
			wishlist_obj.updateQuant(product, username);
			
			response.sendRedirect("myWishList.jsp");
			
		} else if (action.equals("Remove")){
			int id = Integer.parseInt(request.getParameter("wish_id"));
			
			wishlist.removeFromList(id);
			
			wishlist_obj.deleteFromList(product, username);
			
			session.setAttribute("wishlist", wishlist);
			
			response.sendRedirect("myWishList.jsp");
		} else if (action.equals("Buy now")){
			int id = Integer.parseInt(request.getParameter("wish_id"));
			
			wishlist.removeFromList(id);
			
			wishlist_obj.deleteFromList(product, username);
			
			cart.addToCart(product);
			
			session.setAttribute("wishlist", wishlist);
			
			session.setAttribute("cart", cart);
			
			response.sendRedirect("myCart.jsp");
		} else if(action.equals("Buy later")){
			
			if(username == null){
				response.sendRedirect("portal.jsp");
			}else{
				if (wishlist == null) {
					wishlist = new WishListBean();
					wishlist.setUsername(username);
				}
				int id = Integer.parseInt(request.getParameter("id"));
				
				boolean update = wishlist.addToWishList(product);
				if(update){
					wishlist_obj.updateList(product, username);
				}else{
					wishlist_obj.insertList(product, username);
				}
				
				cart.removeFromCart(id);
				
				session.setAttribute("cart", cart);
				
				session.setAttribute("wishlist", wishlist);
				
				response.sendRedirect("myWishList.jsp");	
			}
		}
			
	%>

</body>
</html>