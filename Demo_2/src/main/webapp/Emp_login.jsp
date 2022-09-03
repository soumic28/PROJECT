<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMPLOYEE Login Page</title>
<link rel="stylesheet" href="logins.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<form class="box" action="login_emp" method="post" autocomplete="off">
	  <h1>L O G I N</h1>
	  <input type="text" name="emp_name" placeholder="Your Name Here">
	  <input type="password" name="emp_password" placeholder="Your ID Here">
	  <input type="submit" value="Log In">
</form>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var status = document.getElementById("status").value;
if (status == "failed")
	{
	swal("Wrong Username or Password","Please Try again","error");
	}
</script>
</body>
</html>