<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Deletion</title>
<link rel="stylesheet" href="logins.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>

	<form class="box" action="Delete" method="post" autocomplete="off">
	  <h1>DELETE EMPLOYEE DATA</h1>
	  <input type="text" name="empId" placeholder="Enter Employee ID" required="required">
	  <input type="submit" value="DELETE">
	</form>
	
	<input type="hidden" id="delete" value="<%= request.getAttribute("delete") %>">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		var status = document.getElementById("delete").value;
		if(status == "deleted"){
			swal("Deleted","Records Deleted Successfully","success");
		}
	</script>
</body>
</html>