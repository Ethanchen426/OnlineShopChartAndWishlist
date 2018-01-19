<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<title>Online Shop</title>
<style>
.row {
	text-align:center
}
</style>
</head>
<body>
	<div class="container">
		
		<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="#">Online Shopping</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li class="active"><a href="index.jsp">Home</a></li>
		      <li><a href="myCart.jsp">My Cart</a></li>
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



		<div class="row">
			<div class="col-sm-4">Product name</div>
			<div class="col-sm-4">Quantity</div>
			<div class="col-sm-4">Action</div>
			<hr>
		</div>
		
		

		<div class="row">
			<form name="product1" method="post" action="crud.jsp">
				<div class="col-sm-4">
					iPhone 6 <input type="hidden" name="product" value="iPhone 6">
				</div>
				<div class="col-sm-4">
					<input type="number" name="quantity" step="1" min="1" value="1">

				</div>
				<div class="col-sm-4">
					<input type="submit" name="action" value="Add To Cart" class='btn btn-primary'> 
					<input type="submit" name="action" value="Add To Wishlist" class='btn btn-info'>
				</div>
			</form>
			
		</div>
		<hr>

		<div class="row">
			<form name="product2" method="post" action="crud.jsp">
				<div class="col-sm-4">
					iPhone 6s <input type="hidden" name="product" value="iPhone 6s">
				</div>
				<div class="col-sm-4">
					<input type="number" name="quantity" step="1" min="1" value="1">
				</div>
				<div class="col-sm-4">
					<input type="submit" name="action" value="Add To Cart" class='btn btn-primary'> 
					<input type="submit" name="action" value="Add To Wishlist" class='btn btn-info'>
				</div>
			</form>
		</div>
		<hr>

		<div class="row">
			<form name="product3" method="post" action="crud.jsp">
				<div class="col-sm-4">
					iPhone 7 <input type="hidden" name="product" value="iPhone 7">
				</div>
				<div class="col-sm-4">
					<input type="number" name="quantity" step="1" min="1" value="1">
				</div>
				<div class="col-sm-4">
					<input type="submit" name="action" value="Add To Cart" class='btn btn-primary'> 
					<input type="submit" name="action" value="Add To Wishlist" class='btn btn-info'>
				</div>
			</form>
		</div>
		<hr>

		<div class="row">
			<form name="product4" method="post" action="crud.jsp">
				<div class="col-sm-4">
					Nova <input type="hidden" name="product" value="Nova">
				</div>
				<div class="col-sm-4">
					<input type="number" name="quantity" step="1" min="1" value="1">
				</div>
				<div class="col-sm-4">
					<input type="submit" name="action" value="Add To Cart" class='btn btn-primary'> 
					<input type="submit" name="action" value="Add To Wishlist" class='btn btn-info'>
				</div>
			</form>
		</div>
		<hr>

		<div class="row">
			<form name="product5" method="post" action="crud.jsp">
				<div class="col-sm-4">
					Mate 9 <input type="hidden" name="product" value="Mate 9">
				</div>
				<div class="col-sm-4">
					<input type="number" name="quantity" step="1" min="1" value="1">
				</div>
				<div class="col-sm-4">
					<input type="submit" name="action" value="Add To Cart" class='btn btn-primary'> 
					<input type="submit" name="action" value="Add To Wishlist" class='btn btn-info'>
				</div>
			</form>
		</div>
		<hr>

		<div class="row">
			<form name="product6" method="post" action="crud.jsp">
				<div class="col-sm-4">
					Mate 9 Pro <input type="hidden" name="product" value="Mate 9 Pro">
				</div>
				<div class="col-sm-4">
					<input type="number" name="quantity" step="1" min="1" value="1">
				</div>
				<div class="col-sm-4">
					<input type="submit" name="action" value="Add To Cart" class='btn btn-primary'> 
					<input type="submit" name="action" value="Add To Wishlist" class='btn btn-info'>
				</div>
			</form>
		</div>
		<hr>

		<div class="row">
			<form name="product7" method="post" action="crud.jsp">
				<div class="col-sm-4">
					S6 <input type="hidden" name="product" value="S6">
				</div>
				<div class="col-sm-4">
					<input type="number" name="quantity" step="1" min="1" value="1">
				</div>
				<div class="col-sm-4">
					<input type="submit" name="action" value="Add To Cart" class='btn btn-primary'> 
					<input type="submit" name="action" value="Add To Wishlist" class='btn btn-info'>
				</div>
			</form>
		</div>
		<hr>

		<div class="row">
			<form name="product8" method="post" action="crud.jsp">
				<div class="col-sm-4">
					S6 Edge<input type="hidden" name="product" value="S6 Edge">
				</div>
				<div class="col-sm-4">
					<input type="number" name="quantity" step="1" min="1" value="1">
				</div>
				<div class="col-sm-4">
					<input type="submit" name="action" value="Add To Cart" class='btn btn-primary'> 
					<input type="submit" name="action" value="Add To Wishlist" class='btn btn-info'>
				</div>
			</form>
		</div>
		<hr>

		<div class="row">
			<form name="product9" method="post" action="crud.jsp">
				<div class="col-sm-4">
					Note 7<input type="hidden" name="product" value="Note 7">
				</div>
				<div class="col-sm-4">
					<input type="number" name="quantity" step="1" min="1" value="1">
				</div>
				<div class="col-sm-4">
					<input type="submit" name="action" value="Add To Cart" class='btn btn-primary'> 
					<input type="submit" name="action" value="Add To Wishlist" class='btn btn-info'>
				</div>
			</form>
		</div>
		<hr>

	</div>
	<script src="script.js"></script>
</body>
</html>