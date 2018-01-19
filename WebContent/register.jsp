<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cartlist.dao.UserDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>
	<jsp:useBean id="user" class="com.cartlist.model.UserBean">
		<jsp:setProperty name="user" property="*" />
	</jsp:useBean>
	<jsp:useBean id="obj" class="com.cartlist.dao.UserDAO" />

	<%
		boolean status = obj.validateUser(user);
		out.print("status: " + status);
		if (status) {
			obj.insertUser(user);
			String username = user.getUsername();
			session.setAttribute("user", username);
			response.sendRedirect("index.jsp");

		} else {
	%>
		<jsp:include page="register.html"></jsp:include>
		<script>
			alert("Sorry, user already exists!")
		</script>
	<%
		
		}
	%>


</body>
</html>