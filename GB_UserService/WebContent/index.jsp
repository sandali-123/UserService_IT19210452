<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.Users"%>
    <%@page import="com.UserAPI"%>
    <%
if (session.getAttribute("username") != null)
 {
 response.sendRedirect("welcome.jsp");
 }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/auth.js"></script>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">GadgetBadget System</a>
    <form class="form-inline">
    <button class="btn btn-lg btn-outline-primary" type="button"><a href = "register.jsp">&nbsp  &nbsp SignUp &nbsp &nbsp</a></button>
 
  </form>
  </div>
</nav><br><br><br>
<div class="container">

<div class="row">
<div class="col-6">
<h1>Login</h1>

<form id="formLogin">
Enter Username:
 <input id="txtUsername" name="txtUsername" type="text"
 class="form-control form-control-sm"><br>
 Enter Password:
 <input id="txtPassword" name="txtPassword" type="password"
 class="form-control form-control-sm">
 <br>
 <input id="btnLogin" name="btnLogin" type="button" value="Login"
 class="btn btn-primary btn-lg active">
 <br>
 <br>
 <div id="alertError" class="alert alert-danger"></div>
</form>
 </div>
</div>
</div>

</body>
</html>
