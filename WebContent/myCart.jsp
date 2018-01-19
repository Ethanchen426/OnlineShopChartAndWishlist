<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cartlist.model.CartBean" %>
<%@ page import="com.cartlist.model.ProductBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Cart</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.row {
	text-align:center
}
</style>
</head>
<body>
<jsp:useBean id="cart" class="com.cartlist.model.CartBean" >
<jsp:setProperty name="cart" property="*"/>
</jsp:useBean>
	<div class="container">
		<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="index.jsp">Online Shopping</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li><a href="index.jsp">Home</a></li>
		      <li class="active"><a href="myCart.jsp">My Cart</a></li>
		      <li><a href="myWishList.jsp">My Wishlist</a></li>
		    </ul>
		    <ul class="nav navbar-nav navbar-right">
		    	<%
					String user = (String) session.getAttribute("user");
					if (user != null) {
				%>
		      	<li><a href="#"><span class="glyphicon glyphicon-user"></span><%=user%></a></li>
		      	<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		      	<%
					} else {
				%>
						<li><a href="register.html"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					    <li><a href="portal.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				<%
					}
				%>
		    </ul>
		  </div>
		</nav>
	<%
		out.println("<h3>You have the following items in your cart:</h3>");
	%>
		<div class="row">
			<div class="col-sm-4">Product name</div>
			<div class="col-sm-4">Quantity</div>
			<div class="col-sm-4">Action</div>
			<hr>
		</div>
	<%

		if (session.getAttribute("cart") != null) {
			cart =  (CartBean) session.getAttribute("cart");
			ArrayList<ProductBean> pList = cart.getCart();
			for (int i = 0; i < pList.size(); i++) {
				out.println("<div class='row'><form method='post' action='crud.jsp'>");
				out.println("<div class='col-sm-4'><input type='hidden' name='product' value='" + pList.get(i).getProduct() + "'>"
							+pList.get(i).getProduct()+"</div>");
				out.println("<div class='col-sm-4'><input type='number' name='quantity' step='1' min='1' value='" + pList.get(i).getQuantity() + "'></div>");
				out.println("<div class='col-sm-4'>"
							+"<input type='submit' name='action' value='Update' class='btn btn-primary'>"
							+"<input type='submit' name='action' value='Delete' class='btn btn-info'><input type='hidden' name='id' value='"+i+"'>"
							+"<input type='submit' name='action' value='Buy later' class='btn btn-default'></div>");
				out.println("</form></div><hr>");
			}
		}

		out.println("<a href='index.jsp'><input type='button' value='Back' class='btn btn-info' style='float: right;'/></a></p>");
	%>
	</div>
	<script src="script.js"></script>
</body>
</html>