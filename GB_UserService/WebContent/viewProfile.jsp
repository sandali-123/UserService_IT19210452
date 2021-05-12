
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.Users"%>
<%@page import="com.UserAPI"%>
<%@page import="com.AuthAPI"%>

         <%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View profile</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/auth.js"></script>
<script src="Components/user.js"></script>
</head>
<body>
	<nav class="navbar navbar-dark bg-dark">

		<a class="navbar-brand" href="#">GadgetBadget System</a>
		<form class="form-inline">
<input id="btnHi" name="btnHi" type="button" 
				value= "HI <%=session.getAttribute("username")%>" class="btn btn-lg btn-outline-primary">
&nbsp &nbsp &nbsp
			<a href="Home.jsp"><input id="btnHome" name="btnHome"
				type="button" value="Home" class="btn btn-primary btn-lg"></a>
			&nbsp &nbsp &nbsp<input id="btnLogout" name="btnLogout" type="button"
				value="Logout" class="btn btn-primary btn-lg">
		</form>
	</nav>
	<br>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-6">

				<h2>Manage User Profile</h2>
				<form id="formItem" name="formItem" >

					First name: <input id="fname" name="fname" type="text"
						class="form-control form-control-sm"><br> Last name:
					<input id="lname" name="lname" type="text"
						class="form-control form-control-sm"><br> NIC : <input
						id="nic" name="nic" type="text"
						class="form-control form-control-sm"><br> Address: <input
						id="addr" name="addr" type="text"
						class="form-control form-control-sm"><br> Phone No: <input
						id="pno" name="pno" type="text"
						class="form-control form-control-sm"><br> Email
					address: <input id="email" name="email" type="text"
						class="form-control form-control-sm"><br> Username: <input
						id="uname" name="uname" type="text"
						class="form-control form-control-sm"><br> Password:
					<input id="pwd" name="pwd" type="text"
						class="form-control form-control-sm"> <br> Type (Researcher / Buyer / Seller): <input
						id="type" name="type" type="text"
						class="form-control form-control-sm"> <br> <input
						id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary btn-lg btn-block"> <input
						type="hidden" id="hidUserIDSave" name="hidUserIDSave" value="">


				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>

				<br>
				
<br>
			</div>
		</div>

	</div><div class="row justify-content-center">
<div id="divItemsGrid">
					<%
						Users userObj = new Users();
						out.print(userObj.viewRegUsers());
					%>
				</div></div><br>
</body>
</html>