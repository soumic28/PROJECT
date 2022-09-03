<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="ISO-8859-1">
<title>ADMIN Login Page</title>
<link rel="stylesheet" href="logins.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">
	    <style>
	    h1{
	    color:white;
	    text-shadow:5px 5px 10px black;
	    }
	    </style>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<form class="box" action="login" method="post" autocomplete="off">
	  <h1>A D M I N - L O G I N</h1>
	  <input type="text" name="name_1" placeholder="Username">
	  <input type="password" name="password_1" placeholder="Password">
	  <input type="submit" value="Log In">
	  <a href="Emp_login.jsp" target="_blank">Log In as an Employee</a>
</form>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var status = document.getElementById("status").value;
if (status == "failed")
	{
	swal("Wrong Username or Password","Try again","error");
	}
</script>
</body>
</html>